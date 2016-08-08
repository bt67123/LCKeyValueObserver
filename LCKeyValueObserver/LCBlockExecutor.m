//
//  LCBlockExecutor.m
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import "LCBlockExecutor.h"

@interface LCBlockExecutor() {
    voidBlock _block;
}
@end

@implementation LCBlockExecutor

- (id)initWithBlock:(voidBlock)aBlock {
    self = [super init];
    
    if (self) {
        _block = [aBlock copy];
    }
    
    return self;
}

- (void)dealloc {
    _block ? _block() : nil;
}

@end
