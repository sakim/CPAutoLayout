//
// Created by sakim on 14. 11. 30..
// Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPItemView.h"
#import "CPAutoLayout.h"

@implementation CPItemView

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        label.text = title;
        label.font = [UIFont fontWithName:@"GillSans" size:11.f];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 2;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:label];
        [label makeConstraints:^(CPConstraintsBuilder *builder) {
            builder.position(CPPositionCenter);
            builder.size.equalToItem(self);
        }];
        _titleLabel = label;
    }

    return self;
}

@end