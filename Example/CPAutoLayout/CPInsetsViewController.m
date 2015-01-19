//
// Created by sakim on 14. 11. 30..
// Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPInsetsViewController.h"
#import "CPAutoLayout.h"
#import "CPItemView.h"


@implementation CPInsetsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Insets";
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    CPItemView *view = [[CPItemView alloc] initWithTitle:@"Insets (50, 30, 30, 30)"];
    view.backgroundColor = [UIColor colorWithRed:0.6 green:0.82 blue:0.72 alpha:1];
    view.titleLabel.font = [UIFont fontWithName:@"GillSans" size:15];
    [self.view addSubview:view];
    [view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.insets(UIEdgeInsetsMake(50, 30, 30, 30));
    }];

    CPItemView *view2 = [[CPItemView alloc] initWithTitle:@"Insets (50, 50, 50, 50)"];
    view2.backgroundColor = [UIColor colorWithRed:0.88 green:0.72 blue:0.71 alpha:1];
    view2.titleLabel.font = [UIFont fontWithName:@"GillSans" size:15];
    [self.view addSubview:view2];
    [view2 setConstraints:^(CPConstraintsBuilder *builder) {
        builder.insets(UIEdgeInsetsMake(50, 50, 50, 50)).toItem(view);
    }];

    // description
    CPItemView *description = [[CPItemView alloc] initWithTitle:@"Shows view with insets to its superview.\nUsally used to represent background."];
    description.titleLabel.font = [UIFont fontWithName:@"GillSans" size:13.f];
    [self.view addSubview:description];
    [description setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentLeft).withOffsetY(5);
        builder.width.equalToItem(self.view);
        builder.height.equalTo(30);
    }];
}

@end