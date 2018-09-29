//
//  NSObject+safeObserver.h
//  SafeObserver
//
//  Created by leven on 2018/9/29.
//  Copyright © 2018年 leven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (safeObserver)

- (void)safeObserver:(NSObject *)observer
          forKeyPath:(NSString *)keyPath
             options:(NSKeyValueObservingOptions)options
             context:(nullable void *)context;

@end
