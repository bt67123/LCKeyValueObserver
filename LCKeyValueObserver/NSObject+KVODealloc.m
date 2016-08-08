//
//  NSObject+KVODealloc.m
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import "NSObject+KVODealloc.h"
#import "LCKeyValueObserverCenter.h"
#import "LCKeyValueObserver.h"
#import <objc/runtime.h>

@implementation NSObject (KVODealloc)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                                 class_getInstanceMethod(self.class, @selector(lc_dealloc)));
}

- (void)lc_dealloc {
    LCKeyValueObserverCenter *center = [LCKeyValueObserverCenter sharedInstance];
    if ([center.observerDic.allKeys containsObject:self]) {
        for (LCKeyValueObserver *observer in center.observerDic[self]) {
            [observer.observedObject removeObserver:observer forKeyPath:observer.keyPath];
        }
    }
}
@end
