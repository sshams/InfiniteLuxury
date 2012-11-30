//
//  StartupCommand.m
//  Parliament
//
//  Created by Saad Shams on 8/3/10.
//  All rights reserved.
//

#import "StartupCommand.h"
#import "ApplicationFacade.h"
#import "Parliament.h"
#import "ProductProxy.h"
#import "LuxuryProxy.h"
#import "ParliamentMediator.h"
#import "SplashMediator.h"
#import "LanguageMediator.h"
#import "QuizMediator.h"


@implementation StartupCommand
	
-(void)execute:(id<INotification>)notification {
	
	[facade registerProxy:[ProductProxy proxy]];
	[facade registerProxy:[LuxuryProxy proxy]];
	
	Parliament *app = [notification body];
	
	[facade registerMediator:[ParliamentMediator withViewComponent: app]];

	[facade registerMediator:[SplashMediator withViewComponent:app.splash]];
	[facade registerMediator:[LanguageMediator withViewComponent:app.language]];
	[facade registerMediator:[QuizMediator withViewComponent:app.quiz]];
	
}

@end
