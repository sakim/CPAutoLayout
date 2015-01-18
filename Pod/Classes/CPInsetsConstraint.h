//
//  CPInsetsConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPInsetsConstraint : CPLayoutConstraint

- (instancetype)initWithInsets:(UIEdgeInsets)insets;
- (CPInsetsConstraint * (^)(MAS_VIEW *item))toItem;

@end