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


- (CPWidthConstraint *(^)(CGFloat height))value
{
    return ^CPWidthConstraint *(CGFloat width) {
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
        make.width.equalTo(@(self.width));
    }
}

@end