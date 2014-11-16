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


- (void)update:(MASConstraintMaker *)make
{
    if (_position == CPPositionCenter) {
        make.centerX.equalTo(_item.mas_centerX).with.offset(_offset.width).priorityLow();
        make.centerY.equalTo(_item.mas_centerY).with.offset(_offset.height).priorityLow();
    } else { // default: center alignment
        make.centerX.equalTo(_item.mas_centerX).with.priorityLow();
        make.centerY.equalTo(_item.mas_centerY).with.priorityLow();
    }

    // position
    if (_position & CPPositionTop) {
        make.bottom.equalTo(_item.mas_top).with.offset(-_offset.height);
    }

    if (_position & CPPositionRight) {
        make.left.equalTo(_item.mas_right).with.offset(_offset.width);
    }

    if (_position & CPPositionBottom) {
        make.top.equalTo(_item.mas_bottom).with.offset(_offset.height);
    }

    if (_position & CPPositionLeft) {
        make.right.equalTo(_item.mas_left).with.offset(-_offset.width);
    }

    if (_position & CPAlignmentLeft) {
        make.left.equalTo(_item.mas_left).with.offset(_offset.width);
    }

    if (_position & CPAlignmentRight) {
        make.right.equalTo(_item.mas_right).with.offset(-_offset.width);
    }

    if (_position & CPAlignmentTop) {
        make.top.equalTo(_item.mas_top).with.offset(_offset.height);
    }

    if (_position & CPAlignmentBottom) {
        make.bottom.equalTo(_item.mas_bottom).with.offset(-_offset.height);
    }
}

@end