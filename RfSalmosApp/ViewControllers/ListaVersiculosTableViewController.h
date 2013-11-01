//
//  ListaVersiculosTableViewController.h
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Versiculo+Parse.h"


@interface ListaVersiculosTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *versiculos;
@property (nonatomic, strong) NSString *salmo;

@end
