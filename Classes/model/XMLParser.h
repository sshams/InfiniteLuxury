//
//  XMLParser.h
//  Parliament
//
//  Created by Saad Shams on 8/4/10.
//  All rights reserved.
//

//#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_4_0
//@protocol NSXMLParserDelegate
//@end
//#endif

#import <Foundation/Foundation.h>
#import "QuestionVO.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
	NSString *language;
	
	NSData *xmlData;
	NSXMLParser *parser;
	
	NSMutableArray *questionVOs;
	
	QuestionVO *questionVO;
	NSMutableArray *options;
	NSArray *option;
}

@property (nonatomic, retain) NSString *language;

@property (nonatomic, retain) NSData *xmlData;
@property (nonatomic, retain) NSXMLParser *parser;

@property (nonatomic, retain) NSMutableArray *questionVOs;

@property (nonatomic, retain) QuestionVO *questionVO;
@property (nonatomic, retain) NSMutableArray *options;
@property (nonatomic, retain) NSArray *option;

- (id)initWithFilePath:(NSString *)path;
- (NSMutableArray *)getQuestionVOs:(NSString *)language;
- (void)displayQuestionVOs;

@end