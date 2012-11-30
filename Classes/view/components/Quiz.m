    //
//  Quiz.m
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
//  All rights reserved.
//

#import "Quiz.h"
#import "Congratulations.h"


@implementation Quiz

@synthesize delegate, question, questionVOs, totalAsked, trueAnswers, language, device, result;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (void)loadQuiz:(NSArray *)selectedQuestionVOs language:(NSString *)currentLanguage device:(NSString *)currentDevice {
	self.questionVOs = selectedQuestionVOs;
	self.language = currentLanguage;
	self.device = currentDevice;
	
	[self showQuestion];
}

- (void)showQuestion {
	question = [[Question alloc] initWithNibName:[[NSString alloc] initWithFormat:@"Question_%@_%@", self.language, self.device] bundle:[NSBundle mainBundle]];
	question.questionVO = [questionVOs objectAtIndex:totalAsked];
	question.quiz = self;
	
	[self.view addSubview:question.view];
}

- (void)nextQuestion:(BOOL)lastResult {
	totalAsked++;
	[question.view removeFromSuperview];
	[question release];
	
	if(lastResult){
		trueAnswers++;
	}
	
	if(totalAsked < 4){
		[self showQuestion];
	} else {
		[self showResult];
	}

}

- (void)showResult {
	if (trueAnswers == 4) {
		result = [[Congratulations alloc] initWithNibName:[[NSString alloc] initWithFormat:@"Congratulations_%@_%@", self.language, self.device] bundle:[NSBundle mainBundle]];
		((Congratulations *)result).quiz = self;
		[self.view addSubview:result.view];
	} else {
		result = [[Sorry alloc] initWithNibName:[[NSString alloc] initWithFormat:@"Sorry_%@_%@", self.language, self.device] bundle:[NSBundle mainBundle]];
		((Sorry *)result).quiz = self;
		[self.view addSubview:result.view];
	}
	
	[result.view setAlpha:0];
	[UIView beginAnimations:@"alpha1" context:nil];
	[UIView setAnimationDuration:1.0];
	[result.view setAlpha:1];
	[UIView commitAnimations];

}

- (void)restart {
	[result.view removeFromSuperview];
	[result release];
	
	totalAsked = 0;
	trueAnswers = 0;
	[delegate restartQuiz];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	question = nil;
	result = nil;
    [super dealloc];
}


@end
