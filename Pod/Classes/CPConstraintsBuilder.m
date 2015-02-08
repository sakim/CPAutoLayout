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
#import "CPHorizontalConstraint.h"
#import "CPVerticalConstraint.h"


@interface CPConstraintsBuilder()

@property (nonatomic, weak) MAS_VIEW *view;

@property (nonatomic, strong) CPPositionConstraint *positionConstraint;
@property (nonatomic, strong) CPHorizontalConstraint *horizontalConstraint;
@property (nonatomic, strong) CPVerticalConstraint *verticalConstraint;
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
        if (self.positionConstraint != nil) {
            [self throwConflictException:@"position"];
        }
        CPPositionConstraint *constraint = [[CPPositionConstraint alloc] initWithPosition:position];
        self.positionConstraint = constraint;
        return constraint;
    };
}


- (CPHorizontalConstraint * (^)(CPPosition position))horizontal
{
    return ^id(CPPosition position) {
        if (self.horizontalConstraint != nil) {
            [self throwConflictException:@"horizontal"];
        }
        CPHorizontalConstraint *constraint = [[CPHorizontalConstraint alloc] initWithPosition:position];
        self.horizontalConstraint = constraint;
        return constraint;
    };
}


- (CPVerticalConstraint * (^)(CPPosition position))vertical
{
    return ^id(CPPosition position) {
        if (self.verticalConstraint != nil) {
            [self throwConflictException:@"vertical"];
        }
        CPVerticalConstraint *constraint = [[CPVerticalConstraint alloc] initWithPosition:position];
        self.verticalConstraint = constraint;
        return constraint;
    };
}


- (CPSizeConstraint *)size
{
    if (self.sizeConstraint != nil) {
        [self throwConflictException:@"size"];
    }
    CPSizeConstraint *constraint = [[CPSizeConstraint alloc] init];
    self.sizeConstraint = constraint;
    return constraint;
}


- (CPWidthConstraint *)width
{
    if (self.widthConstraint != nil) {
        [self throwConflictException:@"width"];
    }
    CPWidthConstraint *constraint = [[CPWidthConstraint alloc] init];
    self.widthConstraint = constraint;
    return constraint;
}


- (CPHeightConstraint *)height
{
    if (self.heightConstraint != nil) {
        [self throwConflictException:@"height"];
    }
    CPHeightConstraint *constraint = [[CPHeightConstraint alloc] init];
    self.heightConstraint = constraint;
    return constraint;
}


- (CPInsetsConstraint *(^)(UIEdgeInsets insets))insets
{
    return ^id(UIEdgeInsets insets) {
        if (self.insetsConstraint != nil) {
            [self throwConflictException:@"insets"];
        }
        CPInsetsConstraint *constraint = [[CPInsetsConstraint alloc] initWithInsets:insets];
        self.insetsConstraint = constraint;
        return constraint;
    };
}


- (void)throwConflictException:(NSString *)constraint
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[[NSString alloc] initWithFormat:@"You should never set a '%@' constraint twice to this view.", constraint]
                                 userInfo:nil];
}


- (void)make
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
    if (self.view.superview == nil) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"You should attach this view to its superview before making constraints."
                                     userInfo:nil];
    }

    if (self.positionConstraint != nil && (self.horizontalConstraint != nil || self.verticalConstraint != nil)) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"You should never set both a 'position' and a 'horizontal/vertical' constraint. This is an ambiguous position."
                                     userInfo:nil];
    }

    if (self.sizeConstraint != nil && (self.widthConstraint != nil || self.heightConstraint != nil)) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                       reason:@"You should never set both a 'size' and a 'width/height' constraint. This is an ambiguous size."
                                     userInfo:nil];
    }

    NSMutableArray *constraints = [NSMutableArray array];

    // NOTE: must kept in order to calculate initial frame.
    if (self.positionConstraint) [constraints addObject:self.positionConstraint];
    if (self.horizontalConstraint) [constraints addObject:self.horizontalConstraint];
    if (self.verticalConstraint) [constraints addObject:self.verticalConstraint];

    if (self.insetsConstraint) [constraints addObject:self.insetsConstraint];

    if (self.sizeConstraint) [constraints addObject:self.sizeConstraint];
    if (self.widthConstraint && ![self.widthConstraint hasAspectRatio]) [constraints addObject:self.widthConstraint];
    if (self.heightConstraint) [constraints addObject:self.heightConstraint];
    // update later to calculate width with aspect
    if (self.widthConstraint && [self.widthConstraint hasAspectRatio]) [constraints addObject:self.widthConstraint];

    for (CPLayoutConstraint *constraint in constraints) {
        constraint.target = self.view;
        [constraint build:make update:update];
    }
}

@end