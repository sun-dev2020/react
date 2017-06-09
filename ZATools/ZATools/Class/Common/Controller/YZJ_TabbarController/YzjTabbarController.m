//
//  IvyTabbarController.m
//  Ivy
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 treebear. All rights reserved.
//

#import "YzjTabbarController.h"
#import "IvyButton.h"
#import "IvyLabel.h"
#import "UIColor+BK.h"
#import <UMMobClick/MobClick.h>
#import "LoginController.h"
#import "BaseController.h"
#import "YzjNavigationController.h"


#import "HomeController.h"
#import "UserController.h"

@interface YzjTabbarController () {
    HomeController* homeCtr; //首页
    UIViewController* serviceCtr; //服务
    UIViewController* wikiCtr; //百科

    UserController* userCtr; //我的
    

    
    NSMutableArray* allLab;
    NSMutableArray* allImage;
    
    NSMutableArray* allUnreadIcon;
    UIView* tabbarView;
}
@end

@implementation YzjTabbarController

- (instancetype)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self loadTabbarControllers];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
}

#pragma mark - private method
/**
 *  添加tabbar子视图控制器
 */
- (void)loadTabbarControllers
{
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : kLightGrayColor, NSFontAttributeName : [UIFont systemFontOfSize:13.f]} forState:UIControlStateNormal];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    
    UINavigationController* storeNC;
    if (homeCtr == nil) {
        homeCtr = [[HomeController alloc] init];
        storeNC = [[UINavigationController alloc] initWithRootViewController:homeCtr];
        UIImage *nomal = GetImage(@"home_nor");
        nomal = [nomal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        storeNC.tabBarItem.image = nomal;
        storeNC.tabBarItem.title = @"首页";
//        homeCtr.title = @"首页";
        UIImage *selected = GetImage(@"home_sel");
        selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        storeNC.tabBarItem.selectedImage = selected;
        
    }
    else {
        storeNC = [self.viewControllers objectAtIndex:0];
    }
    UINavigationController* userNC;
    if (userCtr == nil) {
        userCtr = [[UserController alloc] init];
        userNC = [[UINavigationController alloc] initWithRootViewController:userCtr];
        UIImage *nomal = GetImage(@"me_nor");
        nomal = [nomal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        userNC.tabBarItem.image = nomal;
        userNC.tabBarItem.title = @"我的";
        userCtr.title = @"我的";
        UIImage *selected = GetImage(@"me_sel");
        selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        userNC.tabBarItem.selectedImage = selected;
    }
    else {
        userNC = [self.viewControllers objectAtIndex:1];
    }
    self.viewControllers = @[storeNC ,userNC];
    
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    self.navigationItem.title = item.title;
}



@end