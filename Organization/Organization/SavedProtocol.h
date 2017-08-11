@class Employee;

@protocol SaveEmployeeProtocol <NSObject>

- (void)saveEmployee:(NSString *)firstName lastName:(NSString *)lastName salary:(NSInteger)salary;

@end
