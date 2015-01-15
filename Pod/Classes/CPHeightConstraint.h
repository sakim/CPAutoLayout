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

- (CPHeightConstraint * (^)(UIView *item))toItem;
- (CPHeightConstraint * (^)(CGFloat offsetY))withOffsetY;
- (CPHeightConstraint * (^)(CGFloat multiplier))multipliedBy;
- (CPHeightConstraint * (^)(CGFloat aspectRatio))aspectRatio;

// relations
- (CPHeightConstraint * (^)())equal;
- (CPHeightConstraint * (^)())less;
- (CPHeightConstraint * (^)())greater;

@end