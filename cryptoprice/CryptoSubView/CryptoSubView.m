//
//  CryptoSubView.m
//  cryptoprice
//
//  Created by william on 2018-02-19.
//  Copyright © 2018 cpw. All rights reserved.
//

#import "CryptoSubView.h"

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

-(void)initHelper  {
    //Custom initalization
    [[NSBundle mainBundle] loadNibNamed:@"CryptoSubView" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
}

-(void)setData:(NSString *)cryptoName forURL:(NSString *)cryptoAbbrev  {
    self.cryptoAbbrevForHelper = cryptoAbbrev;
    NSString *currencyPref = [[NSUserDefaults standardUserDefaults] stringForKey:@"currencyPref"];
    NSString *customURL = [NSString stringWithFormat:@"%@%@%@%@",
                           @"https://min-api.cryptocompare.com/data/pricemultifull?fsyms=",
                           cryptoAbbrev,
                           @"&tsyms=",
                           currencyPref];
    NSURL *coinListURL = [NSURL URLWithString:customURL];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:coinListURL
                                          completionHandler:^(NSData *data,
                                                              NSURLResponse *response,
                                                              NSError *error) {
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{  //ASYNCRHONOUS
                                                  NSDictionary *coinDataJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSString *coinPrice = [[[[coinDataJSON objectForKey:@"DISPLAY"]
                                                                           objectForKey:cryptoAbbrev]
                                                                          objectForKey:currencyPref]
                                                                         objectForKey: @"PRICE"];
                                                  NSString *lastUpdate = [[[[coinDataJSON objectForKey:@"DISPLAY"]
                                                                            objectForKey:cryptoAbbrev]
                                                                           objectForKey:currencyPref]
                                                                          objectForKey: @"LASTUPDATE"];
                                                  NSString *change24Hr = [[[[coinDataJSON objectForKey:@"DISPLAY"]
                                                                            objectForKey:cryptoAbbrev]
                                                                           objectForKey:currencyPref]
                                                                          objectForKey: @"CHANGE24HOUR"];
                                                  [self setProperties:cryptoName forPrice:coinPrice forLastUpdate:lastUpdate forChange:change24Hr];
                                              });
                                          }];
    [downloadTask resume];
}



//This method changes the [cryptoTitle] to the name of the cryptocurrency name
- (void)setProperties:(NSString*)name forPrice:(NSString*)price forLastUpdate:(NSString*)last forChange:(NSString *)change
{
    self.cryptoName.text = name;
    self.cryptoPrice.text = price;
    self.cryptoLastUpdate.text = last;
    self.cryptoChange.text = change;
}

-(IBAction)historicalBarBtnTapped:(id)sender {
    UISegmentedControl *s = (UISegmentedControl *) sender;
    switch (s.selectedSegmentIndex) {
        case 0:
            [self historicalPriceHelper:0];
            break;
            
        case 1:
            [self historicalPriceHelper:-1];
            break;
            
        case 2:
            
            [self historicalPriceHelper:-7];
            break;
            
        case 3:
            [self historicalPriceHelper:-30];
            break;
            
        case 4:
            [self historicalPriceHelper:-90];
            break;
            
        case 5:
            [self historicalPriceHelper:-180];
            break;
            
        case 6:
            [self historicalPriceHelper:-365];
            break;
    }
}

-(void)historicalPriceHelper:(int)timeStamp {
    NSString *currencyPref = [[NSUserDefaults standardUserDefaults] stringForKey:@"currencyPref"];
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    
    //hour for first if clause and everything else in the other clause
    if (timeStamp == 0) {
        dayComponent.hour = -1;
    }
    else {
        dayComponent.day = timeStamp;
    }
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *historicalDay = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
    int timeInterval = historicalDay.timeIntervalSince1970;
    NSString *timeIntervalString = [NSString stringWithFormat:@"%d", timeInterval];
    NSURL *customURL = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                        @"https://min-api.cryptocompare.com/data/pricehistorical?fsym=", self.cryptoAbbrevForHelper, @"&tsyms=", currencyPref, @"&ts=", timeIntervalString];
    NSURL *coinHistoricalData = [NSURL URLWithString:customURL];
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:coinHistoricalData
                                          completionHandler:^(NSData *data,
                                                              NSURLResponse *response,
                                                              NSError *error) {
                                              dispatch_async(dispatch_get_main_queue(), ^{  //ASYNCRHONOUS
                                                  NSDictionary *coinDataJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSString *coinPrice = [[coinDataJSON objectForKey:self.cryptoAbbrevForHelper] objectForKey:currencyPref];
                                                  NSString *coinPriceString = [NSString stringWithFormat:@"%@", coinPrice];
                                                  NSLog(@"%@", coinPriceString
                                                        );
                                                  self.historicalPrice.text = coinPriceString;
                                              });
                                          }];
    [downloadTask resume];
    
}



@end
