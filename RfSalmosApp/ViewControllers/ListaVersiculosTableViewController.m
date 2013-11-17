//
//  ListaVersiculosTableViewController.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "ListaVersiculosTableViewController.h"
#import "DisplaySalmoViewController.h"
#import "Versiculo.h"


@interface ListaVersiculosTableViewController ()

@end

@implementation ListaVersiculosTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.versiculos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"versiculo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Versiculo *versiculo = self.versiculos[indexPath.row];
    
    
    NSString *label = [[versiculo numero] stringByAppendingString:@" - "];
    
    label = [label stringByAppendingString:[versiculo texto]];
    
    cell.textLabel.text = label;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewSalmo"]) {
        if ([segue.destinationViewController isKindOfClass:[DisplaySalmoViewController class]]) {
            DisplaySalmoViewController *dpsvc = (DisplaySalmoViewController *)segue.destinationViewController;
            
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            
            Versiculo *versiculo = [self.versiculos objectAtIndex:indexPath.row];
            
            
            dpsvc.versiculo = [versiculo texto];
            
            NSString *title = self.salmo;
            
            title =  [title stringByAppendingString:@" : "];
            
            title = [title stringByAppendingString:[versiculo numero]];
                        
            dpsvc.title = [title uppercaseString];

            
            
        }
    }
}
@end
