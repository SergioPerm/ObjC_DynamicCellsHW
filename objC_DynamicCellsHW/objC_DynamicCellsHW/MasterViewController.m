//
//  MasterViewController.m
//  objC_DynamicCellsHW
//
//  Created by kluv on 05/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import "MasterViewController.h"

typedef enum {
    groupeGreateA = 0,
    groupeGreateB = 1,
    groupeGreateC = 2,
    groupeGreateD = 3,
    colorsSection = 4
} sectionTypes;

@interface MasterViewController ()

@property (strong, nonatomic) NSMutableArray* studentsArray;

@property (strong, nonatomic) NSMutableArray* studentsGreateA;
@property (strong, nonatomic) NSMutableArray* studentsGreateB;
@property (strong, nonatomic) NSMutableArray* studentsGreateC;
@property (strong, nonatomic) NSMutableArray* studentsGreateD;

@property (strong, nonatomic) NSMutableArray* colorsRows;

@property (strong, nonatomic) NSArray* studentsGreateGroups;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
        
    self.studentsArray = [[NSMutableArray alloc] init];
    self.studentsGreateA = [[NSMutableArray alloc] init];
    self.studentsGreateB = [[NSMutableArray alloc] init];
    self.studentsGreateC = [[NSMutableArray alloc] init];
    self.studentsGreateD = [[NSMutableArray alloc] init];
    self.studentsGreateGroups = [[NSMutableArray alloc] init];
    
    self.colorsRows = [[NSMutableArray alloc] init];
        
    NSMutableDictionary* fioDict = [self generateStudentsNames];
    
    [self generateFullStudentsArrayWithNamesDict:fioDict];
    
    for (Student* currentStudent in self.studentsArray) {
        
        if (currentStudent.averageBall == 2) {
            [self.studentsGreateD addObject:currentStudent];
        } else if (currentStudent.averageBall == 3) {
            [self.studentsGreateC addObject:currentStudent];
        } else if (currentStudent.averageBall == 4) {
            [self.studentsGreateB addObject:currentStudent];
        } else {
            [self.studentsGreateA addObject:currentStudent];
        }
        
    }
    
    self.studentsGreateD = [self sortStudentsArrByNames:self.studentsGreateD];
    self.studentsGreateC = [self sortStudentsArrByNames:self.studentsGreateC];
    self.studentsGreateB = [self sortStudentsArrByNames:self.studentsGreateB];
    self.studentsGreateA = [self sortStudentsArrByNames:self.studentsGreateA];
        
    //generate color array
    for (int i = 0; i < 10; i++) {
        [self.colorsRows addObject: [self generateColor]];
    }
    
    self.studentsGreateGroups = [NSArray arrayWithObjects:
                                 self.studentsGreateA,
                                 self.studentsGreateB,
                                 self.studentsGreateC,
                                 self.studentsGreateD,
                                 self.colorsRows,
                                 nil];
    
}

#pragma mark - Methods

- (NSMutableArray*) sortStudentsArrByNames:(NSMutableArray*) studentsArray {
    
    return (NSMutableArray*)[studentsArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *first = [(Student*)obj1 name];
        NSString *second = [(Student*)obj2 name];
        return [first compare:second];
    }];
    
}

- (void) generateFullStudentsArrayWithNamesDict:(NSMutableDictionary*) fioDict {
    
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
    
}

- (NSMutableDictionary*) generateStudentsNames {
    
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
    
    return fioDict;
    
}

- (UIColor*) generateColor {
    
    return [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
    
}

- (NSInteger) generateAverageBall {
    
    NSInteger randomNum = 2 + arc4random_uniform((uint32_t)(4));
    
    return randomNum;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.studentsGreateGroups count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSMutableArray* studentsArr = [self.studentsGreateGroups objectAtIndex:section];
    
    return [studentsArr count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString* headerText = @"";
    
    if (section == groupeGreateA) {
        headerText = @"Отличники";
    } else if (section == groupeGreateB) {
        headerText = @"Хорошисты";
    } else if (section == groupeGreateC) {
        headerText = @"Троешники";
    } else if (section == groupeGreateD) {
        headerText = @"Двоешники";
    } else if (section == colorsSection) {
        headerText = @"Цвета";
    }
    
    return headerText;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"";
    
    UITableViewCellStyle cellStyle = UITableViewCellStyleValue1;
    
    if (indexPath.section == colorsSection) {
        identifier = @"ColorCell";
        cellStyle = UITableViewCellStyleDefault;
    } else {
        identifier = @"Cell";
        cellStyle = UITableViewCellStyleValue1;
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:identifier];
    }
    
    if (indexPath.section == colorsSection) {
        
        NSMutableArray* colorRows = [self.studentsGreateGroups objectAtIndex:colorsSection];
        
        UIColor* currentColor = [colorRows objectAtIndex:indexPath.row];
        
        CGFloat redColor = 0;
        CGFloat greenColor = 0;
        CGFloat blueColor = 0;
        CGFloat alpha = 0;
        
        [currentColor getRed:&redColor green:&greenColor blue:&blueColor alpha:&alpha];
        
        cell.backgroundColor = currentColor;
        cell.textLabel.text = [NSString stringWithFormat:@"R: %.2f G: %.2f B: %.2f", redColor * 256, greenColor * 256, blueColor * 256];
        
    } else {
        
        NSMutableArray* studentsArr = [self.studentsGreateGroups objectAtIndex:indexPath.section];
        
        Student* student = [studentsArr objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.name, student.lastName];
        
        if (student.averageBall < 3) {
            cell.backgroundColor = [UIColor systemPinkColor];
        } else {
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        NSString* averageBall = [NSString stringWithFormat: @"%ld", (long)student.averageBall];
        
        cell.detailTextLabel.text = averageBall;
    }
        
    return cell;
    
}

#pragma mark - Actions

- (IBAction)closeMasterAction:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
