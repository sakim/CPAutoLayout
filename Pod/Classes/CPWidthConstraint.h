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

- (CPWidthConstraint * (^)(CGFloat offsetX))withOffsetX;
- (CPWidthConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPWidthConstraint * (^)(CGFloat aspectRatio))aspectRatio;

// read-only
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) NSLayoutRelation relation;
@property (nonatomic, weak, readonly) MAS_VIEW *item;
@property (nonatomic, assign, readonly) CGFloat offsetX;
@property (nonatomic, assign, readonly) CGFloat multiplier;
@property (nonatomic, assign, readonly) CGFloat aspect;

@end