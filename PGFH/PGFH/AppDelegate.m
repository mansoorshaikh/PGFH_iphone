//
//  AppDelegate.m
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize loginviewController,navController,currentlocation,deviceToken,pushStr;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch..
    if (launchOptions != nil) {
        // Launched from push notification
        NSDictionary *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        
        MainViewController *mainController = [[MainViewController alloc]initWithNibName:NSStringFromClass([MainViewController class]) bundle:nil];
        pushStr=[[NSString alloc]init];
        pushStr=@"yes";

        [self.window.rootViewController presentModalViewController:mainController animated:NO];
    }
    else
    {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
        
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {

        loginviewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        }else{
            loginviewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController~ipad" bundle:nil];

        }
        
    self.navController = [[UINavigationController alloc] initWithRootViewController:loginviewController];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    }
    // Override point for customization after application launch.
    return YES;
}
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    NSString *deviceTokenString=[[[[NSString stringWithFormat:@"%@",deviceToken] stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    self.deviceToken=deviceTokenString;
    
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //pusd notification click than open userlist code
    
    MainViewController *mainController = [[MainViewController alloc]initWithNibName:NSStringFromClass([MainViewController class]) bundle:nil];
    pushStr=[[NSString alloc]init];
    pushStr=@"yes";

    [self.window.rootViewController presentModalViewController:mainController animated:NO];
    if ( application.applicationState == UIApplicationStateActive ){
    }
    // app was already in the foregroundd
    else{
        
    }
       // [[NSNotificationCenter defaultCenter] postNotificationName:@"IHaveReceivedANotification" object:nil userInfo:userInfo];
    // app was just brought from background to foreground
    
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    application.applicationSupportsShakeToEdit = YES;
    
    //[_window addSubview:navController.view];
    [_window makeKeyAndVisible];
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

@end
