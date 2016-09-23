//
//  UILabel+title.m
//  QIUBA
//
//  Created by weiwei on 15/10/8.
//  Copyright (c) 2015年 com.xinsaiji. All rights reserved.
//

#import "UILabel+title.h"
#import <CoreText/CoreText.h>

@implementation UILabel (title)

+(UILabel *)labelWithText: (NSString *)text font:(UIFont *) font
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    [label setText:text];
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGRect bubbleSize = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    label.frame = bubbleSize;
    
    return label;
}


@end
