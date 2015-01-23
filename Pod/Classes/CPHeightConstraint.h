//
//  CPHeightConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPHeightConstraint : CPLayoutConstraint

- (CPHeightConstraint * (^)(CGFloat width))equalTo;
- (CPHeightConstraint * (^)(CGFloat width))lessThanOrEqualTo;
- (CPHeightConstraint * (^)(CGFloat width))greaterThanOrEqualTo;

- (CPHeightConstraint * (^)(MAS_VIEW *item))equalToItem;
- (CPHeightConstraint * (^)(MAS_VIEW *item))lessThanOrEqualToItem;
- (CPHeightConstraint * (^)(MAS_VIEW *item))greaterThanOrEqualToItem;

- (CPHeightConstraint * (^)(MAS_VIEW *item))distanceToTopOf;
- (CPHeightConstraint * (^)(MAS_VIEW *item))distanceToBottomOf;

- (CPHeightConstraint * (^)(CGFloat offsetY))withSizeOffsetY;
- (CPHeightConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPHeightConstraint * (^)(CGFloat aspectRatio))aspectRatio;

- (BOOL)hasAspectRatio;

@end