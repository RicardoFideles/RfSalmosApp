//
//  UINavigationController+Orientation.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 14/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "UINavigationController+Orientation.h"

@implementation UINavigationController (Orientation)

-(BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
