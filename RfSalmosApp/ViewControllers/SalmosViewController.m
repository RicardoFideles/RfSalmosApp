//
//  SalmosViewController.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 31/10/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "SalmosViewController.h"
#import <JSONKit.h>
#import "ListaSalmosTableViewController.h"

@interface SalmosViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelSalmo;
@property (copy, nonatomic) Salmo *salmo;
@property (copy, nonatomic) Versiculo *versiculo;

@end

@implementation SalmosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.salmos = [SalmosHelper readSalmos];
    
    [self configureLabelSalmo];
    
    [BannerHelper showWithViewController:self];

    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configureNavBar];
    [self configureBackground];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"listaSalmos"]) {
        if ([segue.destinationViewController isKindOfClass:[ListaSalmosTableViewController class]]) {
            ListaSalmosTableViewController *ltvc = (ListaSalmosTableViewController *)segue.destinationViewController;
            ltvc.listaSalmos = self.salmos;
            ltvc.title = @"Salmos";
            
        }
    }
}


- (Salmo *) salmo
{
    _salmo = [self pickRandomSalmo];
    return _salmo;
}

- (Versiculo *) versiculo
{
    _versiculo = self.salmo.pickRandomVersiculo;
    return _versiculo;
}



- (IBAction)openMenu:(id)sender {
    if (self.navigationController.revealController.focusedController == self.navigationController.revealController.leftViewController) {
        [self.navigationController.revealController showViewController:self.navigationController.revealController.frontViewController];
    } else {
        [self.navigationController.revealController showViewController:self.navigationController.revealController.leftViewController];
    }
}

- (IBAction)share:(id)sender {
    
    NSString *text = [NSString stringWithFormat:@"%@", self.versiculo.texto];
    
    NSString *subject = [NSString stringWithFormat:NSLocalizedString(@"Salmos da Bíblia Sagrada", nil), self.versiculo.texto];
    
    
    NSArray *activityItems = @[text];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [activityController setValue:subject forKey:@"subject"];
    
    [self presentViewController:activityController animated:YES completion:nil];
    
    
}

- (Salmo *)pickRandomSalmo {
    
    Salmo *randomSalmo = nil;
    if (self.salmos.count) {
        unsigned index = arc4random() % self.salmos.count;
        randomSalmo = self.salmos[index];
    }
    return randomSalmo;
}

- (void)configureNavBar {
    
    
    self.navigationController.navigationBar.titleTextAttributes =   [StyleHelper estiloTop];

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationController.navigationBar.barTintColor = K_COLOR_MENU_BLUE;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = [@"Salmos Diários" uppercaseString];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

}

- (void) configureBackground {
    
    self.view.backgroundColor = K_COLOR_VIEW_HOME;

}

- (void) configureLabelSalmo {
    
    _labelSalmo.attributedText = [[NSAttributedString alloc]
                                    initWithString:self.versiculo.texto
                                        attributes:[StyleHelper estiloTop]];
    
}



@end
