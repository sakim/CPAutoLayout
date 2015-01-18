//
//  CPConstraintsBuilder.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import <Masonry/MASUtilities.h>
#import "CPLayoutConstraint.h"

@class CPSizeConstraint;
@class CPPositionConstraint;
@class CPInsetsConstraint;
@class CPWidthConstraint;
@class CPHeightConstraint;


@interface CPConstraintsBuilder : NSObject

- (id)initWithView:(MAS_VIEW *)view;

- (CPPositionConstraint * (^)(CPPosition position))position;
- (CPPositionConstraint * (^)(CPPosition position))toPosition; // represent implicit size
- (CPSizeConstraint *)size;
- (CPWidthConstraint *)width;
- (CPHeightConstraint *)height;
- (CPInsetsConstraint * (^)(UIEdgeInsets insets))insets;

- (void)build;
- (void)update;

@end