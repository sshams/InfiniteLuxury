//
//  Language.h
//  Parliament
//
//  Created by Saad Shams on 8/7/10.
//  All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LanguageDelegate

-(void)setLanguage:(NSString *)newLanguage;

@end


@interface Language : UIViewController {
	id<LanguageDelegate> delegate;
}

@property(nonatomic, retain) id<LanguageDelegate> delegate;

-(IBAction)englishClick;
-(IBAction)arabicClick;

@end
