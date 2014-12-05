//
//  CPHeightConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPHeightConstraint.h"

#import "Masonry.h"


@interface CPHeightConstraint ()

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) NSLayoutRelation relation;

// relative height
@property (nonatomic, weak) UIView *item;
@property (nonatomic, assign) CGFloat offsetY;
@property (nonatomic, assign) CGFloat multiplier;
@property (nonatomic, assign) CGFloat aspect;

@end


@implementation CPHeightConstraint

- (instancetype)init
{
    self = [super init];
    if (self) {
        _multiplier = 1.f;
    }

    return self;
}


- (CPHeightConstraint *(^)(CGFloat height))value
{
    return ^CPHeightConstraint *(CGFloat height) {
        self.relation = NSLayoutRelationEqual;
        self.height = height;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat height))less
{
    return ^CPHeightConstraint *(CGFloat height) {
        self.relation = NSLayoutRelationLessThanOrEqual;
        self.height = height;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat height))greater
{
    return ^CPHeightConstraint *(CGFloat height) {
        self.relation = NSLayoutRelationGreaterThanOrEqual;
        self.height = height;
        return self;
    };
}


- (CPHeightConstraint *(^)(UIView *item))toItem
{
    return ^CPHeightConstraint *(UIView *toItem) {
        self.item = toItem;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat offsetY))withOffsetY
{
    return ^CPHeightConstraint *(CGFloat offsetY) {
        self.offsetY = offsetY;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat multiplier))multipliedBy
{
    return ^CPHeightConstraint *(CGFloat multiplier) {
        self.multiplier = multiplier;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat aspectRatio))aspectRatio
{
    return ^CPHeightConstraint *(CGFloat aspectRatio) {
        self.aspect = aspectRatio;
        return self;
    };
}


- (void)update:(MASConstraintMaker *)make
{
    if (self.item) {
        make.height.equalTo(self.item.mas_height).multipliedBy(self.multiplier).sizeOffset(CGSizeMake(0, self.offsetY));
    } else if (self.aspect != 0) {
        make.height.equalTo(self.target.mas_width).with.multipliedBy(self.aspect).sizeOffset(CGSizeMake(0, self.offsetY));
    } else {
        if (self.relation == NSLayoutRelationEqual) {
            make.height.equalTo(@(self.height));
        } else if (self.relation == NSLayoutRelationGreaterThanOrEqual) {
            make.height.greaterThanOrEqualTo(@(self.height));
        } else if (self.relation == NSLayoutRelationLessThanOrEqual) {
            make.height.lessThanOrEqualTo(@(self.height));
        }
    }
}

@end