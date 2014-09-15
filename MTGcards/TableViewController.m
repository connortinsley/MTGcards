//
//  TableViewController.m
//  MTGcards
//
//  Created by CCT on 9/8/14.
//  Copyright (c) 2014 CONNOR TINSLEY. All rights reserved.
//

#import "TableViewController.h"
#import "NavViewController.h"
#import "CellViewController.h"
#import "storeinfo.h"

@interface TableViewController ()

@end

@implementation TableViewController


NSArray *tableData;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.opaque = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];   //need to do this to register class
    
    int i = 0;
    int ii = 0;
    NSMutableArray * nameArray=[[NSMutableArray alloc]init];
    NSMutableArray * priceArray=[[NSMutableArray alloc]init];
    NSMutableArray * imageArray=[[NSMutableArray alloc]init];
    [nameArray retain];
    [priceArray retain];
    [imageArray retain];
    
    for(int s = 2; s <= 100; s=s+1)
    {
        NSString *str = [NSString stringWithFormat: @"https://api.deckbrew.com/mtg/cards?page=%d", s];
        
        NSURL *rURL = [NSURL URLWithString:str];
        NSData *data = [NSData dataWithContentsOfURL:rURL];
        NSError *error;
        
        //NSMutableDictionary *json = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &error];
        
        NSArray *tdata = [json valueForKeyPath:@"editions.image_url"];
        NSArray *pdata0 = [json valueForKeyPath:@"editions.price.median"];
        
        NSMutableArray *pdata = [[NSMutableArray alloc]init];
        
        for(NSArray *item1 in pdata0)
        {
            if(item1[0] == (id) [NSNull null])
            {
                NSString *dstring = @"Unknown";
                NSArray *darray = [NSArray arrayWithObjects: dstring, nil];
                [pdata addObject:darray];
                
            }
            else
            {
                CGFloat money = ([item1[0] integerValue])*.01;
                NSNumber * monies = [NSNumber numberWithFloat:money];
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
                NSString *mstring = [formatter stringFromNumber:monies];
                NSArray *marray = [NSArray arrayWithObjects: mstring, nil];
                [pdata addObject:marray];
                [formatter release];
            }
            
        }
        
        for(NSDictionary *dict in json)
        {
            [nameArray addObject:[dict valueForKey:@"name"]];
            imageArray[i] = tdata[ii];
            priceArray[i] = pdata[ii];
            ii++;
            i++;
        }
        ii=0;
      
        [pdata release];
    }
        
    tableData = nameArray;
    
    [storeinfo imgs].sharedImages = imageArray;
    [storeinfo sharedInstance].sharedArray = nameArray;
    [storeinfo cost].sharedCost = priceArray;
    
    [imageArray release];
    [nameArray release];
    [priceArray release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *tabitem = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tabitem forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tabitem];
    }
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [storeinfo sharedIndexer].indexer = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CellViewController *Cellv = [[CellViewController alloc] initWithNibName:@"CellViewController" bundle:nil];
    [self.navigationController pushViewController:Cellv animated:YES];
    [Cellv release];

}

//- (void)tableView:(UITableView *)tableViewaccessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
//{
        
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:/ forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
