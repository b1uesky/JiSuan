//
//  ViewController.m
//  JiSuan
//
//  Created by Jeremy_Luo on 11/1/14.
//  Copyright (c) 2014 JiSuan. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    /* unit test */
    
    NSString * expression = @"rt ( 22 , sqrt ( 12.3 ) ) + ( 4.56 + 0.789 )";
    expression = @"3 + 4 * 5 ^ 1";
    NSDictionary * tree = [Parse tokenizeAndParse:expression];
    for (NSString * label in tree.allKeys)
    {
        NSLog(@"%@", label);
        NSArray * t = [tree objectForKey:label];
        for (NSDictionary * e in t)
        {
            NSLog(@"%@", [[e allKeys] objectAtIndex:0]);
        }
    }
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (NSString *)calculate: (NSString *)s
{
    return @"Hello World!";
}

-(void)calculateService: (NSPasteboard *)pboard
               userData:(NSString *)userData error:(NSString **)error{
    //Test for strings on the pasteboard.
    NSArray *classes = [NSArray arrayWithObjects:[NSString class], nil];
    NSDictionary *options = [NSDictionary dictionary];
    
    if(![pboard canReadObjectForClasses:classes options:options]){
        *error = NSLocalizedString(@"Error: couldn't calculate text.", @"pboard couldn't give string.");
        return;
    }
    
    //get and calculate string
    NSString *pboardString = [pboard stringForType:NSPasteboardTypeString];
    NSString *newString = [self calculate:pboardString];
    
    if(!newString){
        *error = NSLocalizedString(@"Error: couldn't calculate text.", @"self couldn't calculate.");
        return;
    }
    
    //write the result string onto the paste board
    [pboard clearContents];
    [pboard writeObjects:[NSArray arrayWithObject:newString]];

}

@end
