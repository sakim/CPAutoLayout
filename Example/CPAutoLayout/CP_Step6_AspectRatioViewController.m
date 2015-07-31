//
// Created by sakim on 15. 7. 31..
// Copyright (c) 2015 Sung Ahn Kim. All rights reserved.
//

#import "CP_Step6_AspectRatioViewController.h"
#import "CPAutoLayout.h"
#import "UIColor+CPView.h"

@interface CP_Step6_AspectRatioViewController ()

@property (nonatomic, weak) UIView *centerView;
@property (nonatomic, assign) BOOL toggled;

@end

@implementation CP_Step6_AspectRatioViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    // 1:0.5
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor firstColor];
    [self.view addSubview:centerView];
    [centerView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter);
        builder.width.equalTo(100);
        builder.height.aspectRatio(0.5);
    }];
    self.centerView = centerView;

    // 0.7:1
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor secondColor];
    [self.view addSubview:rightView];
    [rightView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter).withOffsetY(-100);
        builder.width.aspectRatio(0.7);
        builder.height.equalToItem(centerView);
    }];

    // constraint update button
    UIButton *bottomButton = [[UIButton alloc] init];
    bottomButton.backgroundColor = [UIColor secondColor];
    [bottomButton setTitle:@"Change width of the 'green' view" forState:UIControlStateNormal];
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
                builder.width.equalTo(100);
            }];
            [self.view layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            [self.centerView updateConstraints:^(CPConstraintsBuilder *builder) {
                builder.width.equalTo(200);
            }];
            [self.view layoutIfNeeded];
        }];
    }
    self.toggled = !self.toggled;
}

@end