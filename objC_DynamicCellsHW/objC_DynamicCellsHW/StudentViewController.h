//
//  StudentViewController.h
//  objC_DynamicCellsHW
//
//  Created by kluv on 04/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorObj.h"

NS_ASSUME_NONNULL_BEGIN

@interface StudentViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)closeStudentAction:(UIBarButtonItem *)sender;


@end

NS_ASSUME_NONNULL_END
