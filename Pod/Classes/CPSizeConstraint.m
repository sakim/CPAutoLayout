//
//  CPSizeConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPSizeConstraint.h"
#import "Masonry.h"
#import "MASConstraint+Private.h"
#import "View+CPAutoLayout.h"


@interface CPSizeConstraint ()

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) NSLayoutRelation relation;

// relative size
@property (nonatomic, weak) MAS_VIEW *item;
@property (nonatomic, assign) CGSize offset;
@property (nonatomic, assign) CGFloat multiplier;

@end


@implementation CPSizeConstraint

- (instancetype)init
{
    self = [super init];
    if (self) {
        _size = CGSizeZero;
        _multiplier = 1.f;
    }
    return self;
}


- (CPSizeConstraint *(^)(CGSize size))equalTo
{
    return ^id (CGSize size) {
        return self.equalToWithRelation(size, NSLayoutRelationEqual);
    };
}


- (CPSizeConstraint *(^)(CGSize size))lessThanOrEqualTo
{
    return ^id (CGSize size) {
        return self.equalToWithRelation(size, NSLayoutRelationLessThanOrEqual);
    };
}


- (CPSizeConstraint *(^)(CGSize size))greaterThanOrEqualTo
{
    return ^id (CGSize size) {
        return self.equalToWithRelation(size, NSLayoutRelationGreaterThanOrEqual);
    };
}


- (CPSizeConstraint *(^)(CGSize size, NSLayoutRelation relation))equalToWithRelation
{
    return ^id (CGSize size, NSLayoutRelation relation) {
        self.size = size;
        self.relation = relation;
        return self;
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item))equalToItem
{
    return ^id (MAS_VIEW *item) {
        return self.equalToItemWithRelation(item, NSLayoutRelationEqual);
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item))greaterThanOrEqualToItem
{
    return ^id (MAS_VIEW *item) {
        return self.equalToItemWithRelation(item, NSLayoutRelationGreaterThanOrEqual);
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item))lessThanOrEqualToItem
{
    return ^id (MAS_VIEW *item) {
        return self.equalToItemWithRelation(item, NSLayoutRelationLessThanOrEqual);
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item, NSLayoutRelation relation))equalToItemWithRelation
{
    return ^id (MAS_VIEW *item, NSLayoutRelation relation) {
        self.item = item;
        self.relation = relation;
        return self;
    };
}


- (CPSizeConstraint *(^)(CGSize offset))withSizeOffset
{
    return ^CPSizeConstraint *(CGSize offset) {
        self.offset = offset;
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat offsetX))withSizeOffsetX
{
    return ^CPSizeConstraint *(CGFloat offsetX) {
        self.offset = CGSizeMake(offsetX, self.offset.height);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat offsetX))withSizeOffsetY
{
    return ^CPSizeConstraint *(CGFloat offsetY) {
        self.offset = CGSizeMake(self.offset.width, offsetY);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat multiplier))multipliedBy {
    return ^CPSizeConstraint *(CGFloat multiplier) {
        self.multiplier = multiplier;
        return self;
    };
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    CGSize size;
    if (self.item) {
        make.size.equalToWithRelation(self.item, self.relation).multipliedBy(self.multiplier).sizeOffset(self.offset);
        size = CGSizeMake(self.item.$width * self.multiplier + self.offset.width, self.item.$height * self.multiplier + self.offset.height);
    } else {
        make.width.equalToWithRelation(@(self.size.width), self.relation);
        make.height.equalToWithRelation(@(self.size.height), self.relation);
        size = self.size;
    }

    // set initial 'frame.size'
    if (!update) {
        self.target.$size = size;
    }
}

@end