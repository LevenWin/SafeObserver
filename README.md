#SafeObserver 

主要方法:
```
@interface NSObject (safeObserver)

- (void)safeObserver:(NSObject *)observer
          forKeyPath:(NSString *)keyPath
             options:(NSKeyValueObservingOptions)options
             context:(nullable void *)context;

@end

```


