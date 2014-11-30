//
// Created by sakim on 14. 11. 30..
// Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPAlignmentsViewController.h"
#import "CPAutoLayout.h"
#import "CPItemView.h"

@interface CPAlignmentsViewController ()

@property (nonatomic, weak) CPItemView *center;

@end

@implementation CPAlignmentsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Alignments (1)";
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    CPItemView *center = [[CPItemView alloc] initWithTitle:@""];
    center.backgroundColor = [UIColor colorWithRed:0.6 green:0.82 blue:0.72 alpha:1];
    center.titleLabel.font = [UIFont fontWithName:@"GillSans" size:15];
    [self.view addSubview:center];
    [center setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter);
        builder.size.value(CGSizeMake(270, 270));
    }];
    self.center = center;

    [self createItemTo:(CPAlignmentTop) title:@"AlignmentTop"];
    [self createItemTo:(CPAlignmentTop|CPAlignmentLeft) title:@"AlignmentTop | AlignmentLeft"];
    [self createItemTo:(CPAlignmentTop|CPAlignmentRight) title:@"AlignmentTop | AlignmentRight"];

    [self createItemTo:(CPAlignmentCenter) title:@"AlignmentCenter"];
    [self createItemTo:(CPAlignmentCenter|CPAlignmentLeft) title:@"AlignmentLeft"];
    [self createItemTo:(CPAlignmentCenter|CPAlignmentRight) title:@"AlignmentRight"];

    [self createItemTo:(CPAlignmentBottom) title:@"AlignmentBottom"];
    [self createItemTo:(CPAlignmentBottom|CPAlignmentLeft) title:@"AlignmentBottom | AlignmentLeft"];
    [self createItemTo:(CPAlignmentBottom|CPAlignmentRight) title:@"AlignmentBottom | AlignmentRight"];

    // description
    CPItemView *description = [[CPItemView alloc] initWithTitle:@"Shows views aligned inside center view."];
    description.titleLabel.font = [UIFont fontWithName:@"GillSans" size:13.f];
    [self.view addSubview:description];
    [description setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentLeft).withOffsetY(5);
        builder.width.toItem(self.view);
        builder.height.value(20);
    }];
}


- (void)createItemTo:(CPPosition)position title:(NSString *)title
{
    CPItemView *item = [[CPItemView alloc] initWithTitle:title];
    item.layer.borderWidth = 0.5f;
    item.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:item];
    [item setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(position).toItem(self.center);
        builder.size.value(CGSizeMake(90, 90));
    }];
}

@end