//
//  Card.m
//  MatchismoDemo
//
//  Created by Jerry on 5/16/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
  int score = 0;
  
  for (Card *card in otherCards) {
    if ([card.contents isEqualToString:self.contents]) {
      score = 1;
    }
  }
  return score;
}

@end
