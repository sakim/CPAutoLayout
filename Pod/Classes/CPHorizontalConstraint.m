//
// Created by sakim on 15. 2. 8..
//

#import "CPHorizontalConstraint.h"
#import "Masonry.h"


@interface CPHorizontalConstraint ()

@property (nonatomic, assign) CPPosition position;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, weak) MAS_VIEW *item;

@end

@implementation CPHorizontalConstraint

- (instancetype)initWithPosition:(CPPosition)position
{
    self = [super init];
    if (self) {
        _position = position;
    }
    return self;
}


- (CPHorizontalConstraint * (^)(MAS_VIEW *item))toItem
{
    return ^id(MAS_VIEW *item) {
        self.item = item;
        return self;
    };
}


- (CPHorizontalConstraint *(^)(CGFloat offsetX))withOffsetX
{
    return ^id (CGFloat offsetX) {
        self.offsetX = offsetX;
        return self;
    };
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    MAS_VIEW *item = (self.item != nil) ? self.item : self.target.superview;
    // default center
    make.centerX.equalTo(item.mas_centerX).with.offset(self.offsetX).priorityLow();

    // position
    if (self.position & CPPositionRight) {
        make.left.equalTo(item.mas_right).with.offset(self.offsetX);
    }

    if (self.position & CPPositionLeft) {
        make.right.equalTo(item.mas_left).with.offset(-self.offsetX);
    }

    if (self.position & CPAlignmentLeft) {
        make.left.equalTo(item.mas_left).with.offset(self.offsetX);
    }

    if (self.position & CPAlignmentRight) {
        make.right.equalTo(item.mas_right).with.offset(-self.offsetX);
    }
}

@end