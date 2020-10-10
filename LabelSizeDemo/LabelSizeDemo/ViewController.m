//
//  ViewController.m
//  LabelSizeDemo
//
//  Created by OFweek01 on 2020/10/10.
//  Copyright © 2020 OFweek01. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Size.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self _test2];
}

- (void)_test1 {
    CGFloat width = UIScreen.mainScreen.bounds.size.width;
    NSString *text = @"123\n456\n789";
    UIFont *font = [UIFont systemFontOfSize:15];
    CGFloat height = [text sizeLineWithFont:font textSizeWidht:width];
    CGSize size = [text sizeWithFont:font textSizeWidht:width textSizeHeight:CGFLOAT_MAX];
    NSLog(@"%f", height);
    NSLog(@"%f", ceil(size.height));
}

- (void)_test2 {
    CGFloat width = UIScreen.mainScreen.bounds.size.width;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithString: @"123\n456\n789"];
    [text addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15.0] range:NSMakeRange(0, text.length)];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    //paraStyle.alignment = NSTextAlignmentLeft;
    //paraStyle.lineSpacing = 15;
    paraStyle.firstLineHeadIndent = 60;
    [text addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, text.length)];
    CGFloat height = [text sizeLineAttributedTextSizeWidht:width];
    CGSize size = [text sizeWithAttributedTextSizeWidht:width textSizeHeight:CGFLOAT_MAX];
    NSLog(@"%f", height);
    NSLog(@"%f", ceil(size.height));
}


@end
