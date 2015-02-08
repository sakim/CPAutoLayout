//
// Created by sakim on 15. 2. 8..
//

#import <Foundation/Foundation.h>
#import "CPLayoutConstraint.h"


@interface CPVerticalConstraint : CPLayoutConstraint

- (instancetype)initWithPosition:(CPPosition)position;

- (CPVerticalConstraint * (^)(MAS_VIEW *item))toItem;
- (CPVerticalConstraint * (^)(CGFloat offsetY))withOffsetY;

@end