//
//  AppDelegate.h
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavViewController.h"

@class NavViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NavViewController *navNC;
}

@property (nonatomic, retain) NavViewController *navNC;
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableString *MTGname;
@property (nonatomic) NSInteger rowNum;

@end
