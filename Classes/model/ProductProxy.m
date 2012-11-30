//
//  ProductProxy.m
//  Parliament
//
//  Created by Saad Shams on 8/4/10.
//  All rights reserved.
//

#import "ProductProxy.h"
#import "XMLParser.h"
#import "ApplicationFacade.h"

@implementation ProductProxy

+(NSString *)NAME {
	return @"ProductProxy";
}

-(void) initializeProxy {
	[super initializeProxy];
	self.proxyName = [ProductProxy NAME];

	NSString *path = [[NSBundle mainBundle] pathForResource:@"product" ofType:@"xml"];
	productParser = [[XMLParser alloc] initWithFilePath:path];
}

-(void)load {
	self.data = [[productParser getQuestionVOs:((ApplicationFacade *)facade).language] retain];
}

-(int)getCount {
	return [data count];
}

-(QuestionVO *)getQuestion:(int)id {
	return [((NSArray *)self.data) objectAtIndex:id];
}

-(void) dealloc {
	[productParser release];
	[super dealloc];
}

@end
