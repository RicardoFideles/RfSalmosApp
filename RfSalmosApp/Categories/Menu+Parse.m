//
//  Menu+Parse.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 05/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "Menu+Parse.h"

@implementation Menu (Parse)

- (id)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    
    if (self) {
        self.label = [dic objectForKey:@"label"];
        self.storyboardId = [dic objectForKey:@"storyboardId"];
    }
    
    return self;
}

+ (NSArray *)configuracoes {
    
    NSMutableArray *allConfigs = [[NSMutableArray alloc] init];
    
    @try {
        NSDictionary *configs = [Menu readJson];
        
        for (NSDictionary *dic in configs) {
            Menu *config = [[Menu alloc] initWithDictionary:dic];
            [allConfigs addObject:config];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Problema no parse de editorias: %@", [exception description]);
    }
    @finally {
        return allConfigs;
    }
}

NSString *const FILENAME_JSON = @"configuracoes";

NSString *const EXTENSION = @"json";


+ (NSDictionary *)readJson {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:FILENAME_JSON
                                                     ofType:EXTENSION];
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    NSDictionary *configuracoes = [[content objectFromJSONString] objectForKey:@"configuracoes"];
    
    return configuracoes;
    
}

@end
