//
//  storeinfo.m
//  MTGcards
//
//  Created by CCT on 9/13/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "storeinfo.h"

@implementation storeinfo

@synthesize sharedArray;
@synthesize indexer;
@synthesize sharedImages;
@synthesize sharedCost;

+ (storeinfo *) sharedInstance {
    static storeinfo *myInfo = nil;
    if(myInfo == nil)
    {
        myInfo = [[[self class] alloc] init];
        myInfo.sharedArray = [NSArray arrayWithObject:@"Test"];
    }
    return myInfo;
}

+(storeinfo *) imgs {
    static storeinfo *myImgs = nil;
    if(myImgs == nil)
    {
        myImgs = [[[self class] alloc] init];
        myImgs.sharedImages = [NSArray arrayWithObject:@"Image"];
    }
    return myImgs;
}

+(storeinfo *) cost {
    static storeinfo *c = nil;
    if(c == nil)
    {
        c = [[[self class] alloc] init];
        c.sharedCost = [NSArray arrayWithObject:@"Cost"];
    }
    return c;
}

+ (storeinfo *) sharedIndexer {
    static storeinfo *ind = nil;
        if(ind == nil)
        {
            ind = [[super allocWithZone:NULL] init];
        }
    
    return ind;
}

@end
