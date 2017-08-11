#import <Foundation/Foundation.h>
#import "Organization+CoreDataClass.h"

@class Employee;

@interface Organization (CustomProperties)

- (Employee *)getEmployeeByFullName:(NSString *)fullname;

@end
