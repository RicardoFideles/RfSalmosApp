//
//  Salmo.h
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Versiculo.h"

@interface Salmo : NSObject

@property (copy, nonatomic) NSString *capitulo;
@property (strong, nonatomic) NSMutableArray *versiculos;

@end
