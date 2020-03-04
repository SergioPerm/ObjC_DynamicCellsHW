//
//  NewbieViewController.m
//  objC_DynamicCellsHW
//
//  Created by kluv on 04/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "NewbieViewController.h"

@interface NewbieViewController ()

@end

@implementation NewbieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1000;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        NSLog(@"Created cell!");
    }

    UIColor* currentColor = [self generateColor];
    
    CGFloat redColor = 0;
    CGFloat greenColor = 0;
    CGFloat blueColor = 0;
    CGFloat alpha = 0;
    
    [currentColor getRed:&redColor green:&greenColor blue:&blueColor alpha:&alpha];
    
    cell.backgroundColor = currentColor;
    cell.textLabel.text = [NSString stringWithFormat:@"R: %.2f G: %.2f B: %.2f", redColor * 256, greenColor * 256, blueColor * 256];
    
    return cell;
    
}

#pragma mark - Methods

- (UIColor*) generateColor {
    
    return [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
    
}

#pragma mark - Actions

- (IBAction)closeNewbieAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
