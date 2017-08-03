@class Employee;
@protocol SaveEmployeeProtocol <NSObject>;

@required
- (void)saveEmployee:(Employee *)empl;

@end
