//
// Created by sakim on 14. 11. 30..
// Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPBasicViewController.h"
#import "CPAutoLayout.h"

@implementation CPBasicViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Basic";
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];

    // top-left
    UIView *topLeft = [[UIView alloc] init];
    topLeft.backgroundColor = [UIColor colorWithRed:0.88 green:0.72 blue:0.71 alpha:1];
    [self.view addSubview:topLeft];
    [topLeft setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop | CPAlignmentLeft);
        builder.size.value(CGSizeMake(70, 70));
    }];

    // top
    UIView *top = [[UIView alloc] init];
    top.backgroundColor = [UIColor colorWithRed:0.88 green:0.72 blue:0.71 alpha:1];
    [self.view addSubview:top];
    [top setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop);
        builder.size.toItem(topLeft);
    }];
}


@end