    //
//  Parliament.m
//  Parliament
//
//  Created by Saad Shams on 8/6/10.
//  All rights reserved.
//

#import "Parliament.h"


@implementation Parliament

@synthesize device, splash, language, quiz;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil device:(NSString *)currentDevice {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.device = currentDevice;
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	splash = [[Splash alloc] initWithNibName:[@"Splash_" stringByAppendingString:device] bundle:[NSBundle mainBundle]];
	language = [[Language alloc] initWithNibName:[@"Language_" stringByAppendingString:device] bundle:[NSBundle mainBundle]];
	quiz = [[Quiz alloc] initWithNibName:[@"Quiz_" stringByAppendingString:device] bundle:[NSBundle mainBundle]];
	
	[self showSplash];
}

-(void)showSplash {
	[self.view addSubview:splash.view];
	
//	[splash.view setAlpha:0];
//	[UIView beginAnimations:@"alpha1" context:nil];
//	[UIView setAnimationDuration:1.0];
//	[splash.view setAlpha:1];
//	[UIView commitAnimations];
}

-(void)showLanguage {
	[splash.view removeFromSuperview];
	[self.view addSubview:language.view];
	
	[language.view setAlpha:0];
	[UIView beginAnimations:@"alpha1" context:nil];
	[UIView setAnimationDuration:1.0];
	[language.view setAlpha:1];
	[UIView commitAnimations];
}

-(void)showQuiz {
	[language.view removeFromSuperview];
	[self.view addSubview:quiz.view];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	return interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
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
	[splash release];
	[language release];
	[quiz release];
	
	splash = nil;
	language = nil;
	quiz = nil;
    [super dealloc];
}


@end
