//
//  LCKeyValueObserverCenter.m
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import "LCKeyValueObserverCenter.h"
#import "LCKeyValueObserver.h"
#import "NSObject+LCRunAtDealloc.h"

@interface LCKeyValueObserverCenter ()
@property (nonatomic, strong) NSMutableArray<LCKeyValueObserver *> *observers;
@property (nonatomic, strong) NSMutableSet *observedObjects;
@property (nonatomic, strong) NSMutableDictionary *observerDic;
@end

@implementation LCKeyValueObserverCenter

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static LCKeyValueObserverCenter *instance;
    dispatch_once(&onceToken, ^{
        instance = [[LCKeyValueObserverCenter alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observers = [NSMutableArray array];
        self.observedObjects = [NSMutableSet set];
        self.observerDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)lc_addObserveObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector {
    return [self lc_addObserveObject:object keyPath:keyPath target:target selector:selector options:0];
}

- (void)lc_addObserveObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options {
    LCKeyValueObserver *observer = [[LCKeyValueObserver alloc] initWithObject:object keyPath:keyPath target:target selector:selector options:options];
    if ([_observerDic.allKeys containsObject:object]) {
        [_observerDic[object] addObject:observer];
    } else {
        _observerDic[object] = [NSMutableArray arrayWithObject:observer];
    }
    [_observers addObject:observer];
    [_observedObjects addObject:object];
}
@end
