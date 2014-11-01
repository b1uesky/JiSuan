//
//  Parse.h
//  JiSuan
//
//  Created by Jeremy_Luo on 11/1/14.
//  Copyright (c) 2014 JiSuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parse : NSObject

+ (NSDictionary *) tokenizeAndParse: (NSString *)s;

@end
