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

+ (NSString *) calculate: (NSString *)s
{
    return nil;
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
