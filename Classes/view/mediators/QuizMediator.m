//
//  QuizMediator.m
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
// All rights reserved.
//

#import "QuizMediator.h"
#import "Quiz.h"
#import "ApplicationFacade.h"
#import "ProductProxy.h"
#import "LuxuryProxy.h"

@implementation QuizMediator

+ (NSString *)NAME {
	return @"QuizMediator";
}

- (Quiz *)viewComponent {
	return viewComponent;
}

- (void)initializeMediator {
	self.mediatorName = [QuizMediator NAME];
}

- (void)onRegister {
	[self.viewComponent setDelegate:self];
}

- (void)restartQuiz {
	[facade sendNotification:ShowSplash];
}

- (NSArray *)listNotificationInterests {
	return [NSArray arrayWithObjects:ShowQuiz, nil];
}  
		
- (void)handleNotification:(id <INotification>)notification {
	if ([[notification name] isEqualToString:ShowQuiz]) {
		ProductProxy *productProxy = (ProductProxy *)[facade retrieveProxy:[ProductProxy NAME]];
		LuxuryProxy *luxuryProxy = (LuxuryProxy *)[facade retrieveProxy:[LuxuryProxy NAME]];
		
		[productProxy load];
		[luxuryProxy load];
				
		//Generate random numbers here, 5 and 11 inclusive
		
		int a = 0, b = 0, c = 0, d = 0;
		
		while (a == b) {
			a = arc4random() % [productProxy getCount];
			b = arc4random() % [productProxy getCount];
		}
		
		while (c == d) {
			c = arc4random() % [luxuryProxy getCount];
			d = arc4random() % [luxuryProxy getCount];
		}
		
		NSArray *questions = [[NSArray alloc] initWithObjects:[productProxy getQuestion:a], [productProxy getQuestion:b], [luxuryProxy getQuestion:c], [luxuryProxy getQuestion:d], nil];
		
		[viewComponent loadQuiz:questions language:((ApplicationFacade *)facade).language device:((ApplicationFacade *)facade).device];	
	}
}


@end