//
//  Salmo.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "Salmo.h"
#import "Versiculo+Parse.h"

@implementation Salmo


- (id)initWithDictionary:(NSDictionary *) dic
{
    self = [super init];
    
    if (self) {
        
        self.capitulo = [dic objectForKey:@"capitulo"];
        
        //A lista de versiculos nao está rolando.. :(
        
        self.versiculos = [[NSMutableArray alloc] init];
        
        
        NSArray *tempVers = [dic objectForKey:@"Versiculo"];
        
        
        for (NSDictionary *versiculo in tempVers) {
            
            // NSLog(@">>, %@", versiculo);
            
            [self.versiculos addObject:[[Versiculo alloc] initWithDictionary:versiculo]];
        }
        
        
    }
    
    return self;
}




@end
