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
    /*
    NSString * expression = @"rt ( 22 , sqrt ( 12.3 ) ) + ( 4.56 + 0.789 )";
    expression = @"3 + 4 * 5 ";
    NSDictionary * tree = [Parse tokenizeAndParse:expression];
    NSLog(@"%@",[Calculator calculate:expression]);
    */
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
