# CPAutoLayout

CPAutoLayout is a position-based AutoLayout shorthand. It doesn't cover all of AutoLayout constraints. Instead, it only focus common use cases.

## Usage

A simple example in which you want to have a view with 100x100 size fit into superview's right upper corner.

```obj-c
[view setConstraints:^(CPConstraintsBuilder *builder) {
        builder.position(CPAlignmentTop|CPAlignmentRight)
               .toItem(superview);
        builder.size.value(CGSizeMake(100, 100));
    }];
```
To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Position & Alignment

![position](https://github.com/sakim/CPAutoLayout/blob/master/images/cpautolayout.jpg?raw=true)

## Installation

CPAutoLayout is available on [CocoaPods](http://cocoapods.org/). Just add the following to your project Podfile:

>`pod 'CPAutoLayout'`

## Author

Sung Ahn Kim, ccoroom@gmail.com

## License

CPAutoLayout is available under the MIT license. See the LICENSE file for more info.

