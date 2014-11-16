//
//  CPSizeConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPSizeConstraint.h"
#import "Masonry.h"


@interface CPSizeConstraint ()

@property (nonatomic, assign) CGSize size;

@end


@implementation CPSizeConstraint

- (instancetype)initWithSize:(CGSize)size
{
    self = [super init];
    if (self) {
        _size = size;
    }

    return self;
}


- (instancetype)initWithWidth:(CGFloat)width
{
    return [self initWithSize:CGSizeMake(width, NAN)];
}


- (instancetype)initWithHeight:(CGFloat)height
{
    return [self initWithSize:CGSizeMake(NAN, height)];
}


- (void)update:(MASConstraintMaker *)make
{
    if (!isnan(_size.width)) {
        make.width.equalTo(@(_size.width));
    }
    if (!isnan(_size.height)) {
        make.height.equalTo(@(_size.height));
    }
}

@end