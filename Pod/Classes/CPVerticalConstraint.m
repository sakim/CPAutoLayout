//
// Created by sakim on 15. 2. 8..
//

#import "CPVerticalConstraint.h"
#import "Masonry/Masonry.h"

@interface CPVerticalConstraint ()

@property (nonatomic, assign) CPPosition position;
@property (nonatomic, assign) CPAlignment alignment;
@property (nonatomic, assign) CGFloat offsetY;
@property (nonatomic, weak) MAS_VIEW *item;

@end

@implementation CPVerticalConstraint

- (instancetype)initWithPosition:(CPPosition)position
{
    self = [super init];
    if (self) {
        _position = position;
    }
    return self;
}


- (CPVerticalConstraint * (^)(CPAlignment alignment))aligned {
    return ^id(CPAlignment alignment) {
        self.alignment = alignment;
        return self;
    };
}


- (CPVerticalConstraint * (^)(MAS_VIEW *item))toItem
{
    return ^id(MAS_VIEW *item) {
        self.item = item;
        return self;
    };
}


- (CPVerticalConstraint *(^)(CGFloat offsetY))withOffsetY
{
    return ^id (CGFloat offsetY) {
        self.offsetY = offsetY;
        return self;
    };
}


- (void)build:(MASConstraintMaker *)make update:(BOOL)update
{
    MAS_VIEW *item = (self.item != nil) ? self.item : self.target.superview;
    // default center
    make.centerY.equalTo(item.mas_centerY).with.offset(self.offsetY).priorityLow();

    // position
    if (self.position & CPPositionTop) {
        make.bottom.equalTo(item.mas_top).with.offset(-self.offsetY);
    } else if (self.position & CPPositionBottom) {
        make.top.equalTo(item.mas_bottom).with.offset(self.offsetY);
    }

    // alignment
    if (self.alignment & CPAlignmentTop) {
        make.top.equalTo(item.mas_top).with.offset(self.offsetY);
    } else if (self.alignment & CPAlignmentBottom) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-self.offsetY);
    }

    // backward compatibility
    if (self.position & CPAlignmentTop) {
        make.top.equalTo(item.mas_top).with.offset(self.offsetY);
    } else if (self.position & CPAlignmentBottom) {
        make.bottom.equalTo(item.mas_bottom).with.offset(-self.offsetY);
    }
}

@end