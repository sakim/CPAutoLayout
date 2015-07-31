//
// Created by sakim on 15. 7. 31..
// Copyright (c) 2015 Sung Ahn Kim. All rights reserved.
//

#import "CP_Step1_PositionViewController.h"
#import "CPAutoLayout.h"
#import "UIColor+CPView.h"

@interface CP_Step1_PositionViewController ()

@property (nonatomic, weak) UIView *centerView;
@property (nonatomic, assign) BOOL toggled;

@end

@implementation CP_Step1_PositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    // positioned center of its superview
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor firstColor];
    [self.view addSubview:centerView];
    [centerView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter);
        builder.size.equalTo(CGSizeMake(100, 100));
    }];
    self.centerView = centerView;

    // positioned right of centerView
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor secondColor];
    [self.view addSubview:rightView];
    [rightView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionRight).toItem(centerView);
        builder.size.equalTo(CGSizeMake(100, 100));
    }];

    // positioned bottom of centerView with offset.
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor secondColor];
    [self.view addSubview:bottomView];
    [bottomView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom).toItem(centerView).withOffsetY(10);
        builder.size.equalTo(CGSizeMake(100, 100));
    }];

    // constraint update button
    UIButton *bottomButton = [[UIButton alloc] init];
    bottomButton.backgroundColor = [UIColor secondColor];
    [bottomButton setTitle:@"Move the 'green' view" forState:UIControlStateNormal];
    [bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomButton addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomButton];
    [bottomButton makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter).aligned(CPAlignmentBottom);
        builder.width.equalToItem(self.view);
        builder.height.equalTo(50);
    }];
}

- (void)update:(id)sender {
    if (self.toggled) {
        [UIView animateWithDuration:0.5 animations:^{
            [self.centerView updateConstraints:^(CPConstraintsBuilder *builder) {
                builder.position(CPPositionCenter);
            }];
            [self.view layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            [self.centerView updateConstraints:^(CPConstraintsBuilder *builder) {
                builder.position(CPPositionCenter).withOffsetY(-200);
            }];
            [self.view layoutIfNeeded];
        }];
    }
    self.toggled = !self.toggled;
}


@end