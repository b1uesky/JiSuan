//
//  Calculator.m
//  JiSuan
//
//  Created by Jeremy_Luo on 11/1/14.
//  Copyright (c) 2014 JiSuan. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator


+ (NSString *) calculate: (NSString *)s
{
    return nil;
}

+ (NSDictionary *) tokenizeAndParse: (NSString *)s
{
    NSMutableArray * tokens = [Calculator tokenize:s];
    
    NSArray * temp = [Calculator expression:tokens atTop:true];
    if (temp)
    {
        return [temp objectAtIndex:0];
    }
    return nil;
}

+ (NSMutableArray *) tokenize: (NSString *)s
{
    NSString * separateString = @" "; //@"+-*/^%(),";
    NSCharacterSet * separators = [NSCharacterSet characterSetWithCharactersInString: separateString];
    NSMutableArray * tokens = [[NSMutableArray alloc] initWithArray:
                               [s componentsSeparatedByCharactersInSet:separators]];
    /*
     for (int i = 0; i < [tokens count]; i++)
     {
     NSString * token = [tokens objectAtIndex:i];
     NSLog(token);
     }
     */
    return tokens;
}


+ (NSArray *) expression: (NSMutableArray *)tmp atTop: (BOOL)top
{
    NSMutableArray * tokens = [[NSMutableArray alloc] initWithArray:tmp copyItems:YES];;
    
    NSArray * temp = [Calculator leftExpression:tokens atTop:false];
    
    // parse left correctly
    if (temp)
    {
        NSDictionary * tree1 = [temp objectAtIndex:0];
        NSMutableArray * tokens = [temp objectAtIndex:1];
        
        // for +
        if ([tokens count] > 0 && [@"+" isEqualToString: [tokens objectAtIndex:0]])
        {
            [tokens removeObjectAtIndex:0];
            temp = [Calculator expression:tokens atTop:false];
            if (temp)
            {
                NSDictionary * tree2 = [temp objectAtIndex:0];
                tokens = [temp objectAtIndex:1];
                return @[ @{@"Plus" : @[tree1, tree2]},
                          tokens];
            }
        }
        
        else
        {
            return temp;
        }
    }
    
    
    return nil;
}

+ (NSArray *) leftExpression: (NSMutableArray *)tmp atTop: (BOOL)top
{
    // for number
    NSMutableArray * tokens = [[NSMutableArray alloc] initWithArray:tmp copyItems:YES];;
    if ([tokens count] > 0 && [Calculator isNumber:[tokens objectAtIndex:0]])
    {
        double number = [[tokens objectAtIndex:0] doubleValue];
        [tokens removeObjectAtIndex:0];
        if (!top || [tokens count] == 0)
        {
             return @[ @{@"Number" : @[[NSNumber numberWithDouble:number]]},
                            tokens];
        }
    }
    
    // for (exp)
    tokens = [[NSMutableArray alloc] initWithArray:tmp copyItems:YES];;
    if ([@"(" isEqualToString: [tokens objectAtIndex:0]])
    {
        [tokens removeObjectAtIndex:0];
        NSArray * temp = [Calculator expression:tokens atTop:false];
        if (temp)
        {
            NSDictionary * tree = [temp objectAtIndex:0];
            tokens = [temp objectAtIndex:1];
            if ([tokens count] > 0 && [@")" isEqualToString: [tokens objectAtIndex:0]])
            {
                [tokens removeObjectAtIndex:0];
                if (!top || [tokens count] == 0)
                {
                    return @[ @{@"Paren" : tree},
                              tokens ];
                }
            }
        }
    }
    
    return nil;
}

+ (BOOL) isNumber: (NSString *) s
{
    NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^(-((0|[1-9][0-9]*)\.?[0-9]+)|((0|[1-9][0-9]*)\.?[0-9]+))$'"];
    if([numberPredicate evaluateWithObject:s])
        return true;
    return false;
}

@end
