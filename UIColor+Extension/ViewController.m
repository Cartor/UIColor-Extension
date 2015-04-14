//
//  ViewController.m
//  UIColor+Extension
//
//  Created by Cartor Chen on 2015/4/14.
//  Copyright (c) 2015 Cartor. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setColor:@"#E65C5C" withLabel:self.color1];
    
    [self setColor:@"#1975D1" withLabel:self.color2];
    
    [self setColor:@"#66C266" withLabel:self.color3];
    
    [self setColor:@"#6600CC" withLabel:self.color4];
    
    [self setColor:@"#D6AD33" withLabel:self.color5];
    
    [self setColor:@"#ADADAD" withLabel:self.color6];
}

- (void) setColor:(NSString *)_colorString withLabel:(UILabel *)_label
{
    UIColor *color = [UIColor colorWithHexString:_colorString];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = color;
    _label.text = [color hexValueStringFromColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
