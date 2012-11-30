//
//  Congratulations.h
//  Parliament
//
//  Created by Saad Shams on 8/8/10.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CongratulationsDelegate

-(void) restart;

@end


@interface Congratulations : UIViewController {
	id <CongratulationsDelegate>quiz;
}

@property (nonatomic, retain) id <CongratulationsDelegate>quiz;

- (IBAction)restartClick:(id)sender;

@end
