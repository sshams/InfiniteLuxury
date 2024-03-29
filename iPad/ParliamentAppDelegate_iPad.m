//
//  ParliamentAppDelegate_iPad.m
//  Parliament
//
//  Created by Saad Shams on 12/30/10.
//   All rights reserved.
//

#import "ParliamentAppDelegate_iPad.h"
#import "ApplicationFacade.h"

@implementation ParliamentAppDelegate_iPad

@synthesize parliament;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch.
    
    NSString *device = @"iPad";
	
	parliament = [[[Parliament alloc] initWithNibName:[@"Parliament_" stringByAppendingString:device] bundle:[NSBundle mainBundle] device:device] autorelease];
	[window addSubview:[parliament view]];
	
	[[ApplicationFacade getInstance] startup:parliament device:device];
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


/**
 Superclass implementation saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	[super applicationWillTerminate:application];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
    [super applicationDidReceiveMemoryWarning:application];
}


- (void)dealloc {
    
	parliament = nil;
    
	[super dealloc];
}


@end
