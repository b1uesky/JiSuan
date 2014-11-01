//
//  Calculator.m
//  JiSuan
//
//  Created by Jeremy_Luo on 11/1/14.
//  Copyright (c) 2014 JiSuan. All rights reserved.
//

#import "Calculator.h"

@interface Calculator()
{
    
}

@end

@implementation Calculator

-(void)calculateService: (NSPasteboard *)pboard userData:(NSString *)userData error:(NSString **)error
{
    //Test for strings on the pasteboard.
    NSArray *classes = [NSArray arrayWithObjects:[NSString class], nil];
    NSDictionary *options = [NSDictionary dictionary];
    
    if(![pboard canReadObjectForClasses:classes options:options]){
        *error = NSLocalizedString(@"Error: couldn't calculate text.", @"pboard couldn't give string.");
        return;
    }
    
    //get and calculate string
    NSString *pboardString = [pboard stringForType:NSPasteboardTypeString];
    NSString *newString = [Calculator calculate:pboardString];
    
    if(!newString){
        *error = NSLocalizedString(@"Error: couldn't calculate text.", @"self couldn't calculate.");
        return;
    }
    
    //write the result string onto the paste board
    [pboard clearContents];
    NSArray * output = @[[NSString stringWithFormat:@"%@%@%@", pboardString, @" = ", @"20"]];
    [pboard writeObjects:output];
}



+ (NSString *) calculate: (NSString *)s
{
    return @"";
    return [NSString stringWithFormat:@"%f", [Calculator evaluate: [Parse tokenizeAndParse:s]]];
}

+ (double) evaluate: (NSDictionary *)e
{
    for (NSString * operator in [[e allKeys] objectAtIndex:0])
    {
        NSArray * children = [e objectForKey:operator];
        if ([@"Plus" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return (e1 + e2);
        }
        else if ([@"Minus" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return (e1 - e2);
        }
        else if ([@"Mult" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return (e1 * e2);
        }
        else if ([@"Divide" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return (e1 / e2);
        }
        else if ([@"Mod" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return fmod(e1, e2);
        }
        else if ([@"Rt" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return pow(e1, 1.0/e2);
        }
        else if ([@"Pow" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return pow(e1, e2);
        }
        else if ([@"Max" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return fmax(e1, e2);
        }
        else if ([@"Min" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            double e2 = [Calculator evaluate:[children objectAtIndex:1]];
            return fmin(e1, e2);
        }
        else if ([@"Paren" isEqualToString:operator])
        {
            return [Calculator evaluate:[children objectAtIndex:0]];
        }
        else if ([@"Sqrt" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            return sqrt(e1);
        }
        else if ([@"Abs" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            return fabs(e1);
        }
        else if ([@"Neg" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            return -e1;
        }
        else if ([@"Ceil" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            return ceil(e1);
        }
        else if ([@"Floor" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            return floor(e1);
        }
        else if ([@"Round" isEqualToString:operator])
        {
            double e1 = [Calculator evaluate:[children objectAtIndex:0]];
            return round(e1);
        }
    }
    return MAXFLOAT;
}

@end
