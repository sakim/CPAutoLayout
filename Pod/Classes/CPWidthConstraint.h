//
//  CPHeightConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPWidthConstraint : CPLayoutConstraint

- (CPWidthConstraint * (^)(CGFloat width))equalTo;
- (CPWidthConstraint * (^)(CGFloat width))lessThanOrEqualTo;
- (CPWidthConstraint * (^)(CGFloat width))greaterThanOrEqualTo;

- (CPWidthConstraint * (^)(MAS_VIEW *item))equalToItem;
- (CPWidthConstraint * (^)(MAS_VIEW *item))lessThanOrEqualToItem;
- (CPWidthConstraint * (^)(MAS_VIEW *item))greaterThanOrEqualToItem;

- (CPWidthConstraint * (^)(MAS_VIEW *item))distanceToLeftOf;
- (CPWidthConstraint * (^)(MAS_VIEW *item))distanceToRightOf;

- (CPWidthConstraint * (^)(CGFloat offsetX))withSizeOffsetX;
- (CPWidthConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPWidthConstraint * (^)(CGFloat aspectRatio))aspectRatio;

- (BOOL)hasAspectRatio;

@end