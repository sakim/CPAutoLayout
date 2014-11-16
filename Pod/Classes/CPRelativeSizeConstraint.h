//
//  CPRelativeSizeConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPRelativeSizeConstraint : CPLayoutConstraint

- (instancetype)initWithRelativeSize:(UIView *)relative;
- (instancetype)initWithRelativeWidth:(UIView *)relative;
- (instancetype)initWithRelativeHeight:(UIView *)relative;

- (CPRelativeSizeConstraint * (^)(CGSize sizeOffset))withSizeOffset;
- (CPRelativeSizeConstraint * (^)(CGFloat multiplier))multipliedBy;

@end