//
//  NSObject+LCRunAtDealloc.m
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import "NSObject+LCRunAtDealloc.h"
#import <objc/runtime.h>

@implementation NSObject (LCRunAtDealloc)
- (void)lc_runAtDealloc:(voidBlock)block {
    if (block) {
        LCBlockExecutor *executor = [[LCBlockExecutor alloc] initWithBlock:block];
        
        objc_setAssociatedObject(self,
                                 &runAtDeallocBlockKey,
                                 executor,
                                 OBJC_ASSOCIATION_RETAIN);
    }
}

@end
