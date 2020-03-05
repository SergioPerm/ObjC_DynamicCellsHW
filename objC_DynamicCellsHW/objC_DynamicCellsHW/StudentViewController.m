//
//  StudentViewController.m
//  objC_DynamicCellsHW
//
//  Created by kluv on 04/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "StudentViewController.h"

@interface StudentViewController ()

@property (strong, nonatomic) NSMutableArray* objArray;

@end

@implementation StudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.objArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 1000; i++) {
        
        ColorObj* colorObj = [[ColorObj alloc] init];
        
        colorObj.name = [self randomStringOfLength:10];
        colorObj.color = [self generateColor];
        
        [self.objArray addObject:colorObj];
        
    }
   
}

#pragma mark - Methods

- (UIColor*) generateColor {
    
    return [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
    
}

- (NSString*)randomStringOfLength:(NSInteger)length {

    char str[length+1];

    for (int i=0; i<length; i++){

        char rand = randomChar();

        str[i]=rand;
    }

    str[length]='\0';

    return [NSString stringWithCString:str encoding:NSUTF8StringEncoding];
}

char randomChar(){

    char randomLower = 'a' + arc4random_uniform(26);
    char randomUpper = 'A' + arc4random_uniform(6);
    char randomNumber = '0' + arc4random_uniform(9);

    int randomVal = arc4random_uniform(100);

    char randomAlpha = (randomVal % 2 == 0) ? randomLower : randomUpper;

    //If you don't want a numeric as part of the string, just
    //return randomAlpha

    return (randomVal % 3 == 0) ? randomNumber : randomAlpha;
}

#pragma mark - Methods Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    return [self.objArray count];
    
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        NSLog(@"Created cell!");
    }
    
    ColorObj* colorObj = [self.objArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = colorObj.name;
    cell.backgroundColor = colorObj.color;
    
    return cell;
    
}

#pragma mark - Actions

- (IBAction)closeStudentAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
