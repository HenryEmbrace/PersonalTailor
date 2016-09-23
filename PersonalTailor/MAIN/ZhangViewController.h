//
//  ZhangViewController.h
//  PersonalTailor
//
//  Created by Embrace on 16/7/28.
//  Copyright © 2016年 http://navishealth.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhangViewController : UIViewController
-(UILabel *)setTitleText: (NSString *)title;

/**
 *  present时  左按钮标题   右按钮标题  标题栏标题
 */
-(UIView *)setLeft:(NSString *)lTitle right: (NSString *)rTitle title:(NSString *)title;
@end
