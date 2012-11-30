//
//  Sorry.h
//  Parliament
//
//  Created by Saad Shams on 8/8/10.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
	
@protocol SorryDelegate

- (void) restart;

@end



@interface Sorry : UIViewController {
	id <SorryDelegate>quiz;
}

@property (nonatomic, retain) id <SorryDelegate>quiz;

- (IBAction)restart:(id)sender;

@end
