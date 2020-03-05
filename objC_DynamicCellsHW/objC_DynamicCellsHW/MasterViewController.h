//
//  MasterViewController.h
//  objC_DynamicCellsHW
//
//  Created by kluv on 05/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface MasterViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)closeMasterAction:(UIBarButtonItem *)sender;


@end

NS_ASSUME_NONNULL_END
