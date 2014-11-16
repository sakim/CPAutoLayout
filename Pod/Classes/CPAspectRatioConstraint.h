//
//  CPAspectRatioConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPAspectRatioConstraint : CPLayoutConstraint

- (instancetype)initWithAspectRatio:(CGFloat)aspectRatio;

@end