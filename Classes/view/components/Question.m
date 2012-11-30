    //
//  Question.m
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
//  All rights reserved.
//

#import "Question.h"


@implementation Question

@synthesize quiz;
@synthesize question, option0, option1, option2, option3, button0, button1, button2, button3, questionVO, options, buttons;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self transitionIn];
		
	[question setText:[[NSString alloc] initWithFormat:@"%@", (NSString *)questionVO.question]];
	question.textAlignment=UITextAlignmentCenter;
	
	options = [[NSArray alloc] initWithObjects:option0, option1, option2, option3, nil];
	buttons = [[NSArray alloc] initWithObjects:button0, button1, button2, button3, nil];
		
	for (int i=0; i<4; i++) {
		[[options objectAtIndex:i] setText:[[questionVO.options objectAtIndex:i] objectAtIndex:0]];
		[[buttons objectAtIndex:i] addTarget:self action:@selector(toggle:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	return;
}

-(void)transitionIn {
	[self.view setAlpha:0];
	[UIView beginAnimations:@"alpha1" context:nil];
	[UIView setAnimationDuration:1.0];
	[self.view setAlpha:1];
	[UIView commitAnimations];	
}

- (void)transitionOut {
	[UIView beginAnimations:@"alpha0" context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	[self.view setAlpha:0];
	[UIView commitAnimations];
}


- (IBAction)toggle:(id)sender{	
	if ([sender isSelected]) {
		[((UIButton *)sender) setEnabled:NO];
		[self checkAnswer:sender];
	} else {
		for(int i=0; i<4; i++){
			((UIButton *)([buttons objectAtIndex:i])).selected = FALSE;
		}
		((UIButton *)sender).selected = TRUE;
	}
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	[quiz nextQuestion:answer];
}

- (void)checkAnswer:(UIButton *)selected {
	answer = FALSE;
	for (int i=0; i<4; i++) {
		if ([buttons objectAtIndex:i] == selected && [[[[questionVO options] objectAtIndex:i] objectAtIndex:1] boolValue] == true) {
			answer = TRUE;
		}
	}
	[self transitionOut];
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
	[options release];
	[buttons release];
    [super dealloc];
}


@end
