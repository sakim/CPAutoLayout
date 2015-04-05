//
//  CPPositionConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import <CPAutoLayout/CPLayoutConstraint.h>
#import <CPAutoLayout/CPPositionConstraint.h>
#import "CPPositionConstraint.h"
#import "Masonry.h"


@interface CPPositionConstraint ()

@property (nonatomic, assign) CPPosition position;
@property (nonatomic, assign) CPAlignment alignment;
@property (nonatomic, assign) CGPoint offset;
@property (nonatomic, weak) MAS_VIEW *item;

@end


@implementation CPPositionConstraint

- (instancetype)initWithPosition:(CPPosition)position
{
    self = [super init];
    if (self) {
        _position = position;
        _offset = CGPointZero;
    }
    return self;
}


- (CPPositionConstraint * (^)(CPAlignment alignment))aligned {
    return ^id(CPAlignment alignment) {
        self.alignment = alignment;
        return self;
    };
}


- (CPPositionConstraint * (^)(MAS_VIEW *item))toItem
{
    return ^id(MAS_VIEW *item) {
        self.item = item;
        return self;
    };
}


- (CPPositionConstraint * (^)(CGPoint offset))withOffset
{
    return ^id (CGPoint offset) {
        self.offset = offset;
        return self;
    };
}


- (CPPositionConstraint *(^)(CGFloat offsetX))withOffsetX
{
    return ^id (CGFloat offsetX) {
        CGPoint offset = self.offset;
        self.offset = CGPointMake(offsetX, offset.y);
        return self;
    };
}


- (CPPositionConstraint *(^)(CGFloat offsetY))withOffsetY
{
    return ^id (CGFloat offsetY) {
        CGPoint offset = self.offset;
        self.offset = CGPointMake(offset.x, offsetY);
        return self;
    };
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    MAS_VIEW *item = (self.item != nil) ? self.item : self.target.superview;
    // default center
    make.centerX.equalTo(item.mas_centerX).with.offset(self.offset.x).priorityLow();
    make.centerY.equalTo(item.mas_centerY).with.offset(self.offset.y).priorityLow();

    // position
    if (self.position & CPPositionTop) {
        make.bottom.equalTo(item.mas_top).with.offset(-self.offset.y);
    } else if (self.position & CPPositionRight) {
        make.left.equalTo(item.mas_right).with.offset(self.offset.x);
    } else if (self.position & CPPositionBottom) {
        make.top.equalTo(item.mas_bottom).with.offset(self.offset.y);
    } else if (self.position & CPPositionLeft) {
        make.right.equalTo(item.mas_left).with.offset(-self.offset.x);
    }

    // alignment
    if (self.alignment & CPAlignmentLeft) {
        make.left.equalTo(item.mas_left).with.offset(self.offset.x);
    } else if (self.alignment & CPAlignmentRight) {
        make.right.equalTo(item.mas_right).with.offset(-self.offset.x);
    }

    if (self.alignment & CPAlignmentTop) {
        make.top.equalTo(item.mas_top).with.offset(self.offset.y);
    } else if (self.alignment & CPAlignmentBottom) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-self.offset.y);
    }

    // backward compatibility
    if (self.position & CPAlignmentLeft) {
        make.left.equalTo(item.mas_left).with.offset(self.offset.x);
    } else if (self.position & CPAlignmentRight) {
        make.right.equalTo(item.mas_right).with.offset(-self.offset.x);
    }

    if (self.position & CPAlignmentTop) {
        make.top.equalTo(item.mas_top).with.offset(self.offset.y);
    } else if (self.position & CPAlignmentBottom) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-self.offset.y);
    }
}

@end