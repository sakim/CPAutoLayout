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

// read-only
@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, assign, readonly) NSLayoutRelation relation;
@property (nonatomic, weak, readonly) MAS_VIEW *item;
@property (nonatomic, assign, readonly) CGFloat offsetY;
@property (nonatomic, assign, readonly) CGFloat multiplier;
@property (nonatomic, assign, readonly) CGFloat aspect;

@end