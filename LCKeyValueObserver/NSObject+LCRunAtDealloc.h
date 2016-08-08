//
//  NSObject+LCRunAtDealloc.h
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCBlockExecutor.h"

//const void *runAtDeallocBlockKey;
static char runAtDeallocBlockKey;

@interface NSObject (LCRunAtDealloc)
- (void)lc_runAtDealloc:(voidBlock)block;
@end
