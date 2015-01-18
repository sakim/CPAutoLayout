//
//  CPHeightConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/28/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPHeightConstraint : CPLayoutConstraint

- (CPHeightConstraint * (^)(CGFloat height))value;

- (CPHeightConstraint * (^)(MAS_VIEW *item))toItem;
- (CPHeightConstraint * (^)(CGFloat offsetY))withOffsetY;
- (CPHeightConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPHeightConstraint * (^)(CGFloat aspectRatio))aspectRatio;

// relations
- (CPHeightConstraint * (^)())equal;
- (CPHeightConstraint * (^)())less;
- (CPHeightConstraint * (^)())greater;

// read-only
@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, assign, readonly) NSLayoutRelation relation;
@property (nonatomic, weak, readonly) MAS_VIEW *item;
@property (nonatomic, assign, readonly) CGFloat offsetY;
@property (nonatomic, assign, readonly) CGFloat multiplier;
@property (nonatomic, assign, readonly) CGFloat aspect;

@end