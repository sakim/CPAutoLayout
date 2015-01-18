//
//  CPHeightConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPWidthConstraint.h"
#import "Masonry.h"
#import "MASConstraint+Private.h"
#import "View+CPAutoLayout.h"


@interface CPWidthConstraint ()

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) NSLayoutRelation relation;

// relative width
@property (nonatomic, weak) MAS_VIEW *item;
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
        _relation = NSLayoutRelationEqual;
    }

    return self;
}


- (CPWidthConstraint *(^)(CGFloat width))value
{
    return ^CPWidthConstraint *(CGFloat width) {
        self.width = width;
        return self;
    };
}


- (CPWidthConstraint *(^)(MAS_VIEW *item))toItem
{
    return ^CPWidthConstraint *(MAS_VIEW *toItem) {
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


- (CPWidthConstraint *(^)())equal
{
    return ^CPWidthConstraint *() {
        self.relation = NSLayoutRelationEqual;
        return self;
    };
}


- (CPWidthConstraint *(^)())less
{
    return ^CPWidthConstraint *() {
        self.relation = NSLayoutRelationLessThanOrEqual;
        return self;
    };
}


- (CPWidthConstraint *(^)())greater
{
    return ^CPWidthConstraint *() {
        self.relation = NSLayoutRelationGreaterThanOrEqual;
        return self;
    };
}


- (void)update:(MASConstraintMaker *)make
{
    if (self.item) {
        make.width.equalToWithRelation(self.item.mas_width, self.relation).multipliedBy(self.multiplier).sizeOffset(CGSizeMake(self.offsetX, 0));
    } else if (self.aspect != 0) {
        make.width.equalToWithRelation(self.target.mas_height, self.relation).multipliedBy(self.aspect).sizeOffset(CGSizeMake(self.offsetX, 0));
    } else {
        make.width.equalToWithRelation(@(self.width), self.relation);
    }
}

@end