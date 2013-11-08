//
//  MenuViewController.m
//  RfSalmosApp
//
//  Created by Ricardo jorge Fideles junior on 01/11/13.
//  Copyright (c) 2013 Ricardo jorge Fideles junior. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"carrego a view");
    
   //
    [self configureNavBar];
    
    self.configurations = [Menu configuracoes];
    
    NSLog(@"configs %@", self.configurations);
    
    self.view.backgroundColor = K_COLOR_MENU_GRAY;
    self.tableView.backgroundColor = K_COLOR_MENU_GRAY;
    
    self.topNavBar.backgroundColor = [UIColor blackColor];
    
    self.labelTopNavBar.text = @"teste";
    
    
    //comando que zera a navegacao..
    /*
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
     */
    
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
    // Dispose of any resources that can be recreated.
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
    /*
    
    if ([storyboardId isEqualToString:@"
     "]) {
        
        
        UINavigationController *listaSalmosController = [[UINavigationController alloc] initWithRootViewController:self.listaSalmosTableViewController];
        [self.revealController setFrontViewController:listaSalmosController];
        [self.revealController showViewController:self.revealController.frontViewController];
        
        
        return;
    }
     
     ListaSalmosTableViewController
      
      */
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ListaSalmosTableViewController *vc = [storyboard instantiateViewControllerWithIdentifier:storyboardId];
    
    vc.listaSalmos = [SalmosHelper readSalmos];
    
    NSLog(@"deveria fazer algo");
    NSLog(@"Id storyBoard : %@", storyboardId);
    
    
    [self.revealController setFrontViewController:vc];
    [self.revealController showViewController:self.revealController.frontViewController];

    
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
    
    //Usando o cliente de email nativo no lugar de MFMailCompose pois este estava causando um bug
    /* NSString *subject = [NSString stringWithFormat:NSLocalizedString(@"inform-problem-subject", nil)];
     NSString *mail = [NSString stringWithFormat:NSLocalizedString(@"inform-problem-to", nil)];
     
     NSString *systemVersion = [NSString stringWithFormat:@"Versão do iOS: %@", [[UIDevice currentDevice] systemVersion]];
     NSString *deviceModel = [NSString stringWithFormat:@"Modelo: %@", [self getDevideModel]];
     NSString *appVersion = [NSString stringWithFormat:@"Versão do App: %@", [[NSBundle mainBundle]
     objectForInfoDictionaryKey:@"CFBundleVersion"]];
     NSString *emailBody = [NSString stringWithFormat:@"%@\n%@\n%@\n\n", systemVersion, deviceModel, appVersion];
     
     NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
     [mail stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
     [subject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
     [emailBody stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
     
     [[UIApplication sharedApplication] openURL:url];*/
}

-(void)configureNavBar {
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor: [UIColor grayColor]];
    [shadow setShadowOffset: CGSizeMake(0.0f, 0.0f)];
    
    NSDictionary *textTitleOptions = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor], NSForegroundColorAttributeName,
                                      shadow, NSShadowAttributeName,
                                      [UIFont fontWithName:@"HelveticaNeue-Bold" size:20], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.titleTextAttributes = textTitleOptions;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#212121" alpha:1.0f];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
}

#pragma ###################################################################################################################
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Linhas %d" ,[self.configurations count] );
    return [self.configurations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"preenchendo as celulas");
    
    NSString *cellIdentifier = @"menuCell";
    
    menuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[menuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Menu *configuration = [self.configurations objectAtIndex:[indexPath row]];
    
    
    NSLog(@"celula %@", configuration.label);
    
    [cell setBackgroundColor:K_COLOR_MENU_GRAY];
    
    menuCell *configurationCell = (menuCell *)cell;
    configurationCell.label.text = configuration.label;
    
    configurationCell.label.highlightedTextColor = [UIColor whiteColor];
    
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithHexString:@"#E40000" alpha:1.0];
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
