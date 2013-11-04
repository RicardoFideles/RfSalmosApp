//
//  DisplaySalmoViewController.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "DisplaySalmoViewController.h"

@interface DisplaySalmoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *versiculoDisplay;


@end

@implementation DisplaySalmoViewController

- (IBAction)share:(id)sender {
    NSLog(@"Cliquei em compartilhar");
    
    NSString *text = [NSString stringWithFormat:@"%@", self.versiculo];
    
    NSString *subject = [NSString stringWithFormat:NSLocalizedString(@"Salmos da Bíblia Sagrada", nil), self.versiculo];
    
    
    NSArray *activityItems = @[text];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [activityController setValue:subject forKey:@"subject"];
    
    [self presentViewController:activityController animated:YES completion:nil];
    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.versiculoDisplay.text = self.versiculo;
    
    [BannerHelper showWithViewController:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
