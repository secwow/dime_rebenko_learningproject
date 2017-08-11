#import "Organization+CoreDataClass.h"
#import "Employee+CoreDataClass.h"

@implementation Organization

- (NSInteger)getCountEmployees
{
    return self.empls.count;
}

- (Employee *)getEmployeeByIndex:(NSInteger)index
{
    return [self.empls objectAtIndex:index];
}

- (Employee *)getEmployeeByFullName:(NSString *)fullname
{
    for (Employee *empl in self.empls)
    {
        if ([empl.fullName isEqualToString:fullname])
        {
            return empl;
        }
    }
    return nil;
}

@end
