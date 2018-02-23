    //
//  AppDelegate.h
//  cryptoprice
//
//  Created by william on 2018-01-22.
//  Copyright © 2018 cpw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController; 

extern NSString *kSettingsCurrency;
extern NSString *kSettingsTimezone;

@end

