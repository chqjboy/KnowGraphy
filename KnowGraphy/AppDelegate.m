
#import "AppDelegate.h"
#import "BaseNavigationCtrler.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initWindow];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}
-(void)initWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc]init];
    UINavigationController* nav = [[BaseNavigationCtrler alloc]initWithNavigationBarClass:[Navigationbar class] toolbarClass:nil];
    nav.viewControllers = @[self.viewController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

@end
