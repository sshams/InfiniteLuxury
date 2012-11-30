//
//  Splash.h
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
//  All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SplashDelegate 

-(void)splashViewClick;

@end

@interface Splash : UIViewController {
	id<SplashDelegate> delegate;
}

@property(nonatomic, retain) id<SplashDelegate> delegate;

-(IBAction)splashClick:(id)sender;

@end
