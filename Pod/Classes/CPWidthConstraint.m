//
//  CPHeightConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPWidthConstraint.h"

#import "Masonry.h"
#import "CPLayoutConstraint.h"


@interface CPWidthConstraint ()

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) NSLayoutRelation relation;

// relative width
@property (nonatomic, weak) UIView *item;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat multiplier;
@property (nonatomic, assign) CGFloat aspect;

@end


@implementation CPWidthConstraint


- (instancetype)init
{
    self = [super init];
    if (self) {
        _multiplier = 1.f;
    }

    return self;
}


- (CPWidthConstraint *(^)(CGFloat width))value
{
    return ^CPWidthConstraint *(CGFloat width) {
        self.relation = NSLayoutRelationEqual;
        self.width = width;
        return self;
    };
}


- (CPWidthConstraint *(^)(CGFloat width))less
{
    return ^CPWidthConstraint *(CGFloat width) {
        self.relation = NSLayoutRelationLessThanOrEqual;
        self.width = width;
        return self;
    };
}


- (CPWidthConstraint *(^)(CGFloat width))greater
{
    return ^CPWidthConstraint *(CGFloat width) {
        self.relation = NSLayoutRelationGreaterThanOrEqual;
        self.width = width;
        return self;
    };
}


- (CPWidthConstraint *(^)(UIView *item))toItem
{
    return ^CPWidthConstraint *(UIView *toItem) {
        self.item = toItem;
        return self;
    };
}


- (CPWidthConstraint *(^)(CGFloat offsetX))withOffsetX
{
    return ^CPWidthConstraint *(CGFloat offsetX) {
        self.offsetX = offsetX;
        return self;
    };
}


- (CPWidthConstraint *(^)(CGFloat multiplier))multipliedBy
{
    return ^CPWidthConstraint *(CGFloat multiplier) {
        self.multiplier = multiplier;
        return self;
    };
}


- (CPWidthConstraint *(^)(CGFloat aspectRatio))aspectRatio
{
    return ^CPWidthConstraint *(CGFloat aspectRatio) {
        self.aspect = aspectRatio;
        return self;
    };
}


- (void)update:(MASConstraintMaker *)make
{
    if (self.item) {
        make.width.equalTo(self.item.mas_width).multipliedBy(self.multiplier).sizeOffset(CGSizeMake(self.offsetX, 0));
    } else if (self.aspect != 0) {
        make.width.equalTo(self.target.mas_height).with.multipliedBy(self.aspect).sizeOffset(CGSizeMake(self.offsetX, 0));
    } else {
        if (self.relation == NSLayoutRelationEqual) {
            make.width.equalTo(@(self.width));
        } else if (self.relation == NSLayoutRelationGreaterThanOrEqual) {
            make.width.greaterThanOrEqualTo(@(self.width));
        } else if (self.relation == NSLayoutRelationLessThanOrEqual) {
            make.width.lessThanOrEqualTo(@(self.width));
        }
    }
}

@end