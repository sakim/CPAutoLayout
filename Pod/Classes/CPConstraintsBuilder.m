//
//  CPConstraintsBuilder.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPConstraintsBuilder.h"
#import "Masonry.h"
#import "CPSizeConstraint.h"
#import "CPPositionConstraint.h"
#import "CPAspectRatioConstraint.h"
#import "CPRelativeSizeConstraint.h"
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


- (CPSizeConstraint * (^)(CGSize size))size
{
    return ^id(CGSize size) {
        CPSizeConstraint *constraint = [[CPSizeConstraint alloc] initWithSize:size];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (CPSizeConstraint * (^)(CGFloat width))width
{
    return ^id(CGFloat width) {
        CPSizeConstraint *constraint = [[CPSizeConstraint alloc] initWithWidth:width];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (CPSizeConstraint * (^)(CGFloat height))height
{
    return ^id(CGFloat height) {
        CPSizeConstraint *constraint = [[CPSizeConstraint alloc] initWithHeight:height];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (CPAspectRatioConstraint *(^)(CGFloat aspectRatio))aspectRatio
{
    return ^id(CGFloat aspectRatio) {
        CPAspectRatioConstraint *constraint = [[CPAspectRatioConstraint alloc] initWithAspectRatio:aspectRatio];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (CPRelativeSizeConstraint *(^)(UIView *relative))relativeSize
{
    return ^id(UIView *relative) {
        CPRelativeSizeConstraint *constraint = [[CPRelativeSizeConstraint alloc] initWithRelativeSize:relative];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (CPRelativeSizeConstraint *(^)(UIView *relative))relativeWidth
{
    return ^id(UIView *relative) {
        CPRelativeSizeConstraint *constraint = [[CPRelativeSizeConstraint alloc] initWithRelativeWidth:relative];
        [_constraints addObject:constraint];
        return constraint;
    };
}


- (CPRelativeSizeConstraint *(^)(UIView *relative))relativeHeight
{
    return ^id(UIView *relative) {
        CPRelativeSizeConstraint *constraint = [[CPRelativeSizeConstraint alloc] initWithRelativeHeight:relative];
        [_constraints addObject:constraint];
        return constraint;
    };
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