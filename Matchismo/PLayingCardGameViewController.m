//
//  PLayingCardGameViewController.m
//  Matchismo
//
//  Created by Haluk Isik on 20/03/14.
//  Copyright (c) 2014 <>< ObjectCoder. All rights reserved.
//

#import "PLayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@implementation PLayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
