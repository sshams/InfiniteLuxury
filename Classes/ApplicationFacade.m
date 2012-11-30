//
//  ApplicationFacade.m
//  Parliament
//
//  Created by Saad Shams on 8/3/10.
//  All rights reserved.
//

#import "ApplicationFacade.h"
#import "StartupCommand.h"


@implementation ApplicationFacade

@synthesize device, language, productIDs, questionIDs;

- (void)startup:(id)app device:(NSString *)currentDevice {
	[self sendNotification:Startup body:app];
	self.device = currentDevice;
}

+ (ApplicationFacade *)getInstance {
	return (ApplicationFacade *)[super getInstance];
}

- (void) initializeController {
	[super initializeController];
	[self registerCommand:Startup commandClassRef:[StartupCommand class]];
}

@end
