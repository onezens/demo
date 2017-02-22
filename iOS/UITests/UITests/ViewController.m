//
//  ViewController.m
//  UITests
//
//  Created by wangzhen on 17/2/18.
//  Copyright © 2017年 onezen.cc. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginBtnClick:(id)sender {
    
    if (self.nameTextField.text.length == 0 || self.pwdTextField.text.length == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"name or password field can not empty" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirmAction];
        [self presentViewController:alert animated:true completion:nil];
        return;
    }
    [self performSegueWithIdentifier:@"segueHome" sender:nil];
//    HomeViewController *homeVc = [[HomeViewController alloc] init];
//    homeVc.title = self.nameTextField.text;
//    homeVc.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController pushViewController:homeVc animated:true];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueHome"]) {
        HomeViewController *destVc = segue.destinationViewController;
        destVc.title = self.nameTextField.text;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
