//
// Created by sakim on 15. 2. 8..
//

#import "CPLayoutConstraint.h"


@interface CPHorizontalConstraint : CPLayoutConstraint

- (instancetype)initWithPosition:(CPPosition)position;

- (CPHorizontalConstraint * (^)(CPAlignment alignment))aligned;
- (CPHorizontalConstraint * (^)(MAS_VIEW *item))toItem;
- (CPHorizontalConstraint * (^)(CGFloat offsetX))withOffsetX;

@end