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
- (CPHeightConstraint * (^)(CGFloat height))less;
- (CPHeightConstraint * (^)(CGFloat height))greater;

- (CPHeightConstraint * (^)(UIView *item))toItem;
- (CPHeightConstraint * (^)(CGFloat offsetY))withOffsetY;
- (CPHeightConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPHeightConstraint * (^)(CGFloat aspectRatio))aspectRatio;

@end