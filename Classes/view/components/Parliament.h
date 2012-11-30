//
//  Parliament.h
//  Parliament
//
//  Created by Saad Shams on 8/6/10.
// All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Splash.h"
#import "Language.h"
#import "Quiz.h"

@interface Parliament : UIViewController {
	NSString *device;
	Splash *splash;
	Language *language;
	Quiz *quiz;
}

@property (nonatomic, retain) NSString *device;
@property (nonatomic, retain) Splash *splash;
@property (nonatomic, retain) Language *language;
@property (nonatomic, retain) Quiz *quiz;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil device:(NSString *)device;
-(void)showSplash;
-(void)showLanguage;
-(void)showQuiz;

@end
