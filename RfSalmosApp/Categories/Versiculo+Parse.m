//
//  Versiculo+Parse.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "Versiculo+Parse.h"

@implementation Versiculo (Parse)


- (id)initWithDictionary:(NSDictionary *) dic
{
    self = [super init];
    
    if (self) {
        
        //  NSLog(@"%@", [dic description]);
        
        // NSLog(@"> %@",@"Algo deveria acontecer..") ;
        
        
        
        
        //for (NSDictionary *versiculos in dic) {
        
        
        self.texto = [dic objectForKey:@"texto"];
        self.numero = [dic objectForKey:@"versiculo"];
        
        
        
        
        
        
        // NSLog(@"> %@, %@",self.texto, self.numero) ;
    }
    
    
    
    return self;
}



@end
