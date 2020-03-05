//
//  Student.h
//  objC_DynamicCellsHW
//
//  Created by kluv on 05/03/2020.
//  Copyright © 2020 com.kluv.hw24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) NSInteger averageBall;

@end

NS_ASSUME_NONNULL_END
