//
//  LCKeyValueObserver.h
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCKeyValueObserver : NSObject

@property (nonatomic, weak, readonly) id observedObject;
@property (nonatomic, weak, readonly) id target;
@property (nonatomic, copy, readonly) NSString* keyPath;
@property (nonatomic, readonly) SEL selector;

- (id)initWithObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options;
+ (NSObject *)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector __attribute__((warn_unused_result));
+ (NSObject *)observeObject:(id)object keyPath:(NSString*)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options __attribute__((warn_unused_result));

@end
