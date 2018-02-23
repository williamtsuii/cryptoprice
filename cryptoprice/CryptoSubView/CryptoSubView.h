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
- (void)setProperties:(NSString*)name
             forPrice:(NSString*)price
        forLastUpdate:(NSString*)last
            forChange:(NSString *)change;
@end
