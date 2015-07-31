//
// Created by sakim on 15. 7. 31..
// Copyright (c) 2015 Sung Ahn Kim. All rights reserved.
//

#import "CP_Step3_PositionAdvancedViewController.h"
#import "CPAutoLayout.h"
#import "UIColor+CPView.h"

@interface CP_Step3_PositionAdvancedViewController ()

@property (nonatomic, weak) UIView *centerView;
@property (nonatomic, weak) UIView *rightView;
@property (nonatomic, assign) BOOL toggled;

@end

@implementation CP_Step3_PositionAdvancedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    // positioned center of its superview
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor secondColor];
    [self.view addSubview:centerView];
    [centerView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter);
        builder.size.equalTo(CGSizeMake(100, 100));
    }];
    self.centerView = centerView;

    // positioned right of centerView
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor firstColor];
    [self.view addSubview:rightView];
    [rightView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionRight).toItem(centerView);
        builder.size.equalTo(CGSizeMake(70, 70));
    }];
    self.rightView = rightView;

    // positioned right of centerView and bottom of rightView.
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor secondColor];
    [self.view addSubview:bottomView];
    [bottomView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.horizontal(CPPositionRight).toItem(centerView);
        builder.vertical(CPPositionBottom).toItem(rightView);
        builder.size.equalTo(CGSizeMake(50, 50));
    }];

    // constraint update button
    UIButton *bottomButton = [[UIButton alloc] init];
    bottomButton.backgroundColor = [UIColor secondColor];
    [bottomButton setTitle:@"Change position of the 'green' view" forState:UIControlStateNormal];
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
            [self.rightView updateConstraints:^(CPConstraintsBuilder *builder) {
                builder.position(CPPositionRight).toItem(self.centerView);
            }];
            [self.view layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            [self.rightView updateConstraints:^(CPConstraintsBuilder *builder) {
                builder.position(CPPositionCenter).aligned(CPAlignmentTop|CPAlignmentRight);
            }];
            [self.view layoutIfNeeded];
        }];
    }
    self.toggled = !self.toggled;
}



@end