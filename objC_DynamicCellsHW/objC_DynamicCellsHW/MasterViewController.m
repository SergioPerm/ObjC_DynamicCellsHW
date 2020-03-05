//
//  MasterViewController.m
//  objC_DynamicCellsHW
//
//  Created by kluv on 05/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@property (strong, nonatomic) NSMutableArray* studentsArray;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
        
    self.studentsArray = [[NSMutableArray alloc] init];
    
    NSMutableDictionary* fioDict = [[NSMutableDictionary alloc] init];
    
    [fioDict setValue:@"Allen" forKey:@"Delon"];
    [fioDict setValue:@"Ivan" forKey:@"Doncov"];
    [fioDict setValue:@"Dimon" forKey:@"Elkin"];
    [fioDict setValue:@"Vovan" forKey:@"Pisun"];
    [fioDict setValue:@"Andrey" forKey:@"Herov"];
    [fioDict setValue:@"Alex" forKey:@"Vyatskiy"];
    [fioDict setValue:@"Sergey" forKey:@"Lepinin"];
    [fioDict setValue:@"Tom" forKey:@"Kruz"];
    [fioDict setValue:@"Andrey" forKey:@"Ivanov"];
    [fioDict setValue:@"Polina" forKey:@"Novachenko"];
    [fioDict setValue:@"Katya" forKey:@"Zyrya"];
    [fioDict setValue:@"Poul" forKey:@"Walker"];
    [fioDict setValue:@"Tim" forKey:@"Burton"];
    [fioDict setValue:@"George" forKey:@"Bemskiy"];
    [fioDict setValue:@"Olya" forKey:@"Panova"];
    [fioDict setValue:@"Oleg" forKey:@"Tinkoff"];
    [fioDict setValue:@"Oleg" forKey:@"Panov"];
    [fioDict setValue:@"Alexey" forKey:@"Hog"];
    [fioDict setValue:@"Fedor" forKey:@"Dostoevskiy"];
    [fioDict setValue:@"Alexandr" forKey:@"Pushkin"];
    [fioDict setValue:@"Darya" forKey:@"Dontcova"];
    [fioDict setValue:@"Erjan" forKey:@"Bekmanbetov"];
    [fioDict setValue:@"Elza" forKey:@"Urazova"];
    [fioDict setValue:@"Yana" forKey:@"Pospelova"];
    [fioDict setValue:@"Siri" forKey:@"Applovna"];
    
    for (int i = 0; i < [fioDict count]; i++) {
        
        Student* student = [[Student alloc] init];
        student.averageBall = [self generateAverageBall];
        
        [self.studentsArray addObject:student];
        
    }
    
    NSArray* lastNames = [fioDict allKeys];
    
    for (int i = 0; i < [fioDict count]; i ++) {
        
        NSString* lastName = lastNames[i];
        
        NSString* name = [fioDict valueForKey:lastName];
        
        Student* student = self.studentsArray[i];
        student.lastName = lastName;
        student.name = name;
        
        [self.studentsArray setObject:student atIndexedSubscript:i];
        
    }
    
    self.studentsArray = [self.studentsArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *first = [(Student*)obj1 name];
        NSString *second = [(Student*)obj2 name];
        return [first compare:second];
    }];
        
}

#pragma mark - Methods

- (NSInteger) generateAverageBall {
    
    NSInteger randomNum = arc4random_uniform(50);
    
    return randomNum;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.studentsArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
        NSLog(@"Created cell!");
    }
        
    Student* student = [self.studentsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.name, student.lastName];
    
    if (student.averageBall < 20)
        cell.backgroundColor = [UIColor systemPinkColor];
    
    NSString* averageBall = [NSString stringWithFormat: @"%ld", (long)student.averageBall];
    
    cell.detailTextLabel.text = averageBall;
    
    return cell;
    
}

#pragma mark - Actions

- (IBAction)closeMasterAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
