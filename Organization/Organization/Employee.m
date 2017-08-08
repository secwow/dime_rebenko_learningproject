
#import "Employee.h"

@implementation Employee

- (NSString *)fullName
{
    return [_lastName stringByAppendingString:_firstName];
    
}

- (id)initWithFirstName:(NSString *)fName lastNameInit:(NSString *)lName initSalary:(NSInteger)iSalary
{
    self = [super init];
    if (self)
    {
        _salary = iSalary;
        _firstName= fName;
        _lastName = lName;
    }
    return self;
}


@end

