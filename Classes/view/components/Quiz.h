//
//  Quiz.h
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "Congratulations.h"
#import "Sorry.h"

@protocol QuizDelegate

- (void) restartQuiz;

@end


@interface Quiz : UIViewController <QuestionDelegate, CongratulationsDelegate, SorryDelegate> {
	id<QuizDelegate> delegate;
	int totalAsked;
	int trueAnswers;
	NSArray *questionVOs;
	Question *question;
	NSString *language;
	NSString *device;
	
	UIViewController *result;
}

@property (nonatomic, retain) id<QuizDelegate> delegate;
@property (nonatomic, retain) Question *question;
@property (nonatomic, retain) NSArray *questionVOs;
@property (nonatomic, assign) int totalAsked;
@property (nonatomic, assign) int trueAnswers;
@property (nonatomic, retain) NSString *language;
@property (nonatomic, retain) NSString *device;
@property (nonatomic, retain) UIViewController *result;

- (void)loadQuiz:(NSArray *)selectedQuestions language:(NSString *)currentLanguage device:(NSString *)currentDevice;
- (void)showQuestion;
- (void)showResult;

@end
