//
//  TabBarController.m
//  sk-ios
//
//  Created by 史凯 on R 2/04/13.
//  Copyright © Reiwa 2 shikai. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "MainViewController.h"
#import "LinkViewController.h"
#import "FindViewController.h"
#import "UserViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    [self setChildUIViewController:mainVC title:@"微信" imageName:@"main.png"];
    
    LinkViewController *linkVC = [[LinkViewController alloc] init];
    [self setChildUIViewController:linkVC title:@"通讯录" imageName:@"link.png"];
    FindViewController *findVC = [[FindViewController alloc] init];
    [self setChildUIViewController:findVC title:@"发现" imageName:@"find.png"];
    UserViewController *userVC = [[UserViewController alloc] init];
    [self setChildUIViewController:userVC title:@"我" imageName:@"user.png"];
    
    
}
-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
   
        CGRect frame = self.tabBar.frame;
        frame.size.height = 49 +15;
        frame.origin.y = self.view.frame.size.height - frame.size.height;
        self.tabBar.frame = frame;
        self.tabBar.backgroundColor = UIColor.blackColor;
        self.tabBar.barStyle = UIBarStyleBlack;
    
}

-(void)setChildUIViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.image = image;
    viewController.title = title;
    [self addChildViewController:viewController];
    NavigationController *navigationController = [[NavigationController alloc]initWithRootViewController:viewController];
    navigationController.navigationItem.title = title;
    [self addChildViewController:navigationController];
    
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
