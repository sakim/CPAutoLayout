//
//  CPHeightConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPWidthConstraint : CPLayoutConstraint

- (CPWidthConstraint * (^)(CGFloat width))value;
- (CPWidthConstraint * (^)(CGFloat width))less;
- (CPWidthConstraint * (^)(CGFloat width))greater;

- (CPWidthConstraint * (^)(UIView *item))toItem;
- (CPWidthConstraint * (^)(CGFloat offsetX))withOffsetX;
- (CPWidthConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPWidthConstraint * (^)(CGFloat aspectRatio))aspectRatio;

@end