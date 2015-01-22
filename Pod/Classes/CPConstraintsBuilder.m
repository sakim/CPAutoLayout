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

@property (nonatomic, weak) MAS_VIEW *view;

@property (nonatomic, strong) CPPositionConstraint *positionConstraint;
@property (nonatomic, strong) CPPositionConstraint *toPositionConstraint;
@property (nonatomic, strong) CPSizeConstraint *sizeConstraint;
@property (nonatomic, strong) CPWidthConstraint *widthConstraint;
@property (nonatomic, strong) CPHeightConstraint *heightConstraint;
@property (nonatomic, strong) CPInsetsConstraint *insetsConstraint;

@end


@implementation CPConstraintsBuilder

- (instancetype)initWithView:(MAS_VIEW *)view
{
    self = [super init];
    if (self) {
        _view = view;
    }

    return self;
}


- (CPPositionConstraint * (^)(CPPosition position))position
{
    return ^id(CPPosition position) {
        CPPositionConstraint *constraint = [[CPPositionConstraint alloc] initWithPosition:position];
        self.positionConstraint = constraint;
        return constraint;
    };
}


- (CPPositionConstraint * (^)(CPPosition position))toPosition
{
    return ^id(CPPosition position) {
        CPPositionConstraint *constraint = [[CPPositionConstraint alloc] initWithPosition:position];
        self.toPositionConstraint = constraint;
        return constraint;
    };
}


- (CPSizeConstraint *)size
{
    CPSizeConstraint *constraint = [[CPSizeConstraint alloc] init];
    self.sizeConstraint = constraint;
    return constraint;
}


- (CPWidthConstraint *)width
{
    CPWidthConstraint *constraint = [[CPWidthConstraint alloc] init];
    self.widthConstraint = constraint;
    return constraint;
}


- (CPHeightConstraint *)height
{
    CPHeightConstraint *constraint = [[CPHeightConstraint alloc] init];
    self.heightConstraint = constraint;
    return constraint;
}


- (CPInsetsConstraint *(^)(UIEdgeInsets insets))insets
{
    return ^id(UIEdgeInsets insets) {
        CPInsetsConstraint *constraint = [[CPInsetsConstraint alloc] initWithInsets:insets];
        self.insetsConstraint = constraint;
        return constraint;
    };
}


- (void)build
{
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        [self buildConstraints:make update:NO];
    }];
}


- (void)update
{
    [self.view mas_updateConstraints:^(MASConstraintMaker *make) {
        [self buildConstraints:make update:YES];
    }];
}


- (void)buildConstraints:(MASConstraintMaker *)make update:(BOOL)update {
    NSMutableArray *constraints = [NSMutableArray array];

    // NOTE: must kept in order to calculate initial frame.
    if (self.positionConstraint) [constraints addObject:self.positionConstraint];
    if (self.toPositionConstraint) [constraints addObject:self.toPositionConstraint];
    if (self.insetsConstraint) [constraints addObject:self.insetsConstraint];

    if (self.sizeConstraint) [constraints addObject:self.sizeConstraint];
    if (self.widthConstraint && self.widthConstraint.aspect == 0) [constraints addObject:self.widthConstraint];
    if (self.heightConstraint) [constraints addObject:self.heightConstraint];
    // update later to calculate width with aspect
    if (self.widthConstraint && self.widthConstraint.aspect != 0) [constraints addObject:self.widthConstraint];

    for (CPLayoutConstraint *constraint in constraints) {
        constraint.target = self.view;
        [constraint build:make update:update];
    }
}

@end