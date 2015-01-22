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

@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, weak) MAS_VIEW *item;

@end


@implementation CPInsetsConstraint

- (instancetype)initWithInsets:(UIEdgeInsets)insets
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
    MAS_VIEW *item = (_item != nil) ? _item : self.target.superview;

    if (!isnan(_insets.top)) {
        make.top.equalTo(item.mas_top).with.offset(_insets.top);
    }

    if (!isnan(_insets.right)) {
        make.right.equalTo(item.mas_right).with.offset(-_insets.right);
    }

    if (!isnan(_insets.bottom)) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-_insets.bottom);
    }

    if (!isnan(_insets.left)) {
        make.left.equalTo(item.mas_left).with.offset(_insets.left);
    }
}

@end