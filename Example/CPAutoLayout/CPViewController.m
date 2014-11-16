//
//  CPViewController.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPViewController.h"
#import "CPAutoLayout.h"

@interface CPViewController ()

@property (nonatomic, weak) UIView *center;
@property (nonatomic, assign) CGSize centerSize;

@end

@implementation CPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGSize size = CGSizeMake(50, 50);
    
    // top left
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentLeft).toItem(self.view);
        builder.size(size);
    }];
    
    // top right
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentRight).toItem(self.view).withOffset(CGSizeMake(10, 10));
        builder.size(size);
    }];
    
    // bottom left
    view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentBottom|CPAlignmentLeft).toItem(self.view).withOffset(CGSizeMake(30, 30));
        builder.size(size);
    }];
    
    // bottom right
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"!!!" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(enlarge:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentBottom|CPAlignmentRight).toItem(self.view).withOffset(CGSizeMake(20, 20));
        builder.size(size);
    }];
    
    // center
    UIView *center = [[UIView alloc] init];
    center.backgroundColor = [UIColor blueColor];
    [self.view addSubview:center];
    
    _center = center;
    _centerSize = CGSizeMake(70, 70);
    
    [center setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter).toItem(self.view).withOffset(CGSizeMake(20, 20));
        builder.size(_centerSize);
    }];
    
    UIView *bottomCenter = [[UIView alloc] init];
    bottomCenter.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bottomCenter];
    [bottomCenter setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom).toItem(center).withOffset(CGSizeMake(0, 5));
        builder.relativeSize(center).multipliedBy(1/3.f).withSizeOffset(CGSizeMake(-3.33f, 0));
    }];
    
    UIView *bottomLeft = [[UIView alloc] init];
    bottomLeft.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bottomLeft];
    [bottomLeft setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom|CPAlignmentLeft).toItem(center).withOffset(CGSizeMake(0, 5));
        builder.position(CPPositionLeft).toItem(bottomCenter).withOffset(CGSizeMake(5, 0));
        builder.relativeHeight(bottomCenter);
    }];
    
    UIView *bottomRight = [[UIView alloc] init];
    bottomRight.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bottomRight];
    [bottomRight setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionBottom|CPAlignmentRight).toItem(center).withOffset(CGSizeMake(0, 5));
        builder.position(CPPositionRight).toItem(bottomCenter).withOffset(CGSizeMake(5, 0));
        builder.relativeHeight(bottomCenter);
    }];
    
    UIView *centerTop = [[UIView alloc] init];
    centerTop.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:centerTop];
    [centerTop setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter|CPAlignmentTop).toItem(center).withOffset(CGSizeMake(0, 5));
        builder.height(20);
        builder.relativeWidth(center).withSizeOffset(CGSizeMake(-10, 0));
    }];
    
    UIView *aspectView = [[UIView alloc] init];
    aspectView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:aspectView];
    [aspectView setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop).toItem(self.view).withOffset(CGSizeMake(0, 20));
        builder.relativeHeight(center).multipliedBy(0.3f);
        builder.aspectRatio(1.6f);
    }];
}


- (void)enlarge:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        _centerSize = CGSizeMake(_centerSize.width + 30, _centerSize.height + 20);
        [_center updateConstraints:^(CPConstraintsBuilder *builder) {
            builder.size(_centerSize);
        }];
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
