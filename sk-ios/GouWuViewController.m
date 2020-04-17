//
//  GouWuViewController.m
//  sk-ios
//
//  Created by 史凯 on R 2/04/16.
//  Copyright © Reiwa 2 shikai. All rights reserved.
//

#import "GouWuViewController.h"
#import <WebKit/WebKit.h>
#define SCREEN_WIDTH         ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT        ([[UIScreen mainScreen] bounds].size.height)
@interface GouWuViewController ()
@end

@implementation GouWuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self appearClick];
}
- (void)appearClick {
    //--UIWindow的优先级最高，Window包含了所有视图，在这之上添加视图，可以保证添加在最上面
    UIWindow *appWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    // ------底部弹出的View
    self.view.frame           = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20);
    self.view.backgroundColor = [UIColor whiteColor];
    [appWindow addSubview:self.view];
    // ------View出现动画
    self.view.transform = CGAffineTransformMakeTranslation(0.01, SCREEN_HEIGHT-20);
    [UIView animateWithDuration:0.5 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0.01, 0.01);
    }];
    
}

/**
 * 功能： View退出
 */
- (void)exitClick {

    NSLog(@"====");
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.transform = CGAffineTransformMakeTranslation(0.01, SCREEN_HEIGHT);
        self.view.alpha = 0.2;
    } completion:^(BOOL finished) {
       
        [self.view removeFromSuperview];
    }];

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
