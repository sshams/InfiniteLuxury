//
//  ParliamentAppDelegate_iPad.h
//  Parliament
//
//  Created by Saad Shams on 12/30/10.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParliamentAppDelegate.h"
#import "Parliament.h"

@interface ParliamentAppDelegate_iPad : ParliamentAppDelegate {
    Parliament *parliament;
}

@property (nonatomic, retain) Parliament *parliament;

@end
