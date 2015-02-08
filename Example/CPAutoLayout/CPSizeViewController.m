//
// Created by sakim on 14. 11. 30..
// Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPSizeViewController.h"
#import "CPAutoLayout.h"
#import "CPItemView.h"


@implementation CPSizeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Size";
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    CPItemView *view1 = [[CPItemView alloc] initWithTitle:@"(v1): 80x60"];
    view1.backgroundColor = [UIColor colorWithRed:0.6 green:0.82 blue:0.72 alpha:1];
    [self.view addSubview:view1];
    [view1 makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentCenter).withOffsetY(-80);
        [NSValue valueWithCGSize:CGSizeMake(100, 100)];
//        builder.size.equalToItem();
    }];

    CPItemView *view2 = [[CPItemView alloc] initWithTitle:@"(v2): v1"];
    view2.backgroundColor = [UIColor colorWithRed:0.6 green:0.82 blue:0.72 alpha:1];
    [self.view addSubview:view2];
    [view2 makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom).toItem(view1).withOffsetY(5);
        builder.size.equalToItem(view1);
    }];

    CPItemView *view3 = [[CPItemView alloc] initWithTitle:@"(v3): v1-(10x10)"];
    view3.backgroundColor = [UIColor colorWithRed:0.6 green:0.82 blue:0.72 alpha:1];
    [self.view addSubview:view3];
    [view3 makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom).toItem(view2).withOffsetY(5);
        builder.size.equalToItem(view1).withSizeOffset(CGSizeMake(-10, -10));
    }];

    CPItemView *view4 = [[CPItemView alloc] initWithTitle:@"(v4): v1*0.5"];
    view4.backgroundColor = [UIColor colorWithRed:0.6 green:0.82 blue:0.72 alpha:1];
    [self.view addSubview:view4];
    [view4 makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom).toItem(view3).withOffsetY(5);
        builder.size.equalToItem(view1).multipliedBy(.5f);
    }];

    // description
    CPItemView *description = [[CPItemView alloc] initWithTitle:@"Shows fixed or relative size views."];
    description.titleLabel.font = [UIFont fontWithName:@"GillSans" size:13.f];
    [self.view addSubview:description];
    [description makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentLeft).withOffsetY(5);
        builder.width.equalToItem(self.view);
        builder.height.equalTo(20);
    }];
}


@end
