//
//  CPConstraintsBuilder.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"

@class CPSizeConstraint;
@class CPPositionConstraint;
@class CPAspectRatioConstraint;
@class CPRelativeSizeConstraint;


@interface CPConstraintsBuilder : NSObject

- (id)initWithView:(UIView *)view;

- (CPPositionConstraint * (^)(CPPosition position))position;
- (CPSizeConstraint * (^)(CGSize size))size;
- (CPSizeConstraint * (^)(CGFloat width))width;
- (CPSizeConstraint * (^)(CGFloat height))height;
- (CPAspectRatioConstraint * (^)(CGFloat aspectRatio))aspectRatio;
- (CPRelativeSizeConstraint * (^)(UIView *relative))relativeSize;
- (CPRelativeSizeConstraint * (^)(UIView *relative))relativeWidth;
- (CPRelativeSizeConstraint * (^)(UIView *relative))relativeHeight;

- (void)build;
- (void)update;

@end