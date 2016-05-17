//
//  PlayingCard.h
//  MatchismoDemo
//
//  Created by Jerry on 5/16/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
