//
//  MenuViewController.h
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <sys/utsname.h>
#import "TermsOfUseViewController.h"
#import "Menu+Parse.h"
#import "menuCell.h"
#import "HexColor.h"
@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, copy) NSArray *configurations;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
