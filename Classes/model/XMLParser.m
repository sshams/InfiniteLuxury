//
//  XMLParser.m
//  Parliament
//
//  Created by Saad Shams on 8/4/10.
//  All rights reserved.
//

#import "XMLParser.h"


@implementation XMLParser

@synthesize language;
@synthesize xmlData, parser;
@synthesize questionVOs;
@synthesize questionVO, options, option;

-(id)initWithFilePath:(NSString *)path {
	
	xmlData = [[NSData alloc] initWithContentsOfFile:path];
	
	parser = [[NSXMLParser alloc] initWithData:xmlData];
	[parser setDelegate:self];

	return self;
}

-(NSMutableArray *)getQuestionVOs:(NSString *)currentLanguage {

	self.language = currentLanguage;
	[parser parse];
	
	[questionVOs autorelease];

	return questionVOs;
}

-(void) parserDidStartDocument:(NSXMLParser *)parser {
	questionVOs = [[NSMutableArray alloc] init];
}

-(void) parserDidEndDocument:(NSXMLParser *)parser {
	//[self displayQuestionVOs];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	
	if([elementName isEqualToString:@"block"]){
		questionVO = [[QuestionVO alloc] init];
	}
	
	if([elementName isEqualToString:@"question"]){
		questionVO.question = [[NSString alloc] initWithFormat:@"%@", (NSString *)[attributeDict objectForKey: [[NSString alloc] initWithFormat:@"%@:content", self.language]]];
	}
	
	if([elementName isEqualToString:@"options"]){
		options = [[NSMutableArray alloc] init];
	}
	
	if([elementName isEqualToString:@"option"]){
		NSString *content = (NSString *)[attributeDict objectForKey:[[NSString alloc] initWithFormat:@"%@:content", self.language]];
		NSNumber *answer = [NSNumber numberWithBool:[[attributeDict objectForKey:@"answer"] boolValue]];
		
		option = [[NSArray alloc] initWithObjects: content, answer, nil];
		[options addObject:option];
		[option release];
	}
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"options"]){
		questionVO.options = options; //try init with array
	}
	
	if([elementName isEqualToString:@"block"]){
		[questionVOs addObject:questionVO];
		[questionVO release];
	}
	
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
}

-(void)displayQuestionVOs {
	for(int i=0; i<[questionVOs count]; i++){
		QuestionVO *qVO = [questionVOs objectAtIndex:i];
		NSLog(@"%@", [qVO question]);
		for(int j=0; j<[[qVO options] count]; j++){
			NSArray *opts = [qVO options];
			NSArray *opt = [opts objectAtIndex:j];
			NSLog(@"%@, %@", [opt objectAtIndex:0], [opt objectAtIndex:1]);
		}
	}
}

-(void)dealloc {
	[xmlData release];
	[parser release];
	
	[super dealloc];
}

@end
