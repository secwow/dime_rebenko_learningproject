@class Employee;
@class Organization;

@protocol DataAccessProtocol <NSObject>

- (Employee *)saveEmployee:(NSString *)firstName lastName:(NSString *)lastName salary:(NSInteger)salary birthDate:(NSDate *)date;
- (Employee *)saveEmployeeWithRefreshing:(NSString *)firstName lastName:(NSString *)lastName salary:(NSInteger)salary birthDate:(NSDate *)date;
- (Organization *)saveOrganization:(NSString *)orgName;
- (NSArray<Organization *> *)getAllOrganization;

@end
