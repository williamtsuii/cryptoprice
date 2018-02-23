//
//  CustomTableViewCell.m
//  cryptoprice
//
//  Created by william on 2018-02-11.
//  Copyright © 2018 cpw. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

@synthesize currencyLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
        
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            // Initialization code
            
        }
        return self;
    }
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//
//- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    //self.currencyLabel = [UILabel  init];
//    
//    return self;
//}





@end
