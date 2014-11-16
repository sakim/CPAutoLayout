//
//  CPRelativeSizeConstraint.m
//  CPAutoLayout
//
//  Created by Sung Ahn Kim on 11/16/2014.
//  Copyright (c) 2014 Sung Ahn Kim. All rights reserved.
//

#import "CPRelativeSizeConstraint.h"
#import "Masonry.h"


typedef NS_ENUM(NSUInteger , CPSizeRelation) {
    CPSizeRelationSize      = 1 << 0,
    CPSizeRelationWidth     = 1 << 1,
    CPSizeRelationHeight    = 1 << 2,
};

@interface CPRelativeSizeConstraint()

@property (nonatomic, strong) UIView *relative;
@property (nonatomic, assign) CPSizeRelation relation;
@property (nonatomic, assign) CGFloat multiplier;
@property (nonatomic, assign) CGSize sizeOffset;

@end


@implementation CPRelativeSizeConstraint

- (instancetype)initWithRelativeSize:(UIView *)relative
{
    return [self initWithRelative:relative relation:CPSizeRelationSize];
}


- (instancetype)initWithRelativeWidth:(UIView *)relative
{
    return [self initWithRelative:relative relation:CPSizeRelationWidth];
}


- (instancetype)initWithRelativeHeight:(UIView *)relative
{
    return [self initWithRelative:relative relation:CPSizeRelationHeight];
}


- (instancetype)initWithRelative:(UIView *)relative relation:(CPSizeRelation)relation
{
    self = [super init];
    if (self) {
        _relative = relative;
        _relation = relation;
        _multiplier = 1.f;
        _sizeOffset = CGSizeZero;
    }

    return self;
}


- (CPRelativeSizeConstraint *(^)(CGSize sizeOffset))withSizeOffset
{
    return ^id(CGSize sizeOffset) {
        _sizeOffset = sizeOffset;
        return self;
    };
}


- (CPRelativeSizeConstraint *(^)(CGFloat multiplier))multipliedBy
{
    return ^id(CGFloat multiplier) {
        _multiplier = multiplier;
        return self;
    };
}


- (void)update:(MASConstraintMaker *)make
{
    if (_relation == CPSizeRelationSize) {
        make.size.equalTo(_relative).with.multipliedBy(_multiplier).with.sizeOffset(_sizeOffset);
    } else if (_relation == CPSizeRelationWidth) {
        make.width.equalTo(_relative.mas_width).with.multipliedBy(_multiplier).with.sizeOffset(_sizeOffset);;
    } else if (_relation == CPSizeRelationHeight) {
        make.height.equalTo(_relative.mas_height).with.multipliedBy(_multiplier).with.sizeOffset(_sizeOffset);;
    }
}

@end