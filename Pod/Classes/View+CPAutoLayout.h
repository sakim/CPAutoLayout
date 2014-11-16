//
//  View+CPAutoLayout.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "Masonry.h"
#import "CPConstraintsBuilder.h"

@class CPLayoutConstraint;


@interface MAS_VIEW (CPAutoLayout)

- (void)setConstraints:(void(^)(CPConstraintsBuilder *))block;
- (void)updateConstraints:(void(^)(CPConstraintsBuilder *))block;

@end