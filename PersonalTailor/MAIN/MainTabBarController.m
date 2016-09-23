//
//  MainTabBarController.m
//  PersonalTailor
//
//  Created by Embrace on 16/7/28.
//  Copyright © 2016年 http://navishealth.com. All rights reserved.
//

#import "MainTabBarController.h"
#import "ZhangTabBar.h"
@interface MainTabBarController ()<ZhangTabBarDelegate, UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 3.加载5个Storyboard
    UIStoryboard *FirstTab = [UIStoryboard storyboardWithName:@"FirstStoryboard" bundle:nil];
    UIStoryboard *SecondTab = [UIStoryboard storyboardWithName:@"SecondStoryboard" bundle:nil];
    UIStoryboard *ThirdTab = [UIStoryboard storyboardWithName:@"ThirdStoryboard" bundle:nil];
    UIStoryboard *FouthTab = [UIStoryboard storyboardWithName:@"FourthStoryboard" bundle:nil];
    UIStoryboard *FifthTab = [UIStoryboard storyboardWithName:@"FifthStoryboard" bundle:nil];
    
    // 4.创建并将5个Storyboard添加到TabBarCongtroller中
    self.viewControllers = @[FirstTab.instantiateInitialViewController,
                             SecondTab.instantiateInitialViewController,
                             ThirdTab.instantiateInitialViewController,
                             FouthTab.instantiateInitialViewController,
                             FifthTab.instantiateInitialViewController
                             ];
    //创建tabBar
    ZhangTabBar *tabBar = [[ZhangTabBar alloc] init];
    
    tabBar.delegate = self;
    
    tabBar.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:tabBar];
    
    tabBar.tag = 10;
    
    NSArray *titleArr = @[@"LifeBeat", @"My Health", @"Programs", @"Updates", @"More"];
    
    NSString *imageName = nil;
    NSString *selImageName = nil;
    for (int i = 0; i < self.viewControllers.count; i++)
    {
        imageName = [NSString stringWithFormat:@"tabbar_%d", i+1];
        selImageName = [NSString stringWithFormat:@"tabbar_%d_Sel", i+1];
        
        //添加底部按钮
        [tabBar addTabBarButtonWithName:imageName selName:selImageName title:titleArr[i]];
    }
    
    
    // 获取应用程序中所有的导航条
    // 获取所有导航条外观
    UINavigationBar *bar = [UINavigationBar appearance];
    
    [bar setTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //    [bar setBackgroundColor:[UIColor redColor]];
    [bar setBarTintColor:[UIColor colorWithRed:31/255.0 green:188/255.0 blue:210/255.0 alpha:1.0]];
}

//代理方法
-(void)tabBar:(ZhangTabBar *)tabBar didSelectIndex:(NSUInteger)index
{
    self.selectedIndex = index;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
