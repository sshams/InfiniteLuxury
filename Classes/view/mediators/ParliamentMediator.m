//
//  ParliamentMediator.m
//  Parliament
//
//  Created by Saad Shams on 8/3/10.
//  All rights reserved.
//

#import "ParliamentMediator.h"
#import "Parliament.h"
#import "ApplicationFacade.h"

@implementation ParliamentMediator

+(NSString *)NAME {
	return @"ParliamentMediator";
}

-(Parliament *)viewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.mediatorName = [ParliamentMediator NAME];
}

-(NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects: ShowSplash, ShowLanguage, ShowQuiz, nil];
}

-(void)handleNotification:(id <INotification>)notification {
	
	if ([[notification name] isEqualToString:ShowSplash]) {
		[viewComponent showSplash];
	} else if ([[notification name] isEqualToString:ShowLanguage]) {
		[viewComponent showLanguage];
	} else if ([[notification name] isEqualToString:ShowQuiz]) {
		[viewComponent showQuiz];
	}
}

@end
