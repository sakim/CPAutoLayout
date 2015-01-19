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

- (CPSizeConstraint * (^)(CGSize offset))withOffset;
- (CPSizeConstraint * (^)(CGFloat offsetX))withOffsetX;
- (CPSizeConstraint * (^)(CGFloat offsetY))withOffsetY;
- (CPSizeConstraint * (^)(CGFloat multiplier))multipliedBy;

// read-only
@property (nonatomic, assign, readonly) CGSize size;
@property (nonatomic, assign, readonly) NSLayoutRelation relation;
@property (nonatomic, weak, readonly) MAS_VIEW *item;
@property (nonatomic, assign, readonly) CGSize offset;
@property (nonatomic, assign, readonly) CGFloat multiplier;

@end