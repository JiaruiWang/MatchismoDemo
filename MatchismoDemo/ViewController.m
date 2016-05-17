//
//  ViewController.m
//  MatchismoDemo
//
//  Created by Jerry on 5/15/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)touchCardButton:(UIButton *)sender
{
  [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                    forState:UIControlStateNormal];
  [sender setTitle:@"" forState:UIControlStateNormal];
}

@end
