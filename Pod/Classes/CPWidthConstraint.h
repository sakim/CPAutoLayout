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

- (CPWidthConstraint * (^)(MAS_VIEW *item))toItem;
- (CPWidthConstraint * (^)(CGFloat offsetX))withOffsetX;
- (CPWidthConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPWidthConstraint * (^)(CGFloat aspectRatio))aspectRatio;

// relations
- (CPWidthConstraint * (^)())equal;
- (CPWidthConstraint * (^)())less;
- (CPWidthConstraint * (^)())greater;

// read-only
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) NSLayoutRelation relation;
@property (nonatomic, weak, readonly) MAS_VIEW *item;
@property (nonatomic, assign, readonly) CGFloat offsetX;
@property (nonatomic, assign, readonly) CGFloat multiplier;
@property (nonatomic, assign, readonly) CGFloat aspect;

@end