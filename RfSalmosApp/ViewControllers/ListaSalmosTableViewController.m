//
//  ListaSalmosTableViewController.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "ListaSalmosTableViewController.h"
#import "ListaVersiculosTableViewController.h"

@interface ListaSalmosTableViewController ()

@end

@implementation ListaSalmosTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.listaSalmos = [SalmosHelper readSalmos];
    
    self.title =
    @"Salmos";
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.listaSalmos count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"salmo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *label = [@"Salmo " stringByAppendingString:[self.listaSalmos[indexPath.row] capitulo]];
    
    cell.textLabel.text = label;
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"listaVersiculos"]) {
        if ([segue.destinationViewController isKindOfClass:[ListaVersiculosTableViewController class]]) {
            ListaVersiculosTableViewController *lvtvc = (ListaVersiculosTableViewController *)segue.destinationViewController;
            
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            
            Salmo *salmo = [self.listaSalmos objectAtIndex:indexPath.row];
            
            lvtvc.versiculos = [salmo versiculos];
            lvtvc.salmo = [@"Salmo " stringByAppendingString:[salmo capitulo]];
            
            lvtvc.title = @"Versículos";
            
        }
    }
}

@end
