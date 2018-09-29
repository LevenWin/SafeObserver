//
//  TestViewController.m
//  SafeObserver
//
//  Created by leven on 2018/9/29.
//  Copyright © 2018年 leven. All rights reserved.
//

#import "TestViewController.h"
#import "DataManager.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DataManager addObserverForCount:self];
}

-  (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"TestVC : %@", change);
}

- (IBAction)addAction:(id)sender {
    [DataManager increaseCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
