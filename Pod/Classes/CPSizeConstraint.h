//
//  CPSizeConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPLayoutConstraint.h"


@interface CPSizeConstraint : CPLayoutConstraint

- (instancetype)initWithSize:(CGSize)size;
- (instancetype)initWithWidth:(CGFloat)width;
- (instancetype)initWithHeight:(CGFloat)height;

@end