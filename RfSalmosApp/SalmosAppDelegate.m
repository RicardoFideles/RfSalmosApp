//
//  SalmosAppDelegate.m
//  app
//
//  Created by Ricardo jorge Fideles junior on 03/10/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "SalmosAppDelegate.h"
#import "MenuViewController.h"
#import "SalmosViewController.h"

@implementation SalmosAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self buildMenu];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void)buildMenu {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    SalmosViewController *salmosViewController = [storyboard instantiateViewControllerWithIdentifier:@"SalmosViewController"];
    
    MenuViewController *menuViewController = [storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    
    // menuViewController.salmosViewController = salmosViewController;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:salmosViewController];
    
    NSDictionary *options = @{
                              PKRevealControllerRecognizesPanningOnFrontViewKey : @YES,
                              PKRevealControllerDisablesFrontViewInteractionKey : @NO
                              };
    
    
    self.revealController = [SubviewPKRevealViewController revealControllerWithFrontViewController:navigationController leftViewController:menuViewController options:options];
    self.window.tintColor = [UIColor blackColor];
    self.window.rootViewController = self.revealController;
    
    [[self window] makeKeyAndVisible];
}


@end
