//
//  ZhangTabBar.h
//  PersonalTailor
//
//  Created by Embrace on 16/7/28.
//  Copyright © 2016年 http://navishealth.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZhangTabBar;
@protocol ZhangTabBarDelegate <NSObject>

@optional
-(void)tabBar:(ZhangTabBar *)tabBar didSelectIndex:(NSUInteger) index;

@end
@interface ZhangTabBar : UIView
@property (nonatomic, weak) id <ZhangTabBarDelegate> delegate;

/**
 *  creat tabbar Button
 *
 *  @param name    正常状态的图片名称
 *  @param selName 选中状态的图片名称
 */
-(void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName title:(NSString *)title;

/**
 *  setting tabbar name
 *
 */
-(void)setTitle:(NSString *)title;

- (void)btnClick:(UIButton *)button;

@end
