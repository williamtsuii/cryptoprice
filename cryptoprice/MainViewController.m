//
//  MainViewController.m
//  cryptoprice
//
//  Created by william on 2018-02-19.
//  Copyright © 2018 cpw. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableSettingsViewController.h"
#import "CryptoSubView.h"
#import "MainScrollViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) CryptoSubView *subView;
@property (weak, nonatomic) IBOutlet MainScrollViewController *scrollView;
@property (nonatomic) int cryptoSubViewWidth;
@property (nonatomic) int cryptoSubViewHeight;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setting cryptoSubView Properties:
    self.cryptoSubViewWidth = 375;
    self.cryptoSubViewHeight = 245;
 
    self.view = [[UIView alloc] init];
    UIView *gvcView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = gvcView;
    
    MainScrollViewController *scrollVC = [[MainScrollViewController alloc]
                                          initWithFrame:CGRectMake(0,
                                                                   64,
                                                                   self.view.bounds.size.width,
                                                                   self.view.bounds.size.height)];
    
    self.scrollView = scrollVC;
    self.scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to refresh"];
    [refreshControl addTarget:self action:@selector(refreshView:) forControlEvents:UIControlEventValueChanged];
    [self.scrollView insertSubview:refreshControl atIndex:0];
    [self.scrollView addSubview:refreshControl];
    
    [self getData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)refreshView:(UIRefreshControl *)refreshControl {
    double delayInSeconds = 2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        for (UIView * view in self.scrollView.subviews) {
            [view removeFromSuperview];
        }
        [self getData];
        [refreshControl endRefreshing];
        [self.scrollView addSubview:refreshControl];
    });
}


-(void)getData {
    
    NSString *currencyPref = [[NSUserDefaults standardUserDefaults] stringForKey:@"currencyPref"];
    NSArray *tokenArray = [[NSUserDefaults standardUserDefaults] arrayForKey:@"SEL_CRYPTOS"];
    NSInteger selectedCryptoCount = tokenArray.count;

    for (int i = 0; i < selectedCryptoCount; i++) {
        NSString *currentCrypto = tokenArray[i];
        NSInteger firstNumber = (currentCrypto.length - 4);
        NSString *substringCrypto = [currentCrypto substringWithRange:NSMakeRange(firstNumber ,3)];

        // Adding custom CryptoSubView to for each array item:
        CryptoSubView *aSubView = [[CryptoSubView alloc]
                                    initWithFrame:CGRectMake(0,
                                                             (i*self.cryptoSubViewHeight),
                                                             self.view.bounds.size.width,
                                                             self.view.bounds.size.height)];
 
        [aSubView setData:currentCrypto forURL:substringCrypto];
        [self.scrollView addSubview:aSubView];

    }
    
    if (self.scrollView.subviews.count <= 3) {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width,
                                                 (3*self.cryptoSubViewHeight+50));
    } else {
        //Sets height for UIScrollView (varies with # of cryptoprices being displayed)
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width,
                                                 (selectedCryptoCount*self.cryptoSubViewHeight));
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
