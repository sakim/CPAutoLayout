# CPAutoLayout [![Build Status](https://travis-ci.org/sakim/CPAutoLayout.svg?branch=master)](https://travis-ci.org/sakim/CPAutoLayout.svg)

CPAutoLayout is a position-based AutoLayout shorthand. It focuses common use cases of AutoLayout. Easily describe AutoLayout constraints with a position and related size.

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

With 'CPAutoLayout', you only need to consider position and alignment.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentRight)
        builder.size.equalTo(CGSizeMake(100, 100));
    }];
```

A lot of examples are ready. To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Position & Alignment

![position](https://github.com/sakim/CPAutoLayout/blob/master/images/cpautolayout.jpg?raw=true)

Represent position with CPPosition options.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionRight | CPAlignmentTop);
        ....
    }];
```

Position offset is a distance from its anchor point.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPPositionRight | CPAlignmentTop).withOffsetX(10);
        ....
    }];
```

### Size

#### Fixed Size

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.size.equalTo(CGSizeMake(100, 100));
        builder.position(...);
    }];
```

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.width.equalTo(100);
        builder.height.equalTo(100);
        builder.position(...);
    }];
```
#### Relative Size

Size equal to a item.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.size.equalToItem(aView);
        builder.position(...);
    }];
```

Width equal to a item's width, and has fixed height.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.width.equalToItem(aView);
        builder.height.equalTo(50);
        builder.position(...);
    }];
```

View has always half size to a item.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.size.equalToItem(aView).multipliedBy(.5f);
        builder.position(...);
    }];
```

Size offset is size difference to a item.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.size.equalToItem(aView).withOffset(CGSizeMake(10, 10));
        builder.position(...);
    }];
```
#### Size with Aspect Ratio

Keep 2:1 aspect ratio.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.width.aspectRatio(2);
        builder.height.equalTo(50);
        builder.position(...);
    }];
```

Same as,

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.width.equalTo(100);
        builder.height.aspectRatio(.5f);
        builder.position(...);
    }];
```
### Insets

Usually used to represent background view.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
```


## Installation

CPAutoLayout is available on [CocoaPods](http://cocoapods.org/). Just add the following to your project Podfile:

>`pod 'CPAutoLayout'`

## Versions

#### 0.4.0

Significant API changes to clarity.

* value() to equalTo(): builder.size.value(...) to builder.size.equalTo(...)
* toItem() to equalToItem(): builder.size.toItem(...) to builder.size.equalToItem(...)
* lessThanOrEqualTo(...), greaterThanOrEqualTo(...), lessThanOrEqualToItem(...), greaterThanOrEqualToItem(...)
* CGSize to CGPoint in position offset.

#### 0.3.3

* Add support lessOrEqual and greaterOrEqual relation.
* Add support initial 'frame.size'. (experimental)

## Author

Sung Ahn Kim, ccoroom@gmail.com

## License

CPAutoLayout is available under the MIT license. See the LICENSE file for more info.

