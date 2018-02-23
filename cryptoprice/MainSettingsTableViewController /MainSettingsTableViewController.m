//
//  MainSettingsTableViewController.m
//  cryptoprice
//
//  Created by william on 2018-02-17.
//  Copyright © 2018 cpw. All rights reserved.
//

#import "MainSettingsTableViewController.h"

@interface MainSettingsTableViewController ()

@end

@implementation MainSettingsTableViewController

/*
- (void)getNamesToArray {
    NSURL *coinListURL = [NSURL URLWithString:@"https://min-api.cryptocompare.com/data/all/coinlist"];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:coinListURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *coinListJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSUInteger coinListCount = [[coinListJSON objectForKey:@"Data"] count];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.coinNamesArray = [[NSMutableArray alloc] init];
            NSArray *coinArray = [coinListJSON objectForKey:@"Data"];
            
            for (NSDictionary *item in coinArray) {
               // NSLog(@"coinFullName: %@",  [[[coinListJSON objectForKey:@"Data"] objectForKey:item] objectForKey:@"FullName"]);
                NSString *coinFullName = [[[coinListJSON objectForKey:@"Data"] objectForKey:item] objectForKey:@"FullName"];
                [self.coinNamesArray addObject:coinFullName];
            }
            NSLog(@"%@", self.coinNamesArray);
        });
    }];
    [downloadTask resume];
}
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; //initially get all the selected crypto
    self.selectedArray =  [[NSMutableArray alloc] initWithArray:[defaults objectForKey:@"SEL_CRYPTOS"]]; //store them in an mutable array
    self.coinNamesArrayManual = [NSArray arrayWithObjects:@"Bitcoin (BTC)", @"Ethereum (ETH)", @"Litecoin (LTC)", @"Ripple (XRP)", @"Bitcoin Cash (BCC)", @"Ethereum Classic (ETC)", @"Tronix (TRX)", @"ZCash (ZEC)", @"Monero (XMR)", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"coinName" forIndexPath:indexPath];
    //Below is only needed if we are using the coinNamesArray
  /*  NSURL *coinListURL = [NSURL URLWithString:@"https://min-api.cryptocompare.com/data/all/coinlist"];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:coinListURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *coinListJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSUInteger coinListCount = [[coinListJSON objectForKey:@"Data"] count];
   
        dispatch_async(dispatch_get_main_queue(), ^{
            //self.coinNamesArray = [[NSMutableArray alloc] init];
   
            //Below is commented because the API is WAY too many Crypto data: manually implement an array
           NSArray *coinArray = [coinListJSON objectForKey:@"Data"];
            for (NSDictionary *item in coinArray) {
                // NSLog(@"coinFullName: %@",  [[[coinListJSON objectForKey:@"Data"] objectForKey:item] objectForKey:@"FullName"]);
                NSString *coinFullName = [[[coinListJSON objectForKey:@"Data"] objectForKey:item] objectForKey:@"FullName"];
                [self.coinNamesArray addObject:coinFullName];
            }
            cell.textLabel.text = coinNamesArrayManual[indexPath.item];
        });
    }];
    [downloadTask resume];
    */

     cell.textLabel.text = self.coinNamesArrayManual[indexPath.item];
    

    cell.accessoryType = ([_selectedArray containsObject:[_coinNamesArrayManual objectAtIndex:indexPath.row]]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        if([self.selectedArray containsObject:[self.coinNamesArrayManual objectAtIndex:indexPath.row]])
        {
            [self.selectedArray removeObject:[self.coinNamesArrayManual objectAtIndex:indexPath.row]];
        }
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.selectedArray addObject:[self.coinNamesArrayManual objectAtIndex:indexPath.row]];
    }
    
    //update the defaults each time for selection or deselection
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.selectedArray forKey:@"SEL_CRYPTOS"];
    [defaults synchronize];

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
