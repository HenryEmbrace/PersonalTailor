//
//  UIImage+ResizeImage.m
//  QIUBA
//
//  Created by weiwei on 15/9/18.
//  Copyright (c) 2015年 com.xinsaiji. All rights reserved.
//

#import "UIImage+ResizeImage.h"

@implementation UIImage (ResizeImage)


//返回一个可拉伸的图片
+ (UIImage *)resizeWithImageName:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    //    CGFloat w = normal.size.width * 0.5f ;
    //    CGFloat h = normal.size.height *0.5f ;
    
    CGFloat w = normal.size.width*0.5;
    CGFloat h = normal.size.height*0.5;
    //传入上下左右不需要拉升的编剧，只拉伸中间部分
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
    
    //    [normal resizableImageWithCapInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)]
    
    // 1 = width - leftCapWidth  - right
    // 1 = height - topCapHeight  - bottom
    
    //传入上下左右不需要拉升的编剧，只拉伸中间部分，并且传入模式（平铺/拉伸）
    //    [normal :<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>]
    
    //只用传入左边和顶部不需要拉伸的位置，系统会算出右边和底部不需要拉升的位置。并且中间有1X1的点用于拉伸或者平铺
    // 1 = width - leftCapWidth  - right
    // 1 = height - topCapHeight  - bottom
    //    return [normal stretchableImageWithLeftCapWidth:w topCapHeight:h];
}



@end
