//
//  CPPositionConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import <CPAutoLayout/CPLayoutConstraint.h>
#import <CPAutoLayout/CPPositionConstraint.h>
#import <CPAutoLayout/CPHorizontalConstraint.h>
#import <CPAutoLayout/CPVerticalConstraint.h>
#import "CPPositionConstraint.h"
#import "Masonry.h"


@implementation CPPositionConstraint

- (instancetype)initWithPosition:(CPPosition)position
{
    self = [super init];
    if (self) {
        _horizontalConstraint = [[CPHorizontalConstraint alloc] initWithPosition:position];
        _verticalConstraint = [[CPVerticalConstraint alloc] initWithPosition:position];
    }
    return self;
}


- (void)setTarget:(UIView *)target {
    _horizontalConstraint.target = target;
    _verticalConstraint.target = target;
}


- (CPPositionConstraint * (^)(CPAlignment alignment))aligned {
    return ^id(CPAlignment alignment) {
        _horizontalConstraint.aligned(alignment);
        _verticalConstraint.aligned(alignment);
        return self;
    };
}


- (CPPositionConstraint * (^)(MAS_VIEW *item))toItem
{
    return ^id(MAS_VIEW *item) {
        _horizontalConstraint.toItem(item);
        _verticalConstraint.toItem(item);
        return self;
    };
}


- (CPPositionConstraint * (^)(CGPoint offset))withOffset
{
    return ^id (CGPoint offset) {
        _horizontalConstraint.withOffsetX(offset.x);
        _verticalConstraint.withOffsetY(offset.y);
        return self;
    };
}


- (CPPositionConstraint *(^)(CGFloat offsetX))withOffsetX
{
    return ^id (CGFloat offsetX) {
        _horizontalConstraint.withOffsetX(offsetX);
        return self;
    };
}


- (CPPositionConstraint *(^)(CGFloat offsetY))withOffsetY
{
    return ^id (CGFloat offsetY) {
        _verticalConstraint.withOffsetY(offsetY);
        return self;
    };
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    [_horizontalConstraint build:make update:update];
    [_verticalConstraint build:make update:update];
}

@end