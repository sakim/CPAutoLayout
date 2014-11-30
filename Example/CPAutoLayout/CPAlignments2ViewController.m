//
// Created by sakim on 14. 11. 30..
// Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPAlignments2ViewController.h"
#import "CPAutoLayout.h"
#import "CPItemView.h"


@interface CPAlignments2ViewController ()

@property (nonatomic, weak) CPItemView *center;

@end

@implementation CPAlignments2ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Alignments (2)";
    }

    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    CPItemView *center = [[CPItemView alloc] initWithTitle:@"Center"];
    center.backgroundColor = [UIColor colorWithRed:0.6 green:0.82 blue:0.72 alpha:1];
    center.titleLabel.font = [UIFont fontWithName:@"GillSans" size:14];
    [self.view addSubview:center];
    [center setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter);
        builder.size.value(CGSizeMake(150, 150));
    }];
    self.center = center;

    [self createItemTo:(CPPositionTop) title:@"Top" fontSize:14];
    [self createItemTo:(CPPositionTop|CPAlignmentLeft) title:@"AlignmentLeft" fontSize:11];
    [self createItemTo:(CPPositionTop|CPAlignmentRight) title:@"AlignmentRight" fontSize:11];

    [self createItemTo:(CPPositionBottom) title:@"Bottom" fontSize:14];
    [self createItemTo:(CPPositionBottom|CPAlignmentLeft) title:@"AlignmentLeft" fontSize:11];
    [self createItemTo:(CPPositionBottom|CPAlignmentRight) title:@"AlignmentRight" fontSize:11];

    [self createItemTo:(CPPositionRight) title:@"Right" fontSize:14];
    [self createItemTo:(CPPositionRight|CPAlignmentTop) title:@"AlignmentTop" fontSize:11];
    [self createItemTo:(CPPositionRight|CPAlignmentBottom) title:@"AlignmentBottom" fontSize:11];

    [self createItemTo:(CPPositionLeft) title:@"Left" fontSize:14];
    [self createItemTo:(CPPositionLeft|CPAlignmentTop) title:@"AlignmentTop" fontSize:11];
    [self createItemTo:(CPPositionLeft|CPAlignmentBottom) title:@"AlignmentBottom" fontSize:11];

    // description
    CPItemView *description = [[CPItemView alloc] initWithTitle:@"Shows views aligned to center view."];
    description.titleLabel.font = [UIFont fontWithName:@"GillSans" size:13.f];
    [self.view addSubview:description];
    [description setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentLeft).withOffsetY(5);
        builder.width.toItem(self.view);
        builder.height.value(20);
    }];
}


- (void)createItemTo:(CPPosition)position title:(NSString *)title fontSize:(CGFloat)fontSize
{
    CPItemView *item = [[CPItemView alloc] initWithTitle:title];
    item.titleLabel.font = [UIFont fontWithName:@"GillSans" size:fontSize];
    [self.view addSubview:item];
    [item setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(position).toItem(self.center);
        builder.size.value(CGSizeMake(50, 50));
    }];
}

@end