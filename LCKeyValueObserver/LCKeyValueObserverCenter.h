//
//  LCKeyValueObserverCenter.h
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LCKeyValueObserver;

@interface LCKeyValueObserverCenter : NSObject
@property (nonatomic, strong, readonly) NSMutableArray<LCKeyValueObserver *> *observers;
@property (nonatomic, strong, readonly) NSMutableSet *observedObjects;
@property (nonatomic, strong, readonly) NSMutableDictionary *observerDic;

+ (instancetype)sharedInstance;
- (void)lc_addObserveObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector;
- (void)lc_addObserveObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options;
@end
