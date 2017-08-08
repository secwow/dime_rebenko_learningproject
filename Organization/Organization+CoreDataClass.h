//
//  Organization+CoreDataClass.h
//  Organization
//
//  Created by New user on 08.08.17.
//  Copyright © 2017 New user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class Employee;

NS_ASSUME_NONNULL_BEGIN

@interface Organization : NSManagedObject

- (NSInteger)getCountEmployees;
- (Employee *)getEmployeeByIndex:(NSInteger)index;
- (Employee *)getEmployeeByFullName:(NSString *) fullname;

@end

NS_ASSUME_NONNULL_END

#import "Organization+CoreDataProperties.h"
