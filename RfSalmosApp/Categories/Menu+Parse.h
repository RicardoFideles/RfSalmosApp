//
//  Menu+Parse.h
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 05/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "Menu.h"
#import <JSONKit.h>


@interface Menu (Parse)

- (id)initWithDictionary:(NSDictionary *)dic;
+ (NSArray *)configuracoes;

@end
