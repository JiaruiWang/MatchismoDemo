//
//  CardMatchingGame.h
//  MatchismoDemo
//
//  Created by Jerry on 5/18/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (void)chooseCardAtIndex:(NSUInteger)index matchCards:(NSUInteger)three;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSString *comment;

@end
