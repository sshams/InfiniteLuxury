//
//  LanguageMediator.m
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
//  All rights reserved.
//

#import "LanguageMediator.h"
#import "ApplicationFacade.h"


@implementation LanguageMediator

+(NSString *)NAME {
	return @"LanguageMediator";
}

-(Language *)viewComponent {
	return viewComponent;
}

-(void)initializeMediator {
	self.mediatorName = [LanguageMediator NAME];
}

-(void)onRegister {
	[self.viewComponent setDelegate:self];
}

-(void)setLanguage:(NSString *)langugage {
	((ApplicationFacade *)facade).language = langugage;
	[facade sendNotification:ShowQuiz];
}


@end