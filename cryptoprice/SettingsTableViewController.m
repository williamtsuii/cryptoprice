//
//  SettingsTableViewController.m
//  cryptoprice
//
//  Created by william on 2018-02-03.
//  Copyright © 2018 cpw. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "PreferencesTableViewController.h"
#import "CustomTableViewCell.h"


@interface SettingsTableViewController ()

@property (nonatomic) NSInteger currencyDefault;
@property (nonatomic) NSInteger timezoneDefault;
@property (strong, strong) PreferencesTableViewController *currency;

@property (weak, nonatomic) IBOutlet CustomTableViewCell *currencyCell;


@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.currency = [[PreferencesTableViewController alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    NSString *tokenString = [[NSUserDefaults standardUserDefaults] stringForKey:@"currencyPref"];
    self.currencyCell.currencyLabel.text = tokenString;

    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];

    NSUInteger section = [indexPath section];
    if (section == 0) {
        
        [self performSegueWithIdentifier:@"currencySegue" sender:self];
        //[self.tableView reloadData];
        
    } else if (section == 1) {
        [self performSegueWithIdentifier:@"timezoneSegue" sender:self];
    }
    
    
}

/*+ (NSString*)getCurrency:(PreferencesTableViewController *) currency {
    NSString *currencyPref = [currency getCellText];
    return currencyPref;
}*/
@end
