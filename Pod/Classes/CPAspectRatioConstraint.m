//
//  CPAspectRatioConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPAspectRatioConstraint.h"
#import "masonry.h"


@interface CPAspectRatioConstraint ()

@property (nonatomic, assign) CGFloat aspectRatio;

@end


@implementation CPAspectRatioConstraint

- (instancetype)initWithAspectRatio:(CGFloat)aspectRatio
{
    self = [super init];
    if (self) {
        _aspectRatio = aspectRatio;
    }

    return self;
}


- (void)update:(MASConstraintMaker *)make
{
    make.width.equalTo(self.target.mas_height).with.multipliedBy(_aspectRatio);
}

@end