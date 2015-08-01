# CPAutoLayout 

[![Build Status](https://img.shields.io/travis/sakim/CPAutoLayout.svg?style=flat-square)](https://travis-ci.org/sakim/CPAutoLayout)
[![CocoaPods](https://img.shields.io/cocoapods/v/CPAutoLayout.svg?style=flat-square)](https://cocoapods.org/pods/CPAutoLayout)

CPAutoLayout is a position-based AutoLayout shorthand. It focuses common use cases of AutoLayout. It is easy to describe AutoLayout constraints with a position and related size.

## Usage

Imagine a simple example in which you want to have a view with 100x100 size fit into superview's right upper corner.

This is very annoying job with 'NSLayoutConstraint' or Visual Format Language (VFL).

Even with [Masonry](https://github.com/Masonry/Masonry), all the hard edge comparison is your own job to do.

```obj-c
[view mas_makeConstraints:^(MASConstraintMaker *make) {
    // edge to edge match
    make.top.equalTo(self.view.mas_top);
    make.right.equalTo(self.view.mas_right);
    make.width.equalTo(@(100));
    make.height.equalTo(@(100));
}];
```

With 'CPAutoLayout', you only need to consider position and size.

```obj-c
[view makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionCenter).aligned(CPAlignmentTop|CPAlignmentRight);
    builder.size.equalTo(CGSizeMake(100, 100));
}];
```

A lot of examples are ready. To run the example project, clone the repo, and open the project from Example directory.

### Position & Alignment

#### Position

![position](https://raw.githubusercontent.com/sakim/CPAutoLayout/master/images/1_position.png)

```obj-c
// positioned center of its superview
UIView *centerView = [[UIView alloc] init];
centerView.backgroundColor = [UIColor firstColor];
[self.view addSubview:centerView];
[centerView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionCenter);
    builder.size.equalTo(CGSizeMake(100, 100));
}];

// positioned right of centerView
UIView *rightView = [[UIView alloc] init];
rightView.backgroundColor = [UIColor secondColor];
[self.view addSubview:rightView];
[rightView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionRight).toItem(centerView);
    builder.size.equalTo(CGSizeMake(100, 100));
}];

// positioned bottom of centerView with distance.
UIView *bottomView = [[UIView alloc] init];
bottomView.backgroundColor = [UIColor secondColor];
[self.view addSubview:bottomView];
[bottomView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionBottom).toItem(centerView).withOffsetY(10);
    builder.size.equalTo(CGSizeMake(100, 100));
}];
```

#### Alignment

![alignment](https://raw.githubusercontent.com/sakim/CPAutoLayout/master/images/2_alignment.png)

```obj-c
// positioned inside of its superview and top-left aligned
UIView *centerView = [[UIView alloc] init];
centerView.backgroundColor = [UIColor firstColor];
[self.view addSubview:centerView];
[centerView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionCenter).aligned(CPAlignmentTop|CPAlignmentLeft);
    builder.size.equalTo(CGSizeMake(100, 100));
}];

// positioned right of centerView and top aligned
UIView *rightView = [[UIView alloc] init];
rightView.backgroundColor = [UIColor secondColor];
[self.view addSubview:rightView];
[rightView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionRight).aligned(CPAlignmentTop).toItem(centerView);
    builder.size.equalTo(CGSizeMake(50, 50));
}];

// positioned bottom of centerView and left aligned with offset .
UIView *bottomView = [[UIView alloc] init];
bottomView.backgroundColor = [UIColor secondColor];
[self.view addSubview:bottomView];
[bottomView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionBottom).aligned(CPAlignmentLeft).toItem(centerView).withOffset(CGPointMake(5, 5));
    builder.size.equalTo(CGSizeMake(50, 50));
}];
```

#### Position - Advanced

![position(advanced)](https://raw.githubusercontent.com/sakim/CPAutoLayout/master/images/3_position_advanced.png)

```obj-c
// positioned right of centerView and bottom of rightView.
UIView *bottomView = [[UIView alloc] init];
bottomView.backgroundColor = [UIColor secondColor];
[self.view addSubview:bottomView];
[bottomView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.horizontal(CPPositionRight).toItem(centerView);
    builder.vertical(CPPositionBottom).toItem(rightView);
    builder.size.equalTo(CGSizeMake(50, 50));
}];
```

### Size

#### Fixed Size

![fixed size](https://raw.githubusercontent.com/sakim/CPAutoLayout/master/images/4_fixed_size.png)

```obj-c
// 100x100
[centerView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionCenter);
    builder.size.equalTo(CGSizeMake(100, 100));
}];
```

```obj-c
// 100x100
[centerView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionCenter);
    builder.width.equalTo(100);
    builder.height.equalTo(100);
}];
```

#### Relative Size

![relative size](https://raw.githubusercontent.com/sakim/CPAutoLayout/master/images/5_relative_size.png)

```obj-c
// == size of centerView
UIView *rightView = [[UIView alloc] init];
rightView.backgroundColor = [UIColor secondColor];
[self.view addSubview:rightView];
[rightView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionRight).toItem(centerView).withOffsetX(10);
    builder.size.equalToItem(centerView);
}];

// width == width of centerView, height == 50
UIView *bottomView = [[UIView alloc] init];
bottomView.backgroundColor = [UIColor secondColor];
[self.view addSubview:bottomView];
[bottomView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionBottom).toItem(centerView).withOffsetY(10);
    builder.width.equalToItem(centerView);
    builder.height.equalTo(50);
}];

// == size of centerView * 0.7
UIView *leftView = [[UIView alloc] init];
leftView.backgroundColor = [UIColor secondColor];
[self.view addSubview:leftView];
[leftView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionLeft).toItem(centerView).withOffsetX(10);
    builder.size.equalToItem(centerView).multipliedBy(0.7);
}];
```

#### Aspect Ratio

![aspect ratio](https://raw.githubusercontent.com/sakim/CPAutoLayout/master/images/6_aspect_ratio.png)

```obj-c
// 1:0.5
UIView *centerView = [[UIView alloc] init];
centerView.backgroundColor = [UIColor firstColor];
[self.view addSubview:centerView];
[centerView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionCenter);
    builder.width.equalTo(100);
    builder.height.aspectRatio(0.5);
}];
self.centerView = centerView;

// 0.7:1
UIView *rightView = [[UIView alloc] init];
rightView.backgroundColor = [UIColor secondColor];
[self.view addSubview:rightView];
[rightView makeConstraints:^(CPConstraintsBuilder *builder) {
    builder.position(CPPositionCenter).withOffsetY(-100);
    builder.width.aspectRatio(0.7);
    builder.height.equalToItem(centerView);
}];
```

### Update Constraints

Update position constraint. Preserve other constraints.

```obj-c
[self.centerView updateConstraints:^(CPConstraintsBuilder *builder) {
    builder.vertical(CPPositionCenter); // horizontal position is derived from its previous position.
}];
```

Update size constraint. Preserve other constraints.

```obj-c
[self.centerView updateConstraints:^(CPConstraintsBuilder *builder) {
    builder.width.equalTo(100); // height is derived from its previous size.
}];
```

### Animate

Call 'layoutIfNeeded' inside of animation block to animate constraints update.

```obj-c
[UIView animateWithDuration:0.5 animations:^{
    [self.centerView updateConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionCenter);
    }];
    [self.view layoutIfNeeded];
}];
```

## Installation

CPAutoLayout is available on [CocoaPods](http://cocoapods.org/). Just add the following to your project Podfile:

>`pod 'CPAutoLayout'`

## Author

Sung Ahn Kim, ccoroom@gmail.com

## License

CPAutoLayout is available under the MIT license. See the LICENSE file for more info.

