//
//  CryptoSubView.m
//  cryptoprice
//
//  Created by william on 2018-02-19.
//  Copyright © 2018 cpw. All rights reserved.
//

#import "CryptoSubView.h"

@interface CryptoSubView ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *cryptoName;
@property (weak, nonatomic) IBOutlet UILabel *cryptoPrice;
@property (weak, nonatomic) IBOutlet UILabel *cryptoLastUpdate;
@property (weak, nonatomic) IBOutlet UILabel *cryptoChange;

@end


@implementation CryptoSubView

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initHelper];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initHelper];
    }
    return self;
}

-(void)initHelper {
    //Custom initalization
    [[NSBundle mainBundle] loadNibNamed:@"CryptoSubView" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    
}


//This method changes the [cryptoTitle] to the name of the cryptocurrency name

- (void)setProperties:(NSString*)name forPrice:(NSString*)price forLastUpdate:(NSString*)last forChange:(NSString *)change
{
    self.cryptoName.text = name;
    self.cryptoPrice.text = price;
    self.cryptoLastUpdate.text = last;
    self.cryptoChange.text = change;
}





@end
