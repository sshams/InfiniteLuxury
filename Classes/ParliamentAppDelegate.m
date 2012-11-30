//
//  ParliamentAppDelegate.m
//  Parliament
//
//  Created by Saad Shams on 12/30/10.
//  All rights reserved.
//

#import "ParliamentAppDelegate.h"

@implementation ParliamentAppDelegate


@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [super dealloc];
}

@end
