//
//  CPPositionConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPPositionConstraint : CPLayoutConstraint

- (instancetype)initWithPosition:(CPPosition)position;

- (CPPositionConstraint * (^)(UIView *item))toItem;
- (CPPositionConstraint * (^)(CGSize offset))withOffset;
- (CPPositionConstraint * (^)(CGFloat offsetX))withOffsetX;
- (CPPositionConstraint * (^)(CGFloat offsetY))withOffsetY;

@end