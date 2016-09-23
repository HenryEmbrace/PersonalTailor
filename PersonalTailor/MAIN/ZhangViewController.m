//
//  ZhangViewController.m
//  PersonalTailor
//
//  Created by Embrace on 16/7/28.
//  Copyright © 2016年 http://navishealth.com. All rights reserved.
//

#import "ZhangViewController.h"
#import "UILabel+title.h"
@interface ZhangViewController ()

@end

@implementation ZhangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(UILabel *)setTitleText: (NSString *)title
{
    UILabel* titleLabel = [UILabel labelWithText:title font:[UIFont systemFontOfSize:18]];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    [titleLabel setText:title];
    CGRect labelRect = titleLabel.frame;
    titleLabel.tag = 10;
    labelRect.origin.x = self.view.frame.size.width-labelRect.size.width*0.5;
    labelRect.size.height = 44;
    titleLabel.frame = labelRect;
    self.navigationItem.titleView = titleLabel;
    
    return titleLabel;
}
-(UIView *)setLeft:(NSString *)lTitle right: (NSString *)rTitle title:(NSString *)title
{
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [navView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:navView];
    
    if (lTitle!=nil && lTitle.length>0) {
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backBtn setTitle:lTitle forState:UIControlStateNormal];
        [backBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [backBtn setBackgroundColor:[UIColor redColor]];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDragInside];
        [navView addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(navView.mas_left).offset(1);
            make.centerY.mas_equalTo(navView.mas_centerY).offset(10);
            make.size.mas_equalTo(CGSizeMake(40, 30));
        }];
        backBtn.tag = 10;
    }
    
    if (rTitle!=nil&&rTitle.length>0) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectZero];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitle:rTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        btn.tag = 20;
        //    [btn addTarget:self action:@selector(sureSendMoment) forControlEvents:UIControlEventTouchUpInside];
        
        [navView addSubview:btn];
    }
    
    
    if (title!=nil && title.length>0)
    {
        UILabel *titleLabel = [UILabel labelWithText:@"这个是标题的最大长度" font:[UIFont systemFontOfSize:18]];
        [titleLabel setFont:[UIFont systemFontOfSize:18]];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [titleLabel setText:title];
        titleLabel.center = CGPointMake(navView.bounds.size.width*0.5, navView.bounds.size.height*0.65);
        [navView addSubview:titleLabel];
    }
    
    return navView;
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
