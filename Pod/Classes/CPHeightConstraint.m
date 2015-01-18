//
//  CPHeightConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPHeightConstraint.h"
#import "Masonry.h"
#import "MASConstraint+Private.h"
#import "View+CPAutoLayout.h"


@interface CPHeightConstraint ()

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) NSLayoutRelation relation;

// relative height
@property (nonatomic, weak) MAS_VIEW *item;
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
        _relation = NSLayoutRelationEqual;
    }

    return self;
}


- (CPHeightConstraint *(^)(CGFloat height))value
{
    return ^CPHeightConstraint *(CGFloat height) {
        self.height = height;
        return self;
    };
}


- (CPHeightConstraint *(^)(MAS_VIEW *item))toItem
{
    return ^CPHeightConstraint *(MAS_VIEW *toItem) {
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


- (CPHeightConstraint *(^)())equal
{
    return ^CPHeightConstraint *() {
        self.relation = NSLayoutRelationEqual;
        return self;
    };
}


- (CPHeightConstraint *(^)())less
{
    return ^CPHeightConstraint *() {
        self.relation = NSLayoutRelationLessThanOrEqual;
        return self;
    };
}


- (CPHeightConstraint *(^)())greater
{
    return ^CPHeightConstraint *() {
        self.relation = NSLayoutRelationGreaterThanOrEqual;
        return self;
    };
}


- (void)update:(MASConstraintMaker *)make
{
    if (self.item) {
        make.height.equalToWithRelation(self.item.mas_height, self.relation).multipliedBy(self.multiplier).sizeOffset(CGSizeMake(0, self.offsetY));
    } else if (self.aspect != 0) {
        make.height.equalToWithRelation(self.target.mas_width, self.relation).multipliedBy(self.aspect).sizeOffset(CGSizeMake(0, self.offsetY));
    } else {
        make.height.equalToWithRelation(@(self.height), self.relation);
    }
}

@end