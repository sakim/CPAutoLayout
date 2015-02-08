//
//  CPConstraintsBuilder.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import <Masonry/MASUtilities.h>
#import "CPLayoutConstraint.h"

@class CPPositionConstraint;
@class CPHorizontalConstraint;
@class CPVerticalConstraint;
@class CPSizeConstraint;
@class CPWidthConstraint;
@class CPHeightConstraint;
@class CPInsetsConstraint;


@interface CPConstraintsBuilder : NSObject

- (id)initWithView:(MAS_VIEW *)view;

- (CPPositionConstraint * (^)(CPPosition position))position;
- (CPHorizontalConstraint * (^)(CPPosition position))horizontal;
- (CPVerticalConstraint * (^)(CPPosition position))vertical;
- (CPSizeConstraint *)size;
- (CPWidthConstraint *)width;
- (CPHeightConstraint *)height;
- (CPInsetsConstraint * (^)(UIEdgeInsets insets))insets;

- (void)make;
- (void)update;

@end