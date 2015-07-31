//
//  CPPositionConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"

@class CPHorizontalConstraint;
@class CPVerticalConstraint;


@interface CPPositionConstraint : CPLayoutConstraint

- (instancetype)initWithPosition:(CPPosition)position;

- (CPPositionConstraint * (^)(CPAlignment alignment))aligned;
- (CPPositionConstraint * (^)(MAS_VIEW *item))toItem;
- (CPPositionConstraint * (^)(CGPoint offset))withOffset;
- (CPPositionConstraint * (^)(CGFloat offsetX))withOffsetX;
- (CPPositionConstraint * (^)(CGFloat offsetY))withOffsetY;

// internal use
@property (nonatomic, strong) CPHorizontalConstraint *horizontalConstraint;
@property (nonatomic, strong) CPVerticalConstraint *verticalConstraint;

@end