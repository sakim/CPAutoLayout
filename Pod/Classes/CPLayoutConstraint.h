//
//  CPLayoutConstraint.h
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/MASUtilities.h>

@class MASConstraintMaker;

typedef NS_OPTIONS(NSUInteger, CPPosition) {
    CPPositionCenter    = 0,
    CPPositionTop       = 1 << 0,
    CPPositionRight     = 1 << 1,
    CPPositionBottom    = 1 << 2,
    CPPositionLeft      = 1 << 3,
};


typedef NS_OPTIONS(NSUInteger, CPAlignment) {
    CPAlignmentCenter   = 1 << 4, // backward compatibility
    CPAlignmentTop      = 1 << 5,
    CPAlignmentRight    = 1 << 6,
    CPAlignmentBottom   = 1 << 7,
    CPAlignmentLeft     = 1 << 8
};


@interface CPLayoutConstraint : NSObject

@property (nonatomic, weak) MAS_VIEW *target;

- (void)build:(MASConstraintMaker *)make update:(BOOL)update;

@end