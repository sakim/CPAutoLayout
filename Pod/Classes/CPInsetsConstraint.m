//
//  CPInsetsConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPInsetsConstraint.h"
#import "Masonry.h"

@interface CPInsetsConstraint ()

@property (nonatomic, assign) MASEdgeInsets insets;
@property (nonatomic, weak) MAS_VIEW *item;

@end


@implementation CPInsetsConstraint

- (instancetype)initWithInsets:(MASEdgeInsets)insets
{
    self = [super init];
    if (self) {
        _insets = insets;
    }
    return self;
}


- (CPInsetsConstraint * (^)(MAS_VIEW *item))toItem
{
    return ^id(MAS_VIEW *item) {
        self.item = item;
        return self;
    };
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    MAS_VIEW *item = (self.item != nil) ? self.item : self.target.superview;

    if (!isnan(self.insets.top)) {
        make.top.equalTo(item.mas_top).with.offset(self.insets.top);
    }

    if (!isnan(self.insets.right)) {
        make.right.equalTo(item.mas_right).with.offset(-self.insets.right);
    }

    if (!isnan(self.insets.bottom)) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-self.insets.bottom);
    }

    if (!isnan(self.insets.left)) {
        make.left.equalTo(item.mas_left).with.offset(self.insets.left);
    }
}

@end