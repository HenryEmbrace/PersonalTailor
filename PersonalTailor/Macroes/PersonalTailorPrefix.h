//
//  PersonalTailorPrefix.h
//  PersonalTailor
//
//  Created by Embrace on 16/7/28.
//  Copyright © 2016年 http://navishealth.com. All rights reserved.
//

#ifndef PersonalTailorPrefix_h
#define PersonalTailorPrefix_h


#define App_Delegate ((AppDelegate*)[[UIApplication sharedApplication] delegate])

#define kDevice_Model           @"iPhone"
#define kWidth_Screen       [UIScreen mainScreen].bounds.size.width
#define kHeight_Screen      [UIScreen mainScreen].bounds.size.height

#define HEIGHT_IPHONE_5 568
#define HEIGHT_IPHONE_4 480
#define HEIGHT_IPHONE_6 667
#define HEIGHT_IPHONE_6P 736

#define IS_IPHONE_5 ([[UIScreen mainScreen ] bounds ].size.height == HEIGHT_IPHONE_5)
#define IS_IPHONE_6 ([[UIScreen mainScreen ] bounds ].size.height == HEIGHT_IPHONE_6)
#define IS_IPHONE_6P ([[UIScreen mainScreen ] bounds ].size.height == HEIGHT_IPHONE_6P)
#define IS_IPHONE_4 ([[UIScreen mainScreen ] bounds ].size.height == HEIGHT_IPHONE_4)

#define kBGColor [UIColor colorWithRed:255/255.0 green:250/255.0 blue:244/255.0 alpha:1.0]

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


//#import "Utilities.h"
//#import "MBProgressHUD.h"

#import "AppDelegate.h"
//#import "AFNetworking.h"
#import "View+MASAdditions.h"

#import "UIImage+ResizeImage.h"


#endif


#endif /* PersonalTailorPrefix_h */
