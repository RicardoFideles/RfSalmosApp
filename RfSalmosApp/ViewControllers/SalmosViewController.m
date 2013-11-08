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
@property (weak, nonatomic) IBOutlet UILabel *displaySalmoRandomico;
@property (copy, nonatomic) Salmo *salmoRandomico;
@property (copy, nonatomic) Versiculo *versiculoRandomico;

@end

@implementation SalmosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.salmos = [SalmosHelper readSalmos];
    
 
    
    [BannerHelper showWithViewController:self];
    
    _salmoRandomico =  [self pickRandomSalmo];
    
    _versiculoRandomico = _salmoRandomico.
    pickRandomVersiculo;
    
    _displaySalmoRandomico.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
    
    //NSForegroundColorAttributeName
    
    _displaySalmoRandomico.textColor = [UIColor whiteColor];
    
    
    _displaySalmoRandomico.numberOfLines = 10;
                                        
    _displaySalmoRandomico.text = _versiculoRandomico.texto;
    
    
    // Criar uma visualização do tamanho padrão na parte inferior da tela.
    
    
    NSLog(@"Salmos %d",[self.salmos count]);
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configureNavBar];

    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
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



- (IBAction)openMenu:(id)sender {
    if (self.navigationController.revealController.focusedController == self.navigationController.revealController.leftViewController) {
        [self.navigationController.revealController showViewController:self.navigationController.revealController.frontViewController];
    } else {
        [self.navigationController.revealController showViewController:self.navigationController.revealController.leftViewController];
    }
}

- (IBAction)share:(id)sender {
    NSLog(@"Cliquei em compartilhar");
    
    NSString *text = [NSString stringWithFormat:@"%@", _displaySalmoRandomico.text];
    
    NSString *subject = [NSString stringWithFormat:NSLocalizedString(@"Salmos da Bíblia Sagrada", nil), _versiculoRandomico.texto];
    
    
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

-(void)configureNavBar {
    
    
    self.navigationController.navigationBar.titleTextAttributes =     [StyleHelper estiloTop];
;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#4bc1d2" alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = [@"Salmos" uppercaseString];

    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#787878" alpha:1.0f];
}

/*
 
 - (void)viewDidUnload {
 [bannerView_ release];
 }
 
 - (void)dealloc {
 [super dealloc];
 }
 
 */
@end
