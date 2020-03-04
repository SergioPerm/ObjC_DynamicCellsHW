//
//  NewbieViewController.h
//  objC_DynamicCellsHW
//
//  Created by kluv on 04/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewbieViewController : UIViewController <UITableViewDataSource>

- (IBAction)closeNewbieAction:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
