//
//  ViewController.m
//  objC_DynamicCellsHW
//
//  Created by kluv on 04/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)openNewbieAction:(UIButton *)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    NewbieViewController *newbieView = [sb instantiateViewControllerWithIdentifier:@"newbieView"];

    newbieView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    newbieView.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:newbieView animated:YES completion:nil];
    
}
@end
