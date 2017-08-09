#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize managedObjectModel;
@synthesize managedObjectContext;
@synthesize persistentStoreCoordinator;

static NSManagedObjectContext *context;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    managedObjectModel = [self getObjectModel];
    managedObjectContext = [self managedObjectContext];
    persistentStoreCoordinator = [self persistentStoreCoordinator];
    context = managedObjectContext;
    return YES;
}

+ (NSManagedObjectContext *)context
{
    return context;
}

- (NSManagedObjectModel *)getObjectModel
{
    
    if(managedObjectModel!=nil)
    {
        return managedObjectModel;
    }
    
    NSURL *nsurl = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:nsurl];
    return managedObjectModel;
}

- (NSManagedObjectContext *)managedObjectContext
{
    
    if(managedObjectContext != nil){
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if(coordinator != nil){
        managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSMainQueueConcurrencyType];
        [managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if(persistentStoreCoordinator != nil)
    {
        return persistentStoreCoordinator;
    }
    
    NSURL *docDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [docDirectory URLByAppendingPathComponent:@"Employeeer.sqlite"];
    NSError *error = nil;
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: managedObjectModel];
    
    if(![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        abort();
    }
    
    return persistentStoreCoordinator;
}

+ (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectctx = context;
    
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
    [AppDelegate saveContext];
}

@end
