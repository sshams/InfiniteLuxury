//
//  ProductProxy.h
//  Parliament
//
//  Created by Saad Shams on 8/4/10.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Proxy.h"
#import "XMLParser.h"
#import "QuestionVO.h"

@interface ProductProxy : Proxy {
	XMLParser *productParser;
}

-(void)load;
-(int)getCount;
-(QuestionVO *)getQuestion:(int)id;


@end
