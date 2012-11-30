//
//  LuxuryProxy.m
//  Parliament
//
//  Created by Saad Shams on 8/5/10.
//  All rights reserved.
//

#import "LuxuryProxy.h"
#import "ApplicationFacade.h"

@implementation LuxuryProxy

+ (NSString *) NAME {
	return @"LuxuryProxy";
}

- (void)initializeProxy {
	[super initializeProxy];
	self.proxyName = [LuxuryProxy NAME];

	NSString *path = [[NSBundle mainBundle] pathForResource:@"luxury" ofType:@"xml"];
	luxuryParser = [[XMLParser alloc] initWithFilePath:path];
	
	//[self load];
}

- (void)load {
	self.data = [[luxuryParser getQuestionVOs:((ApplicationFacade *)facade).language] retain];
}

- (int)getCount {
	return [data count];
}

- (QuestionVO *)getQuestion:(int)id {
	return [((NSArray *)self.data) objectAtIndex:id];
}

- (void) dealloc {
	[luxuryParser release];
	[super dealloc];
}

@end
