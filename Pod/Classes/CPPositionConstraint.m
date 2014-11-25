//
//  CPPositionConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPPositionConstraint.h"
#import "Masonry.h"


@interface CPPositionConstraint ()

@property (nonatomic, assign) CPPosition position;
@property (nonatomic, assign) CGSize offset;
@property (nonatomic, strong) UIView *item;

@end


@implementation CPPositionConstraint

- (instancetype)initWithPosition:(CPPosition)position
{
    self = [super init];
    if (self) {
        _position = position;
        _offset = CGSizeZero;
    }
    return self;
}


- (CPPositionConstraint * (^)(UIView *item))toItem
{
    return ^id(UIView *item) {
        self.item = item;
        return self;
    };
}


- (CPPositionConstraint * (^)(CGSize offset))withOffset
{
    return ^id(CGSize offset) {
        self.offset = offset;
        return self;
    };
}


- (CPPositionConstraint *(^)(CGFloat offsetX))withOffsetX
{
    return ^CPPositionConstraint *(CGFloat offsetX) {
        CGSize offset = self.offset;
        self.offset = CGSizeMake(offsetX, offset.height);
        return self;
    };
}


- (CPPositionConstraint *(^)(CGFloat offsetY))withOffsetY
{
    return ^CPPositionConstraint *(CGFloat offsetY) {
        CGSize offset = self.offset;
        self.offset = CGSizeMake(offset.width, offsetY);
        return self;
    };
}


- (void)update:(MASConstraintMaker *)make
{
    UIView *item = (_item != nil) ? _item : self.target.superview;
    // default center
    make.centerX.equalTo(item.mas_centerX).with.offset(_offset.width).priorityLow();
    make.centerY.equalTo(item.mas_centerY).with.offset(_offset.height).priorityLow();

    // position
    if (_position & CPPositionTop) {
        make.bottom.equalTo(item.mas_top).with.offset(-_offset.height);
    }

    if (_position & CPPositionRight) {
        make.left.equalTo(item.mas_right).with.offset(_offset.width);
    }

    if (_position & CPPositionBottom) {
        make.top.equalTo(item.mas_bottom).with.offset(_offset.height);
    }

    if (_position & CPPositionLeft) {
        make.right.equalTo(item.mas_left).with.offset(-_offset.width);
    }

    if (_position & CPAlignmentLeft) {
        make.left.equalTo(item.mas_left).with.offset(_offset.width);
    }

    if (_position & CPAlignmentRight) {
        make.right.equalTo(item.mas_right).with.offset(-_offset.width);
    }

    if (_position & CPAlignmentTop) {
        make.top.equalTo(item.mas_top).with.offset(_offset.height);
    }

    if (_position & CPAlignmentBottom) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-_offset.height);
    }
}

@end