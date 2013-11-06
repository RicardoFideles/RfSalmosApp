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
    
    self.salmos = [[NSMutableArray alloc] init];
    
    NSArray *temp = [self readVersiculos];
    
    for (NSDictionary *salmo in temp) {
        
        [self.salmos addObject:[[Salmo alloc] initWithDictionary:[salmo objectForKey:@"Salmo"]]];
        
    }
    
    [BannerHelper showWithViewController:self];
    
    _salmoRandomico =  [self pickRandomSalmo];
    
    _versiculoRandomico = _salmoRandomico.
    pickRandomVersiculo;
    
    
    _displaySalmoRandomico.text = _versiculoRandomico.texto;
    
    
    // Criar uma visualização do tamanho padrão na parte inferior da tela.
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


NSString *const FILENAME = @"salmos";

NSString *const EXTENSION_OF_FILENAME = @"json";


- (NSArray *)readVersiculos {
    
    NSString* path = [[NSBundle mainBundle] pathForResource:FILENAME
                                                     ofType:EXTENSION_OF_FILENAME];
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    return [content objectFromJSONString];
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

/*
 
 - (void)viewDidUnload {
 [bannerView_ release];
 }
 
 - (void)dealloc {
 [super dealloc];
 }
 
 */
@end
