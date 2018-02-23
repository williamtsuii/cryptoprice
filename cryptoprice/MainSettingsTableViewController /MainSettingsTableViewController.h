//
//  MainSettingsTableViewController.h
//  cryptoprice
//
//  Created by william on 2018-02-17.
//  Copyright © 2018 cpw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainSettingsTableViewController : UITableViewController

@property (nonatomic, readwrite) NSMutableArray *coinNamesArray;
@property  (strong, nonatomic) NSMutableArray *selectedArray;
@property (strong,nonatomic) NSArray *coinNamesArrayManual;

@end
