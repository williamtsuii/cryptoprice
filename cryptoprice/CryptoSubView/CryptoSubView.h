//
//  CryptoSubView.h
//  cryptoprice
//
//  Created by william on 2018-02-19.
//  Copyright © 2018 cpw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CryptoSubView : UIView

-(void)initHelper;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *cryptoName;
@property (weak, nonatomic) IBOutlet UILabel *cryptoPrice;
@property (weak, nonatomic) IBOutlet UILabel *cryptoLastUpdate;
@property (weak, nonatomic) IBOutlet UILabel *cryptoChange;
@property (weak, nonatomic) IBOutlet UILabel *historicalPrice;
@property (weak, nonatomic) IBOutlet UISegmentedControl *historicalBar;

- (void)setProperties:(NSString*)name
             forPrice:(NSString*)price
        forLastUpdate:(NSString*)last
            forChange:(NSString *)change;
@end
