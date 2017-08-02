
#import <Foundation/Foundation.h>
#import "Employee.h"
@interface Organization : NSObject


@property (nonatomic,readwrite) NSArray<Employee *> *empls;
@property (nonatomic,readonly) NSString *name;

- (id)initWithName:(NSString *)name;
- (void)addEmployeeWithName:(NSString *)name;
- (void)addEmployee:(Employee *)employee;
- (NSInteger)calculateAverageSalary;
- (Employee *)employeeWithLowestSalary;
- (NSArray *)employeesWithSalary:(int)salary tolerance:(int)tolerance;
- (Employee *)getEmployeeAtIndex:(NSInteger)num;
- (Employee *)getEmployeeByFullName:(NSString*)fullname;
- (void)removeEmployee:(Employee *)employee;
- (NSInteger)getCountEmplyees;
@end
