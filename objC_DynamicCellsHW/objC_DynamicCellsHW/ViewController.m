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

- (IBAction)openStudentAction:(UIButton *)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    StudentViewController *studentView = [sb instantiateViewControllerWithIdentifier:@"studentView"];

    studentView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    studentView.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:studentView animated:YES completion:nil];
    
}

- (IBAction)openMasterAction:(UIButton *)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    MasterViewController *masterView = [sb instantiateViewControllerWithIdentifier:@"masterView"];

    masterView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    masterView.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:masterView animated:YES completion:nil];
    
}
@end
