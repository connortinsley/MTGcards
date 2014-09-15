//
//  CellViewController.m
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "CellViewController.h"
#import "TableViewController.h"
#import "storeinfo.h"

@interface CellViewController ()

@end

@implementation CellViewController

@synthesize names;
@synthesize images;
@synthesize prices;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fire.jpg"]];
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    myButton.frame = CGRectMake(150,410,160,40);
    [myButton setTitle:@"Back" forState:UIControlStateNormal];
    [myButton addTarget:self action:@selector(ButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myButton];
    
    int n = [storeinfo sharedIndexer].indexer;
    
    images = [storeinfo imgs].sharedImages;
    prices = [storeinfo cost].sharedCost;
    
    NSURL *turl = [NSURL URLWithString:images[n][0]];
    NSData *udata = [NSData dataWithContentsOfURL:turl];
  
    
    fullSize = [[UIImageView alloc] initWithImage:[UIImage imageWithData:udata]];
    

    [fullSize setFrame:CGRectMake(50, 100, 200, 300)];
    fullSize.userInteractionEnabled = YES;
    [self.view addSubview:fullSize];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,420,450,15)];
    NSString *label1 = @"Median Price: ";
    NSString *label3;
    
    NSString *label2 = prices[n][0];
    if(label2 == (id)[NSNull null] ){
        label3 = @"Unknown";
    }
    else label3 = label2;
    
    NSString *theString = [NSString stringWithFormat:@"%@ %@",label1, label3];
    priceLabel.text = theString;
  
    [self.view addSubview:priceLabel];
    
    self.names = [[UILabel alloc] initWithFrame:CGRectMake(10,30,300,100)];
    
    self.names.text = [storeinfo sharedInstance].sharedArray[n];
    self.names.textColor = [UIColor whiteColor];
    
    [self.view addSubview:self.names];
    
    [self.names release];
    [priceLabel release];
    [fullSize release];
   
}

-(void)ButtonClicked {
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
