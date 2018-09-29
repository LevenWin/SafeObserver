//
//  ViewController.m
//  SafeObserver
//
//  Created by leven on 2018/9/29.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DataManager addObserverForCount:self];
    
}

- (IBAction)pushAction:(id)sender {
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
    
}

- (IBAction)addAction:(id)sender {
    [DataManager increaseCount];
}

-  (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"ViewVC : %@", change);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
