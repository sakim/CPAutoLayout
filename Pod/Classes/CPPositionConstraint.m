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
@property (nonatomic, weak) MAS_VIEW *item;

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


- (CPPositionConstraint * (^)(MAS_VIEW *item))toItem
{
    return ^id(MAS_VIEW *item) {
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
    MAS_VIEW *item = (self.item != nil) ? self.item : self.target.superview;
    // default center
    make.centerX.equalTo(item.mas_centerX).with.offset(self.offset.width).priorityLow();
    make.centerY.equalTo(item.mas_centerY).with.offset(self.offset.height).priorityLow();

    // position
    if (self.position & CPPositionTop) {
        make.bottom.equalTo(item.mas_top).with.offset(-self.offset.height);
    }

    if (self.position & CPPositionRight) {
        make.left.equalTo(item.mas_right).with.offset(self.offset.width);
    }

    if (self.position & CPPositionBottom) {
        make.top.equalTo(item.mas_bottom).with.offset(self.offset.height);
    }

    if (self.position & CPPositionLeft) {
        make.right.equalTo(item.mas_left).with.offset(-self.offset.width);
    }

    if (self.position & CPAlignmentLeft) {
        make.left.equalTo(item.mas_left).with.offset(self.offset.width);
    }

    if (self.position & CPAlignmentRight) {
        make.right.equalTo(item.mas_right).with.offset(-self.offset.width);
    }

    if (self.position & CPAlignmentTop) {
        make.top.equalTo(item.mas_top).with.offset(self.offset.height);
    }

    if (self.position & CPAlignmentBottom) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-self.offset.height);
    }
}

@end