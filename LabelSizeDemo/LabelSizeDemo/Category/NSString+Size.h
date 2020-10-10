//
//  NSString+Size.h
//  LabelSizeDemo
//
//  Created by OFweek01 on 2020/10/10.
//  Copyright © 2020 OFweek01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Size)

/**
 计算文字大小(size)

 @param font 字体
 @param width 文字宽度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字宽度
 @param height 文字高度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字高度
 @return 返回文字的size
 */
- (CGSize)sizeWithFont:(UIFont *)font textSizeWidht:(CGFloat)width textSizeHeight:(CGFloat)height;

/**
 计算文字高度，允许换行计算

 @param font 字体
 @param width 文字宽度
 @return 返回文字的高度
 */
- (CGFloat)sizeLineWithFont:(UIFont *)font textSizeWidht:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (Size)

/**
 计算文字大小(size)

 @param width 文字宽度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字宽度
 @param height 文字高度，如果为‘0’或者‘MAXFLOAT’或者‘CGFLOAT_MAX’，该方法为计算文字高度
 @return 返回文字的size
 */
- (CGSize)sizeWithAttributedTextSizeWidht:(CGFloat)width textSizeHeight:(CGFloat)height;

/**
 计算文字高度，允许换行计算

 @param width 文字宽度
 @return 返回文字的高度
 */
- (CGFloat)sizeLineAttributedTextSizeWidht:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
