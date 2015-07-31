//
// Created by sakim on 15. 7. 31..
// Copyright (c) 2015 Sung Ahn Kim. All rights reserved.
//

#import "CP_Step2_AlignmentViewController.h"
#import "CPAutoLayout.h"
#import "UIColor+CPView.h"

@interface CP_Step2_AlignmentViewController ()

@property (nonatomic, weak) UIView *centerView;
@property (nonatomic, assign) BOOL toggled;

@end


@implementation CP_Step2_AlignmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    // positioned inside of its superview and top-left aligned
    UIView *centerView = [[UIView alloc] init];
    centerView.backgroundColor = [UIColor firstColor];
    [self.view addSubview:centerView];
    [centerView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter).aligned(CPAlignmentTop|CPAlignmentLeft);
        builder.size.equalTo(CGSizeMake(100, 100));
    }];
    self.centerView = centerView;

    // positioned right of centerView and top aligned
    UIView *rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor secondColor];
    [self.view addSubview:rightView];
    [rightView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionRight).aligned(CPAlignmentTop).toItem(centerView);
        builder.size.equalTo(CGSizeMake(50, 50));
    }];

    // positioned bottom of centerView and left aligned with offset .
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor secondColor];
    [self.view addSubview:bottomView];
    [bottomView makeConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom).aligned(CPAlignmentLeft).toItem(centerView).withOffset(CGPointMake(5, 5));
        builder.size.equalTo(CGSizeMake(50, 50));
    }];

    // constraint update button
    UIButton *bottomButton = [[UIButton alloc] init];
    bottomButton.backgroundColor = [UIColor secondColor];
    [bottomButton setTitle:@"Change alignment of the 'green' view" forState:UIControlStateNormal];
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
                builder.position(CPPositionCenter).aligned(CPAlignmentTop|CPAlignmentLeft);
            }];
            [self.view layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            [self.centerView updateConstraints:^(CPConstraintsBuilder *builder) {
                builder.position(CPPositionCenter).aligned(CPAlignmentTop|CPAlignmentRight);
            }];
            [self.view layoutIfNeeded];
        }];
    }
    self.toggled = !self.toggled;
}


@end