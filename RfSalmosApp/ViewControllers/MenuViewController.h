//
//  MenuViewController.h
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property (nonatomic, copy) NSArray *configurations;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
