//
//  SalmosHelper.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 08/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "SalmosHelper.h"

@implementation SalmosHelper

NSString *const FILENAME = @"salmos";

NSString *const EXTENSION_OF_FILENAME = @"json";


+ (NSArray *)readSalmos {
    
    NSMutableArray *salmos = [[NSMutableArray alloc]init];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:FILENAME
                                                     ofType:EXTENSION_OF_FILENAME];
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    
    for (NSDictionary *salmo in [content objectFromJSONString]) {
        
        [salmos addObject:[[Salmo alloc] initWithDictionary:[salmo objectForKey:@"Salmo"]]];
        
    }
    
    return salmos;
}

@end
