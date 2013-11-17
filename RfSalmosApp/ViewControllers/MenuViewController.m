//
//  MenuViewController.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "MenuViewController.h"
#import "UINavigationController+Orientation.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self configureNavBar];
    
    [self configureBackground];
    
    self.configurations = [Menu configuracoes];
        
    self.tableView.backgroundColor = K_COLOR_MENU_GRAY;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) executeActionFor: (NSString *)storyboardId
{
    if (storyboardId == (id)[NSNull null] || storyboardId.length == 0) {
        return;
    }
    
    if ([storyboardId isEqualToString:@"ShareApp"]) {
        [self shareApp];
        return;
    }
    
    if ([storyboardId isEqualToString:@"EvaluateApp"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:K_APP_STORE_LINK]];
        return;
    }
    
    if ([storyboardId isEqualToString:@"SendEmail"]) {
        
        if ([MFMailComposeViewController canSendMail]) {
            [self prepareEmailScreen];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:K_ALERT_TITLE_EMAIL_NOT_CONFIGURATE
                                                            message:K_ALERT_TEXT_EMAIL_NOT_CONFIGURATE
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
        return;
    }
    
    if ([storyboardId isEqualToString:@"ListaSalmosTableViewController"]) {
        
        [self.navigationController.revealController showViewController:self.navigationController.revealController.frontViewController];

    
        UINavigationController *navigationSalmosController = [[UINavigationController alloc] initWithRootViewController:self.listaSalmosTableViewController];
        
    
        [self presentViewController:navigationSalmosController animated:YES completion:nil];


    }
    
    if ([storyboardId isEqualToString:@"AboutViewController"]) {
        
        [self.navigationController.revealController showViewController:self.navigationController.revealController.frontViewController];
        
        
        UINavigationController *navigationSalmosController = [[UINavigationController alloc] initWithRootViewController:self.aboutViewController];
        
        
        [self presentViewController:navigationSalmosController animated:YES completion:nil];
        
        
    }
   
}

//lazy instaciate for de controllers

- (AboutViewController *)aboutViewController {
    if (!_aboutViewController) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        _aboutViewController = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    }
    
    return _aboutViewController;
}

- (ListaSalmosTableViewController *)listaSalmosTableViewController {
    if (!_listaSalmosTableViewController) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        _listaSalmosTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"ListaSalmosTableViewController"];
    }
    
    
    return _listaSalmosTableViewController;
}

- (SalmosViewController *)capaController {
    if (!_capaController) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        _capaController = [storyboard instantiateViewControllerWithIdentifier:@"SalmosViewController"];
    }
    
    NSLog(@"Carregou o controller");
    NSLog(@"controller %@", _capaController);
    
    return _capaController;
}


- (void) shareApp {
    NSString *text = [NSString stringWithFormat:NSLocalizedString(@"email-app-text", nil), K_APP_STORE_LINK];
    
    NSString *subject = [NSString stringWithFormat:NSLocalizedString(@"email-app-subject", nil)];
    
    NSArray *activityItems = @[text];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [activityController setValue:subject forKey:@"subject"];
    
    [self presentViewController:activityController animated:YES completion:nil];
}

- (void) prepareEmailScreen {
    MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
    mailer.mailComposeDelegate = self;
    
    [mailer setSubject:NSLocalizedString(@"inform-problem-subject", nil)];
    
    NSArray *toRecipients = @[NSLocalizedString(@"inform-problem-to", nil)];
    [mailer setToRecipients:toRecipients];
    
    NSString *systemVersion = [NSString stringWithFormat:@"Versão do iOS: %@", [[UIDevice currentDevice] systemVersion]];
    NSString *deviceModel = [NSString stringWithFormat:@"Modelo: %@", [self getDevideModel]];
    NSString *appVersion = [NSString stringWithFormat:@"Versão do App: %@", [[NSBundle mainBundle]
                                                                             objectForInfoDictionaryKey:@"CFBundleVersion"]];
    
    NSString *emailBody = [NSString stringWithFormat:@"%@\n%@\n%@\n\n", systemVersion, deviceModel, appVersion];
    [mailer setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:mailer animated:YES completion:NULL];
    
}

- (void)configureNavBar {
    
    
    self.navigationController.navigationBar.titleTextAttributes =   [StyleHelper estiloTop];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationController.navigationBar.barTintColor = K_COLOR_MENU_BLACK;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = [@"Menu" uppercaseString];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

- (void) configureBackground {
    
    self.view.backgroundColor = K_COLOR_MENU_GRAY;
    
}

#pragma ###################################################################################################################
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.configurations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"menuCell";
    
    menuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[menuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Menu *configuration = [self.configurations objectAtIndex:[indexPath row]];

    [cell setBackgroundColor:K_COLOR_MENU_GRAY];
    
    menuCell *configurationCell = (menuCell *)cell;
    configurationCell.label.text = configuration.label;
    
    UIView *menuIndicador = configurationCell.menuIndicador;
    
    menuIndicador.backgroundColor = K_COLOR_MENU_BLUE;
    
    configurationCell.label.highlightedTextColor = [UIColor whiteColor];
    
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = K_COLOR_MENU_BLUE;
    cell.selectedBackgroundView = selectionColor;
    configurationCell.selectedBackgroundView = selectionColor;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}


#pragma ###################################################################################################################
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:NO];
    
    Menu *configuration = [self.configurations objectAtIndex:[indexPath row]];
    
    [self executeActionFor:configuration.storyboardId];
}


- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (NSString *)getDevideModel {
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSDictionary *commonNamesDictionary =
    @{
      @"i386":     @"iPhone Simulator",
      @"x86_64":   @"iPad Simulator",
      
      @"iPhone1,1":    @"iPhone",
      @"iPhone1,2":    @"iPhone 3G",
      @"iPhone2,1":    @"iPhone 3GS",
      @"iPhone3,1":    @"iPhone 4",
      @"iPhone3,2":    @"iPhone 4(Rev A)",
      @"iPhone3,3":    @"iPhone 4(CDMA)",
      @"iPhone4,1":    @"iPhone 4S",
      @"iPhone5,1":    @"iPhone 5(GSM)",
      @"iPhone5,2":    @"iPhone 5(GSM+CDMA)",
      @"iPhone5,3":    @"iPhone 5c(GSM)",
      @"iPhone5,4":    @"iPhone 5c(GSM+CDMA)",
      @"iPhone6,1":    @"iPhone 5s(GSM)",
      @"iPhone6,2":    @"iPhone 5s(GSM+CDMA)",
      
      @"iPad1,1":  @"iPad",
      @"iPad2,1":  @"iPad 2(WiFi)",
      @"iPad2,2":  @"iPad 2(GSM)",
      @"iPad2,3":  @"iPad 2(CDMA)",
      @"iPad2,4":  @"iPad 2(WiFi Rev A)",
      @"iPad2,5":  @"iPad Mini(WiFi)",
      @"iPad2,6":  @"iPad Mini(GSM)",
      @"iPad2,7":  @"iPad Mini(GSM+CDMA)",
      @"iPad3,1":  @"iPad 3(WiFi)",
      @"iPad3,2":  @"iPad 3(GSM+CDMA)",
      @"iPad3,3":  @"iPad 3(GSM)",
      @"iPad3,4":  @"iPad 4(WiFi)",
      @"iPad3,5":  @"iPad 4(GSM)",
      @"iPad3,6":  @"iPad 4(GSM+CDMA)",
      
      @"iPod1,1":  @"iPod 1st Gen",
      @"iPod2,1":  @"iPod 2nd Gen",
      @"iPod3,1":  @"iPod 3rd Gen",
      @"iPod4,1":  @"iPod 4th Gen",
      @"iPod5,1":  @"iPod 5th Gen",
      
      };
    
    NSString *machine = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString *deviceName = machine;
    if ([commonNamesDictionary valueForKey:machine]) {
        deviceName = commonNamesDictionary[machine];
    }
    
    return deviceName;
}



@end
