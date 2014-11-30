//
//  CPSizeConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPSizeConstraint : CPLayoutConstraint


- (CPSizeConstraint * (^)(CGSize size))value;
- (CPSizeConstraint * (^)(UIView *item))toItem;
- (CPSizeConstraint * (^)(CGSize offset))withOffset;
- (CPSizeConstraint * (^)(CGFloat offsetX))withOffsetX;
- (CPSizeConstraint * (^)(CGFloat offsetY))withOffsetY;
- (CPSizeConstraint * (^)(CGFloat multiplier))multipliedBy;


@end