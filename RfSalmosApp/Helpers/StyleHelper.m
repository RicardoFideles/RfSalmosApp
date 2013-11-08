//
//  StyleHelper.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 07/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "StyleHelper.h"

@implementation StyleHelper

+ (NSDictionary *) estiloTop {
    
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor: [UIColor grayColor]];
    [shadow setShadowOffset: CGSizeMake(0.0f, 0.0f)];
    
    NSDictionary *textTitleOptions = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor], NSForegroundColorAttributeName,
                                      shadow, NSShadowAttributeName,
                                      [UIFont fontWithName:@"HelveticaNeue-Bold" size:20], NSFontAttributeName, nil];
    
    return textTitleOptions;
    
}



@end
