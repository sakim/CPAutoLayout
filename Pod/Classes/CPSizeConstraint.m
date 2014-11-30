//
//  CPSizeConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPSizeConstraint.h"
#import "Masonry.h"


@interface CPSizeConstraint ()

@property (nonatomic, assign) CGSize size;

// relative size
@property (nonatomic, strong) UIView *item;
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


- (CPSizeConstraint *(^)(CGSize size))value
{
    return ^CPSizeConstraint *(CGSize size) {
        self.size = size;
        return self;
    };
}


- (CPSizeConstraint * (^)(UIView *item))toItem
{
    return ^CPSizeConstraint *(UIView *toItem) {
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


- (void)update:(MASConstraintMaker *)make
{
    if (self.item) {
        make.size.equalTo(self.item).multipliedBy(self.multiplier).sizeOffset(self.offset);
    } else {
        make.width.equalTo(@(self.size.width));
        make.height.equalTo(@(self.size.height));
    }
}

@end