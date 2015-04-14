UIColor+Extension
=========================

UIColor+Extension is drop in category for HexColor string Support for UIColor. Support for UIColor+Extension with prefixed # and without.

#Example
``` objective-c
// with hash
UIColor *colorWithHex = [UIColor colorWithHexString:@"#E65C5C" alpha:1];

// without hash
UIColor *secondColorWithHex = [UIColor colorWithHexString:@"E65C5C" alpha:1];

// short handling
UIColor *shortColorWithHex = [UIColor colorWithHexString:@"000" alpha:1];
```

``` objective-c
- (void)viewDidLoad {
    UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    [self.view addSubview:colorLabel];
    
    [self setColor:@"#ADADAD" withLabel:colorLabel];
}

- (void) setColor:(NSString *)colorString withLabel:(UILabel *)label
{
    UIColor *color = [UIColor colorWithHexString:colorString];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = color;
    label.text = [color hexValueStringFromColor];
}
```

* `#import "UIColor+Extension.h"` where you want to use easy as pie HexColors
* drag the source files in your project

##Requirements
UIColor+Extension requires [iOS 5.0](http://developer.apple.com/library/ios/#releasenotes/General/WhatsNewIniPhoneOS/Articles/iPhoneOS4.html) 

##Credits
UIColor+Extension was created by [Cartor Chen](https://github.com/Cartor) because of the pain recalculating Hex values string to RGB.

##Creator
[Cartor Chen](https://github.com/Cartor)

##License
UIColor+Extension is available underthe MIT license. See the LICENSE file for more info.
