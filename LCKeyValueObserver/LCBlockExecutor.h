//
//  LCBlockExecutor.h
//  LCKeyValueObserver
//
//  Created by lcj on 16/8/8.
//  Copyright © 2016年 lcj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^voidBlock)(void);

@interface LCBlockExecutor : NSObject
- (id)initWithBlock:(voidBlock)block;
@end


