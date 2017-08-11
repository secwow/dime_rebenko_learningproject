#import "Organization+Custom.h"
#import "Employee+CoreDataClass.h"

@implementation Organization (CustomProperties)

- (Employee *)getEmployeeByFullName:(NSString *)fullname
{
    for (Employee *empl in self.empls)
    {
        if([empl.fullName isEqualToString:fullname])
        {
            return empl;
        }
    }
    return nil;
}

@end
