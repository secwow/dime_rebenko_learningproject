#import "Organization+Custom.h"
#import "Employee+CoreDataClass.h"

@implementation Organization (CustomProperties)

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

- (void)mixingOrderEmployees
{
    NSMutableArray *emplers = [self.empls.mutableCopy allObjects].mutableCopy;
    for(int i=0; i < emplers.count; i++)
    {
        int n = arc4random_uniform(emplers.count-i) + i;
        [emplers exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    self.empls = [NSOrderedSet orderedSetWithArray:emplers];
}

@end
