//
//  AppDelegate.m
//  3dTouch
//
//  Created by SIMPLE PLAN on 15/11/4.
//  Copyright © 2015年 SIMPLE PLAN. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = mainNav;
    
    UIApplicationShortcutIcon *icon1=[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd];
    
    //两种item创建方式
    UIApplicationShortcutItem * shortItem1 = [[UIApplicationShortcutItem alloc]initWithType:@"3dtouch" localizedTitle:@"测试1" localizedSubtitle:@"这是第一个测试" icon:icon1 userInfo:nil];
    UIApplicationShortcutItem * shortItem2 = [[UIApplicationShortcutItem alloc]initWithType:@"3dTouch测试2" localizedTitle:@"测试2"];
    
    NSArray *shortItems = [[NSArray alloc] initWithObjects:shortItem1, shortItem2, nil];
    [[UIApplication sharedApplication] setShortcutItems:shortItems];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -3DTouch代理
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if ([shortcutItem.localizedTitle isEqualToString:@"测试1"]) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"测试1" message:@"我只是测试" delegate:nil cancelButtonTitle:@"我知道是测试" otherButtonTitles:@"好", nil];
        
        [alert show];
        
    }else
    {
        UIViewController *vc = [self currentViewController];
        
        FirstViewController *firstVC = [[FirstViewController alloc]init];
        [vc.navigationController pushViewController:firstVC animated:YES];
        
    }
}

#pragma mark -获取当前页面VC
-(UIViewController *)findBestViewController:(UIViewController *)vc {
    
    if (vc.presentedViewController) {
        
        //获取到present
        return [self findBestViewController:vc.presentedViewController];
        
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        
        //获取到split
        UISplitViewController *svc = (UISplitViewController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.viewControllers.lastObject];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        
        //获取到navigation
        UINavigationController *svc = (UINavigationController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.topViewController];
        else
            return vc;
        
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        
        //获取到tabBar
        UITabBarController *svc = (UITabBarController *) vc;
        if (svc.viewControllers.count > 0)
            return [self findBestViewController:svc.selectedViewController];
        else
            return vc;
        
    } else {
        
        //获取到不知类型的controller，并得到最后一个子controller
        return vc;
        
    }
    
}
#pragma mark -获取当前页面VC
-(UIViewController *)currentViewController {
    
    // Find best view controller
    UIViewController* viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    return [self findBestViewController:viewController];
    
}




@end
