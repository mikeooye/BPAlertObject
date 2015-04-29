//
//  ViewController.m
//  BPAlertObject
//
//  Created by LiHaozhen on 15/4/29.
//  Copyright (c) 2015年 ihojin. All rights reserved.
//

#import "ViewController.h"
#import "BPAlertObject.h"

@interface ViewController ()<BPAlertObjectDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - AlertObject delegate
- (void)alertObjectDidClickCancel:(BPAlertObject *)obj
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
- (void)alertObjectDidClickOther:(BPAlertObject *)obj
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
@end
