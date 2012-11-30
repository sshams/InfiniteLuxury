//
//  ApplicationFacade.h
//  Parliament
//
//  Created by Saad Shams on 8/3/10.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Facade.h"

#define Startup @"startup"
#define IDs @"IDs"
#define ShowSplash @"showSplash"
#define ShowLanguage @"showLanguage"
#define ShowQuiz @"showQuiz"

@interface ApplicationFacade : Facade {
	NSString *device;
	NSString *language;
	NSArray *productIDs;
	NSArray *questionIDs;
	int correctAnswers;
}

@property (nonatomic, retain) NSString *device;
@property (nonatomic, retain) NSString *language;
@property (nonatomic, retain) NSArray *productIDs;
@property (nonatomic, retain) NSArray *questionIDs;

+ (ApplicationFacade *)getInstance;
- (void)startup:(id)app device:(NSString *)currentDevice;

@end