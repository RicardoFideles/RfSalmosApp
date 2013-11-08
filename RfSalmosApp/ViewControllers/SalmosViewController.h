//
//  SalmosViewController.h
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 31/10/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONKit.h>
#import "Salmo+Parse.h"
#import "PKRevealController.h"
#import "BannerHelper.h"
#import "HexColor.h"
#import "StyleHelper.h"

@interface SalmosViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *salmos;


- (IBAction)openMenu:(id)sender;

- (Salmo *)pickRandomSalmo;


@end
