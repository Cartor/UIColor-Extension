//
//  UIColor+Extension.m
//  UIColor+Extension
//
//  Created by Cartor Chen on 2015/4/14.
//  Copyright (c) 2015 Cartor. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (UIColor_Extension)

#pragma mark - Hex String to UIColor

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    return [[self class] colorWithHexString:hexString alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha
{
    if (hexString.length == 0) {
        return nil;
    }
    
    // Check for hash and add the missing hash
    if('#' != [hexString characterAtIndex:0])
    {
        hexString = [NSString stringWithFormat:@"#%@", hexString];
    }
    
    // check for string length
    assert(7 == hexString.length || 4 == hexString.length);
    
    // check for 3 character HexStrings
    hexString = [[self class] hexStringTransformFromThreeCharacters:hexString];
    
    uint32_t hexValue = [[self class] hexValueToUnsigned:hexString];
    
    return [[self class] colorWithRGBHex:hexValue alpha:alpha];
}

#pragma mark - Hex Int to UIColor

+ (UIColor *)colorWithRGBHex: (uint32_t)rgbValue
{
    return [[self class] colorWithRGBHex:rgbValue alpha:1.0f];
}

+ (UIColor *)colorWithRGBHex: (uint32_t)rgbValue alpha:(CGFloat)alpha
{
    return [[self class] colorWith8BitRed:(float)((rgbValue & 0xFF0000) >> 16) green:(float)((rgbValue & 0xFF00) >> 8) blue:(float)(rgbValue & 0xFF) alpha:alpha];
}

#pragma mark - 8 Bit RGBA to UIColor

+ (UIColor *)colorWith8BitRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [[self class] colorWith8BitRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor *)colorWith8BitRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    UIColor *color = nil;
    CGFloat r = red/255.0f;
    CGFloat g = green/255.0f;
    CGFloat b = blue/255.0f;
    
    color = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    
    return color;
}

#pragma mark - extra function

+ (NSString *)hexStringTransformFromThreeCharacters:(NSString *)hexString
{
    if(hexString.length == 4)
    {
        hexString = [NSString stringWithFormat:@"#%@%@%@%@%@%@",
                     [hexString substringWithRange:NSMakeRange(1, 1)],[hexString substringWithRange:NSMakeRange(1, 1)],
                     [hexString substringWithRange:NSMakeRange(2, 1)],[hexString substringWithRange:NSMakeRange(2, 1)],
                     [hexString substringWithRange:NSMakeRange(3, 1)],[hexString substringWithRange:NSMakeRange(3, 1)]];
    }
    
    return hexString;
}

+ (unsigned)hexValueToUnsigned:(NSString *)hexValue
{
    if ([hexValue hasPrefix:@"#"])
        hexValue = [hexValue substringFromIndex:1];
    
    unsigned value = 0;
    
    NSScanner *hexValueScanner = [NSScanner scannerWithString:hexValue];
    [hexValueScanner scanHexInt:&value];
    
    return value;
}

#pragma mark - UIColor to Hex String or Hex Int

- (NSString *)hexValueStringFromColor
{
    if (self == [UIColor whiteColor]) {
        // Special case, as white doesn't fall into the RGB color space
        return [@"#ffffff" uppercaseString];
    }
    
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    int redDec = (int)(red * 255.0f);
    int greenDec = (int)(green * 255.0f);
    int blueDec = (int)(blue * 255.0f);
    
    NSString *returnString = [NSString stringWithFormat:@"#%02x%02x%02x", (unsigned int)redDec, (unsigned int)greenDec, (unsigned int)blueDec];
    
    return [returnString uppercaseString];
}

- (uint32_t)hexValueIntegerFromColor
{
    return [[self class] hexValueToUnsigned:[self hexValueStringFromColor]];
}

@end
