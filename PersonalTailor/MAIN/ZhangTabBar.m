//
//  ZhangTabBar.m
//  PersonalTailor
//
//  Created by Embrace on 16/7/28.
//  Copyright © 2016年 http://navishealth.com. All rights reserved.
//

#import "ZhangTabBar.h"
#import "ZhangTabBarButton.h"

@interface ZhangTabBar ()
@property (nonatomic, weak) UIButton *selectedButton;

@property (nonatomic, strong) UILabel *tiLabel;
@end

@implementation ZhangTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName title:(NSString *)title
{
    NSLog(@"%@", title);
    //创建按钮
    ZhangTabBarButton *btn = [ZhangTabBarButton buttonWithType:UIButtonTypeCustom];
    
    //设置按钮的图片
    UIImage *imgN = [UIImage imageNamed:name];
    UIImage *imgH = [UIImage imageNamed:selName];
    
    UIImageView *norView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgN.size.width, imgN.size.height)];
    [norView setImage:imgN];
    [btn addSubview:norView];
    norView.tag = 20;
    
    UIImageView *selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgH.size.width, imgH.size.height)];
    [selectView setImage:imgH];
    [btn addSubview:selectView];
    selectView.tag = 30;
    selectView.hidden = YES;
    
    //监听按钮点击
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    //tabbar名称
    self.tiLabel = [[UILabel alloc] init];
    //    [label setBackgroundColor:[UIColor redColor]];
    self.tiLabel.textColor = [UIColor grayColor];
    [self.tiLabel setText:title];
    [self.tiLabel setFont:[UIFont systemFontOfSize:10]];
    self.tiLabel.numberOfLines = 1;
    
    //    [btn setBackgroundColor:[UIColor redColor]];
    //    [label setFrame:CGRectMake(0, imgN.size.height, labelSize.size.width, labelSize.size.height)];
    self.tiLabel.tag = 10;
    [btn addSubview:self.tiLabel];
    
    [self addSubview:btn];
}


// 按钮点击事件
- (void)btnClick:(UIButton *)button
{
    if (button.tag == _selectedButton.tag && _selectedButton!=nil) {
        return;
    }
    // 取消之前选择按钮
    _selectedButton.selected = NO;
    
    //title的颜色改变
    UILabel *title = (UILabel *)[_selectedButton viewWithTag:10];
    [title setTextColor:[UIColor grayColor]];
    
    // 选中当前按钮
    button.selected = YES;
    
    [button viewWithTag:20].hidden = YES;
    [button viewWithTag:30].hidden = NO;
    [_selectedButton viewWithTag:30].hidden = YES;
    [_selectedButton viewWithTag:20].hidden = NO;
    
    
    UILabel *selectLable = (UILabel *)[button viewWithTag:10];
    //    [selectLable setTextColor:[UIColor redColor]];
    [selectLable setTextColor:[UIColor colorWithRed:31/255.0 green:188/255.0 blue:210/255.0 alpha:1.0]];
    
    // 记录当前选中按钮
    _selectedButton = button;
    
    // 切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {
        [_delegate tabBar:self didSelectIndex:button.tag];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"++++%@",self.subviews);
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    NSLog(@"%f", btnH);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    // 设置按钮的尺寸
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        
        // 绑定角标
        btn.tag = i;
        
        btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        NSLog(@"%f", btn.center.x);
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
        
        CGSize btnSize = btn.frame.size;
        [[btn viewWithTag:20] setCenter:CGPointMake(btnSize.width*0.5, btnSize.height*0.5-8)];
        [[btn viewWithTag:30] setCenter:[btn viewWithTag:20].center];
        
        //设置标题
        UILabel *title = (UILabel *)[btn viewWithTag:10];
        NSLog(@"...%@", title);
        NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:10]};
        CGRect labelSize = [title.text  boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        title.frame = CGRectMake(0, 0, labelSize.size.width, labelSize.size.height);
        CGPoint point = CGPointMake(btnW*0.5, btnH*0.75);
        title.center = point;
        
    }
    
    
    NSLog(@"%@-",self.subviews);
}

-(void)setTitle:(NSString *)title
{
    if (title==nil) {
        return;
    }
    [self.tiLabel setText:title];
    CGPoint point = self.tiLabel.center;
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:10]};
    CGRect labelSize = [self.tiLabel.text  boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    self.tiLabel.frame = CGRectMake(0, 0, labelSize.size.width, labelSize.size.height);
    self.tiLabel.center = point;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
