//
//  HomeViewController.m
//  UITests
//
//  Created by wangzhen on 17/2/18.
//  Copyright © 2017年 onezen.cc. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *signCountLbl;
@property (nonatomic, assign) NSInteger signCount;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.signCount = 0;
    [self showSignCount];
}
- (IBAction)signClick:(UISwitch *)sender {
    if (sender.on) {
        self.signCount += 1;
    }
    [self showSignCount];
}

- (void)showSignCount {
     self.signCountLbl.text = [NSString stringWithFormat:@"签到人数：%zd", self.signCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
