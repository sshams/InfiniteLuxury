//
//  QuestionVO.h
//  Parliament
//
//  Created by Saad Shams on 8/4/10.
//  Copyright 2010 Leo Burnett. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuestionVO : NSObject {
	NSString *question;
	NSMutableArray *options; //each object is again an array, with option text at index 0 and answer at index 1
}

@property (nonatomic, retain) NSString *question;
@property (nonatomic, copy) NSMutableArray *options;

@end
