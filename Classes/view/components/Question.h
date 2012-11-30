//
//  Question.h
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionVO.h"

@protocol QuestionDelegate

- (void)nextQuestion:(BOOL)lastResult;

@end

@interface Question : UIViewController {
	id<QuestionDelegate> quiz;
	
	UILabel *question;
	UILabel *option0;
	UILabel *option1;
	UILabel *option2;
	UILabel *option3;
	
	BOOL answer;
	
	UIButton *button0;
	UIButton *button1;
	UIButton *button2;
	UIButton *button3;
	
	QuestionVO *questionVO;
	NSArray *options;
	NSArray *buttons;
}

@property (nonatomic, retain) id<QuestionDelegate> quiz;

@property (nonatomic, retain) IBOutlet UILabel *question;

@property (nonatomic, retain) IBOutlet UILabel *option0;
@property (nonatomic, retain) IBOutlet UILabel *option1;
@property (nonatomic, retain) IBOutlet UILabel *option2;
@property (nonatomic, retain) IBOutlet UILabel *option3;

@property (nonatomic, retain) IBOutlet UIButton *button0;
@property (nonatomic, retain) IBOutlet UIButton *button1;
@property (nonatomic, retain) IBOutlet UIButton *button2;
@property (nonatomic, retain) IBOutlet UIButton *button3;

@property (nonatomic, retain) QuestionVO *questionVO;

@property (nonatomic, retain) NSArray *options;
@property (nonatomic, retain) NSArray *buttons;

- (IBAction)toggle:(id)sender;
- (void) checkAnswer:(UIButton *)selected;

- (void)transitionIn;
- (void)transitionOut;

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;

@end
