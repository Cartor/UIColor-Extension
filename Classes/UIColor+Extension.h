//
//  UIColor+Extension.h
//  UIColor+Extension
//
//  Created by Cartor Chen on 2015/4/14.
//  Copyright (c) 2015 Cartor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)colorWithRGBHex: (uint32_t)rgbValue;
+ (UIColor *)colorWithRGBHex: (uint32_t)rgbValue alpha:(CGFloat)alpha;

+ (UIColor *)colorWith8BitRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)colorWith8BitRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

- (NSString *)hexValueStringFromColor;
- (uint32_t)hexValueIntegerFromColor;

@end
