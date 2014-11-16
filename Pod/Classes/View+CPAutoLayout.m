//
//  View+CPAutoLayout.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "View+CPAutoLayout.h"

@implementation MAS_VIEW (CPAutoLayout)


- (void)setConstraints:(void(^)(CPConstraintsBuilder *))block
{
    CPConstraintsBuilder *builder = [[CPConstraintsBuilder alloc] initWithView:self];
    block(builder);
    [builder build];
}


- (void)updateConstraints:(void(^)(CPConstraintsBuilder *))block
{
    CPConstraintsBuilder *builder = [[CPConstraintsBuilder alloc] initWithView:self];
    block(builder);
    [builder update];
}


@end