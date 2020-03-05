//
//  ViewController.h
//  objC_DynamicCellsHW
//
//  Created by kluv on 04/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewbieViewController.h"
#import "StudentViewController.h"
#import "MasterViewController.h"

@interface ViewController : UIViewController

- (IBAction)openNewbieAction:(UIButton *)sender;
- (IBAction)openStudentAction:(UIButton *)sender;
- (IBAction)openMasterAction:(UIButton *)sender;

@end

