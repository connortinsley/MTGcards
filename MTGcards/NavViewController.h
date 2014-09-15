//
//  NavViewController.h
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewController;

@interface NavViewController : UINavigationController
{
    TableViewController * tvc;
}

@property (nonatomic, retain) TableViewController *tvc;

@end
