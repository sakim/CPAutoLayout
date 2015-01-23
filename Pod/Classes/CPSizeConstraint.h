//
//  CPSizeConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPSizeConstraint : CPLayoutConstraint

- (CPSizeConstraint * (^)(CGSize size))equalTo;
- (CPSizeConstraint * (^)(CGSize size))lessThanOrEqualTo;
- (CPSizeConstraint * (^)(CGSize size))greaterThanOrEqualTo;

- (CPSizeConstraint * (^)(MAS_VIEW *item))equalToItem;
- (CPSizeConstraint * (^)(MAS_VIEW *item))lessThanOrEqualToItem;
- (CPSizeConstraint * (^)(MAS_VIEW *item))greaterThanOrEqualToItem;

- (CPSizeConstraint * (^)(CGSize offset))withSizeOffset;
- (CPSizeConstraint * (^)(CGFloat offsetX))withSizeOffsetX;
- (CPSizeConstraint * (^)(CGFloat offsetY))withSizeOffsetY;
- (CPSizeConstraint * (^)(CGFloat multiplier))multipliedBy;

@end