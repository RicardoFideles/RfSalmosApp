//
//  SalmosAppDelegate.h
//  app
//
//  Created by Ricardo jorge Fideles junior on 03/10/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubviewPKRevealViewController.h"

@interface SalmosAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) SubviewPKRevealViewController *revealController;
@property (strong, nonatomic) UIWindow *window;

@end
