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
        _relation = NSLayoutRelationEqual;
    }

    return self;
}


- (CPSizeConstraint *(^)(CGSize size))value
{
    return ^CPSizeConstraint *(CGSize size) {
        self.size = size;
        return self;
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item))toItem
{
    return ^CPSizeConstraint *(MAS_VIEW *toItem) {
        self.item = toItem;
        return self;
    };
}


- (CPSizeConstraint *(^)(CGSize offset))withOffset
{
    return ^CPSizeConstraint *(CGSize offset) {
        self.offset = offset;
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat offsetX))withOffsetX
{
    return ^CPSizeConstraint *(CGFloat offsetX) {
        self.offset = CGSizeMake(offsetX, self.offset.height);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat offsetX))withOffsetY
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


- (CPSizeConstraint *(^)())equal
{
    return ^CPSizeConstraint *() {
        self.relation = NSLayoutRelationEqual;
        return self;
    };
}


- (CPSizeConstraint *(^)())less
{
    return ^CPSizeConstraint *() {
        self.relation = NSLayoutRelationLessThanOrEqual;
        return self;
    };
}


- (CPSizeConstraint *(^)())greater
{
    return ^CPSizeConstraint *() {
        self.relation = NSLayoutRelationGreaterThanOrEqual;
        return self;
    };
}


- (void)update:(MASConstraintMaker *)make
{
    if (self.item) {
        make.size.equalToWithRelation(self.item, self.relation).multipliedBy(self.multiplier).sizeOffset(self.offset);
    } else {
        make.width.equalToWithRelation(@(self.size.width), self.relation);
        make.height.equalToWithRelation(@(self.size.height), self.relation);
    }
}

@end