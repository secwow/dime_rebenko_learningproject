#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


NSManagedObjectContext *context;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.managedObjectModel = [self getObjectModel];
    self.managedObjectContext = [self managedObjectContext];
    self.persistentStoreCoordinator = [self persistentStoreCoordinator];
    return YES;
}

+ (NSManagedObjectContext *)context
{
    return context;
}

- (NSManagedObjectModel *)getObjectModel
{
    
    if(self.managedObjectModel!=nil)
    {
        return self.managedObjectModel;
    }
    
    NSURL *nsurl = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:nsurl];
    return self.managedObjectModel;
}

- (NSManagedObjectContext *)managedObjectContext
{
    
    if(self.managedObjectContext != nil){
        return self.managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if(coordinator != nil){
        self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSMainQueueConcurrencyType];
        [self.managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return self.managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if(self.persistentStoreCoordinator != nil)
    {
        return self.persistentStoreCoordinator;
    }
    
    NSURL *docDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [docDirectory URLByAppendingPathComponent:@"Employeeer.sqlite"];
    NSError *error = nil;
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: self.managedObjectModel];
    
    if(![self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        abort();
    }
    
    return self.persistentStoreCoordinator;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectctx = self.managedObjectContext;
    
    if(managedObjectctx != nil)
    {
        if([managedObjectctx hasChanges] && ![managedObjectctx save:&error])
        {
            abort();
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
}

@end
