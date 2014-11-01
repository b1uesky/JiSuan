//
//  Calculator.h
//  JiSuan
//
//  Created by Jeremy_Luo on 11/1/14.
//  Copyright (c) 2014 JiSuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "Parse.h"

@interface Calculator : NSObject

+ (NSString *) calculate: (NSString *)s;
-(void)calculateService: (NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error;


@end
