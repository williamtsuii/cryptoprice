//
//  TimezoneTableViewController.m
//  cryptoprice
//
//  Created by william on 2018-01-28.
//  Copyright © 2018 cpw. All rights reserved.
//

#import "TimezoneTableViewController.h"
#import "AppDelegate.h"

@interface TimezoneTableViewController ()

@property (nonatomic)   NSUInteger timezonePref;
@property (nonatomic) NSString* cellSelected;


@end

@implementation TimezoneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.timezonePref = [defaults integerForKey:kSettingsTimezone];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //NSInteger sectionCount = tableView.numberOfSections;
    //NSLog(@"Number of sections: %ld", (long)sectionCount);
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    NSUInteger row = [indexPath row];
    
    if (row == self.timezonePref) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSUInteger row = [indexPath row];
    
    self.timezonePref = row;
    [defaults setInteger:row forKey:kSettingsTimezone];
    [self.tableView reloadData];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.cellSelected = cell.textLabel.text;
    
    NSLog(@"la : %@", self.cellSelected);
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

@end
