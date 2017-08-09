#import "DetailViewController.h"
#import "Employee.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.detailItem)
    {
        NSInteger salary = _detailItem.salary;
        NSString* information = [_detailItem.fullName stringByAppendingString:@"’s salary is "];
        information = [information stringByAppendingString:[@(salary) stringValue]];
        [_detailView setText: information];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)setDetailItem:(Employee *)detailItem
{
        _detailItem = detailItem;
}

@end
