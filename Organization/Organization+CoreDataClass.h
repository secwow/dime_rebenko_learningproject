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