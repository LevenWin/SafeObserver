//
//  DataManager.h
//  SafeObserver
//
//  Created by leven on 2018/9/29.
//  Copyright © 2018年 leven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
@property (nonatomic, assign, readonly) NSInteger count;
+ (void)increaseCount;
+ (void)addObserverForCount:(id)observer;
@end
