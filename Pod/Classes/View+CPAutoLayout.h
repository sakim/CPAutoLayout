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

- (void)setConstraints:(void(^)(CPConstraintsBuilder *))block __attribute__((deprecated));
- (void)makeConstraints:(void(^)(CPConstraintsBuilder *))block;
- (void)remakeConstraints:(void(^)(CPConstraintsBuilder *))block;
- (void)updateConstraints:(void(^)(CPConstraintsBuilder *))block;


// https://gist.github.com/nfarina/3412730
@property (nonatomic, assign) CGPoint $origin;
@property (nonatomic, assign) CGSize $size;
@property (nonatomic, assign) CGFloat $x, $y, $width, $height; // normal rect properties
@property (nonatomic, assign) CGFloat $left, $top, $right, $bottom; // these will stretch the rect

@end