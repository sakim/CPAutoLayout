//
//  CPSizeConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import <CPAutoLayout/CPWidthConstraint.h>
#import <CPAutoLayout/CPHeightConstraint.h>
#import "CPSizeConstraint.h"
#import "Masonry.h"

@implementation CPSizeConstraint

- (instancetype)init
{
    self = [super init];
    if (self) {
        _widthConstraint = [[CPWidthConstraint alloc] init];
        _heightConstraint = [[CPHeightConstraint alloc] init];
    }
    return self;
}


- (CPSizeConstraint *(^)(CGSize size))equalTo
{
    return ^id (CGSize size) {
        self.widthConstraint.equalTo(size.width);
        self.heightConstraint.equalTo(size.height);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGSize size))lessThanOrEqualTo
{
    return ^id (CGSize size) {
        self.widthConstraint.lessThanOrEqualTo(size.width);
        self.heightConstraint.lessThanOrEqualTo(size.height);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGSize size))greaterThanOrEqualTo
{
    return ^id (CGSize size) {
        self.widthConstraint.greaterThanOrEqualTo(size.width);
        self.heightConstraint.greaterThanOrEqualTo(size.height);
        return self;
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item))equalToItem
{
    return ^id (MAS_VIEW *item) {
        self.widthConstraint.equalToItem(item);
        self.heightConstraint.equalToItem(item);
        return self;
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item))greaterThanOrEqualToItem
{
    return ^id (MAS_VIEW *item) {
        self.widthConstraint.greaterThanOrEqualToItem(item);
        self.heightConstraint.greaterThanOrEqualToItem(item);
        return self;
    };
}


- (CPSizeConstraint * (^)(MAS_VIEW *item))lessThanOrEqualToItem
{
    return ^id (MAS_VIEW *item) {
        self.widthConstraint.lessThanOrEqualToItem(item);
        self.heightConstraint.lessThanOrEqualToItem(item);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGSize offset))withSizeOffset
{
    return ^CPSizeConstraint *(CGSize offset) {
        self.widthConstraint.withSizeOffsetX(offset.width);
        self.heightConstraint.withSizeOffsetY(offset.height);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat offsetX))withSizeOffsetX
{
    return ^CPSizeConstraint *(CGFloat offsetX) {
        self.widthConstraint.withSizeOffsetX(offsetX);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat offsetX))withSizeOffsetY
{
    return ^CPSizeConstraint *(CGFloat offsetY) {
        self.heightConstraint.withSizeOffsetY(offsetY);
        return self;
    };
}


- (CPSizeConstraint *(^)(CGFloat multiplier))multipliedBy {
    return ^CPSizeConstraint *(CGFloat multiplier) {
        self.widthConstraint.multipliedBy(multiplier);
        self.heightConstraint.multipliedBy(multiplier);
        return self;
    };
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    [self.widthConstraint build:make update:update];
    [self.heightConstraint build:make update:update];
}

@end