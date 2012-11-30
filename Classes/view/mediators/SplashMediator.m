//
//  SplashMediator.m
//  Parliament
//
//  Created by Saad Shams on 8/6/10.
// All rights reserved.
//

#import "SplashMediator.h"
#import "Splash.h"
#import "ApplicationFacade.h"

@implementation SplashMediator

+(NSString *)NAME {
	return @"SplashMediator";
}

-(Splash *)viewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.mediatorName = [SplashMediator NAME];
}

-(void)onRegister {
	[self.viewComponent setDelegate:self];
}

-(void)splashViewClick {
	[self sendNotification: ShowLanguage];
}

@end
