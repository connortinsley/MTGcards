//
//  storeinfo.h
//  MTGcards
//
//  Created by CCT on 9/13/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface storeinfo : NSObject

@property (nonatomic) NSArray *sharedArray;
+ (storeinfo *) sharedInstance;

@property (nonatomic, assign) int indexer;
+ (storeinfo *) sharedIndexer;

@property (nonatomic) NSArray *sharedImages;
+ (storeinfo *) imgs;

@property (nonatomic) NSArray *sharedCost;
+(storeinfo *) cost;

@end

