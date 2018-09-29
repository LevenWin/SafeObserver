//
//  DataManager.m
//  SafeObserver
//
//  Created by leven on 2018/9/29.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "DataManager.h"
#import "NSObject+safeObserver.h"

@interface DataManager()
@property (nonatomic, assign) NSInteger count;
@end
@implementation DataManager

+ (instancetype)sharedInstnce {
    static DataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DataManager new];
    });
    return manager;
}

+ (void)increaseCount {
    DataManager *m = [DataManager sharedInstnce];
    NSLog(@"%@",m.observationInfo);
    m.count ++;
}

+ (void)addObserverForCount:(id)observer {
    DataManager *m = [DataManager sharedInstnce];
    [m safeObserver:observer forKeyPath:@"count" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

@end
