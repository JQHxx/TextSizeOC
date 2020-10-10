//
//  NSString+Size.m
//  LabelSizeDemo
//
//  Created by OFweek01 on 2020/10/10.
//  Copyright © 2020 OFweek01. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

/**
 计算文字大小(size)
 
 @param font 字体
 @param width 文字宽度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字宽度
 @param height 文字高度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字高度
 @return 返回文字的size
 */
- (CGSize)sizeWithFont:(UIFont *)font textSizeWidht:(CGFloat)width textSizeHeight:(CGFloat)height {
    if (width == MAXFLOAT || width == CGFLOAT_MAX || width == 0) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
        return CGSizeMake(rect.size.width, height);
    } else if (height == MAXFLOAT || height == CGFLOAT_MAX || height == 0) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
        return CGSizeMake(width, rect.size.height);
    }
    return CGSizeMake(0, 0);
}

/**
 计算文字高度，允许换行计算
 
 @param font 字体
 @param width 文字宽度
 @return 返回文字的高度
 */
- (CGFloat)sizeLineWithFont:(UIFont *)font textSizeWidht:(CGFloat)width {
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    CGFloat padding = textView.textContainer.lineFragmentPadding;
    textView.textContainerInset = UIEdgeInsetsMake(0, -padding, 0, -padding);
    textView.text = self;
    textView.font = font;
    CGSize size = CGSizeMake(width, MAXFLOAT);
    CGSize constraint = [textView sizeThatFits:size];
    return constraint.height;
}

@end

@implementation NSAttributedString (Size)

/**
 计算文字大小(size)
 
 @param width 文字宽度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字宽度
 @param height 文字高度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字高度
 @return 返回文字的size
 */
- (CGSize)sizeWithAttributedTextSizeWidht:(CGFloat)width textSizeHeight:(CGFloat)height {
    
    if (width == MAXFLOAT || width == CGFLOAT_MAX || width == 0) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil];
        return CGSizeMake(rect.size.width, height);
    } else if (height == MAXFLOAT || height == CGFLOAT_MAX || height == 0) {
        CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil];
        return CGSizeMake(width, rect.size.height);
    }
    return CGSizeMake(0, 0);
}

/**
 计算文字高度，允许换行计算
 
 @param width 文字宽度
 @return 返回文字的高度
 */
- (CGFloat)sizeLineAttributedTextSizeWidht:(CGFloat)width {
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    CGFloat padding = textView.textContainer.lineFragmentPadding;
    textView.textContainerInset = UIEdgeInsetsMake(0, -padding, 0, -padding);
    textView.attributedText = self;
    CGSize size = CGSizeMake(width, MAXFLOAT);
    CGSize constraint = [textView sizeThatFits:size];
    return constraint.height;
}

@end


