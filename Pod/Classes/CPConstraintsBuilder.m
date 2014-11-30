//
//  CPConstraintsBuilder.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPConstraintsBuilder.h"
#import "Masonry.h"
#import "CPPositionConstraint.h"
#import "CPSizeConstraint.h"
#import "CPWidthConstraint.h"
#import "CPHeightConstraint.h"
#import "CPInsetsConstraint.h"


@interface CPConstraintsBuilder()

@property (nonatomic, weak) UIView *view;
@property (nonatomic, strong) NSMutableArray *constraints;

@end


@implementation CPConstraintsBuilder

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        _view = view;
        _constraints = [[NSMutableArray alloc] init];
    }

    return self;
}


- (CPPositionConstraint * (^)(CPPosition position))position
{
    return ^id(CPPosition position) {
        CPPositionConstraint *constraint = [[CPPositionConstraint alloc] initWithPosition:position];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (CPSizeConstraint *)size
{
    CPSizeConstraint *constraint = [[CPSizeConstraint alloc] init];
    [_constraints addObject:constraint];
    return constraint;
}


- (CPWidthConstraint *)width
{
    CPWidthConstraint *constraint = [[CPWidthConstraint alloc] init];
    [_constraints addObject:constraint];
    return constraint;
}


- (CPHeightConstraint *)height
{
    CPHeightConstraint *constraint = [[CPHeightConstraint alloc] init];
    [_constraints addObject:constraint];
    return constraint;
}


- (CPInsetsConstraint *(^)(UIEdgeInsets insets))insets
{
    return ^id(UIEdgeInsets insets) {
        CPInsetsConstraint *constraint = [[CPInsetsConstraint alloc] initWithInsets:insets];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (void)build
{
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        for (CPLayoutConstraint *constraint in _constraints) {
            constraint.target = _view;
            [constraint update:make];
        }
    }];
}


- (void)update
{
    [_view mas_updateConstraints:^(MASConstraintMaker *make) {
        for (CPLayoutConstraint *constraint in _constraints) {
            constraint.target = _view;
            [constraint update:make];
        }
    }];
}

@end