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

@property (nonatomic, assign) CPPosition distancePosition;

@end


@implementation CPHeightConstraint

- (instancetype)init
{
    self = [super init];
    if (self) {
        _multiplier = 1.f;
        _aspect = NAN;
    }
    return self;
}


- (CPHeightConstraint *(^)(CGFloat height))equalTo
{
    return ^id (CGFloat height) {
        return self.equalToWithRelation(height, NSLayoutRelationEqual);
    };
}


- (CPHeightConstraint *(^)(CGFloat height))lessThanOrEqualTo
{
    return ^id (CGFloat height) {
        return self.equalToWithRelation(height, NSLayoutRelationLessThanOrEqual);
    };
}


- (CPHeightConstraint *(^)(CGFloat height))greaterThanOrEqualTo
{
    return ^id (CGFloat height) {
        return self.equalToWithRelation(height, NSLayoutRelationGreaterThanOrEqual);
    };
}


- (CPHeightConstraint *(^)(CGFloat height, NSLayoutRelation relation))equalToWithRelation
{
    return ^id (CGFloat height, NSLayoutRelation relation) {
        self.height = height;
        self.relation = relation;
        return self;
    };
}


- (CPHeightConstraint *(^)(MAS_VIEW *item))equalToItem
{
    return ^id (MAS_VIEW *item) {
        return self.equalToItemWithRelation(item, NSLayoutRelationEqual);
    };
}


- (CPHeightConstraint *(^)(MAS_VIEW *item))lessThanOrEqualToItem
{
    return ^id (MAS_VIEW *item) {
        return self.equalToItemWithRelation(item, NSLayoutRelationLessThanOrEqual);
    };
}


- (CPHeightConstraint *(^)(MAS_VIEW *item))greaterThanOrEqualToItem
{
    return ^id (MAS_VIEW *item) {
        return self.equalToItemWithRelation(item, NSLayoutRelationGreaterThanOrEqual);
    };
}

- (CPHeightConstraint *(^)(MAS_VIEW *item))distanceToTopOf
{
    return ^id (MAS_VIEW *item) {
        self.item = item;
        self.distancePosition = CPPositionTop;
        return self;
    };
}


- (CPHeightConstraint *(^)(MAS_VIEW *item))distanceToBottomOf
{
    return ^id (MAS_VIEW *item) {
        self.item = item;
        self.distancePosition = CPPositionBottom;
        return self;
    };
}


- (CPHeightConstraint * (^)(MAS_VIEW *item, NSLayoutRelation relation))equalToItemWithRelation
{
    return ^id (MAS_VIEW *item, NSLayoutRelation relation) {
        self.item = item;
        self.relation = relation;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat offsetY))withSizeOffsetY
{
    return ^id (CGFloat offsetY) {
        self.offsetY = offsetY;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat multiplier))multipliedBy
{
    return ^id (CGFloat multiplier) {
        self.multiplier = multiplier;
        return self;
    };
}


- (CPHeightConstraint *(^)(CGFloat aspectRatio))aspectRatio
{
    return ^id (CGFloat aspectRatio) {
        self.aspect = aspectRatio;
        return self;
    };
}


- (BOOL)hasAspectRatio {
    return !isnan(self.aspect);
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    CGFloat height = 0;

    if (self.distancePosition == CPPositionTop) {
        make.bottom.equalTo(self.item.mas_top).with.offset(self.offsetY);
    } else if (self.distancePosition == CPPositionBottom) {
        make.top.equalTo(self.item.mas_bottom).with.offset(-self.offsetY);
    } else if (self.item) {
        make.height.equalToWithRelation(self.item.mas_height, self.relation).multipliedBy(self.multiplier).sizeOffset(CGSizeMake(0, self.offsetY));
        height = self.item.$height * self.multiplier + self.offsetY;
    } else if (!isnan(self.aspect)) {
        make.height.equalToWithRelation(self.target.mas_width, self.relation).multipliedBy(self.aspect).sizeOffset(CGSizeMake(0, self.offsetY));
        height = self.target.$width * self.aspect + self.offsetY;
    } else {
        make.height.equalToWithRelation(@(self.height), self.relation);
        height = self.height;
    }

    // set initial 'frame.size.height'
    if (!update) {
        self.target.$height = height;
    }
}

@end