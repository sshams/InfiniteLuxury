//
//  LuxuryProxy.h
//  Parliament
//
//  Created by Saad Shams on 8/5/10.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Proxy.h"
#import "XMLParser.h"
#import "QuestionVO.h"

@interface LuxuryProxy : Proxy {
	XMLParser *luxuryParser;
}

-(void)load;
-(int)getCount;
-(QuestionVO*)getQuestion:(int)id;

@end
