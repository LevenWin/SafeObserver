//
//  NSObject+safeObserver.m
//  SafeObserver
//
//  Created by leven on 2018/9/29.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "NSObject+safeObserver.h"
#import <objc/runtime.h>

@interface _SafeObserver : NSObject
@property (nonatomic, weak) id target;
@property (nonatomic, weak) id observer;
@property (nonatomic, copy) NSString *path;
@end

@implementation _SafeObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([self.observer respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]) {
        [self.observer observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    [_target removeObserver:self forKeyPath:_path];
}

@end

@implementation NSObject (safeObserver)

- (void)safeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    NSMutableArray *safeObservers = objc_getAssociatedObject(observer, _cmd);
    if (!safeObservers) {
        safeObservers = @[].mutableCopy;
    }else {
        safeObservers = safeObservers.mutableCopy;
    }
    for (_SafeObserver *safeItem in safeObservers) {
        if ([safeItem.target isEqual: self]
            && [safeItem.path isEqualToString:keyPath]) {
            return;
        }
    }
    _SafeObserver *safeItem = [_SafeObserver new];
    safeItem.observer = observer;
    safeItem.target = self;
    safeItem.path = keyPath;
    [safeObservers addObject:safeItem];
    objc_setAssociatedObject(observer, _cmd, safeObservers, OBJC_ASSOCIATION_RETAIN);
    [self addObserver:safeItem  forKeyPath:keyPath options:options context:context];
}

@end
