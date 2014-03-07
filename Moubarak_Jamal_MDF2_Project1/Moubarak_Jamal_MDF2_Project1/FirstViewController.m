//
//  FirstViewController.m
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import "FirstViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "CustomCell.h"
#import "DetailViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    //UINib *customCellNib = [UINib nibWithNibName:@"MyCellView" bundle:nil];
    //if (customCellNib != nil)
    //{
    //    [myTableView registerNib:customCellNib forCellReuseIdentifier:@"MyCell"];
    //}
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted)
                {
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil)
                    {
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            NSString *userTimeString = [NSString stringWithFormat:@"%@?%@&%@", @"https://api.twitter.com/1.1/statuses/user_timeline.json", @"screen_name=jamaleskatech", @"count=20"];
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeString] parameters:nil];
                            if (request != nil)
                            {
                                [request setAccount:currentAccount];
                                
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200)
                                    {
                                        twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        if (twitterFeed != nil)
                                        {
                                            [myTableView reloadData];
                                            NSLog(@"%@", [twitterFeed description]);
                                            //NSLog(@"%@", [[twitterFeed objectAtIndex:0] description]);
                                        }
                                    }
                                }];
                            }
                        }
                        //NSLog(@"%@", [twitterAccounts description]);
                    }
                }
                else
                {
                    NSLog(@"User did not grant access");
                }
            }];
        }
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (twitterFeed != nil)
    {
        //set number of rows to the amount of objects in the array.
        return [twitterFeed count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell != nil)
    {
        NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        NSDictionary *userDictionary = [tweetDictionary objectForKey:@"user"];
        
        cell.postText = [tweetDictionary valueForKey:@"text"];
        image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[userDictionary valueForKey:@"profile_image_url_https"]]];
        cell.userIconPic = [[UIImage alloc] initWithData:image];
        cell.fullNameText = [userDictionary valueForKey:@"name"];
        userString = [NSString stringWithFormat:@"@%@", [userDictionary valueForKey:@"screen_name"]];
        cell.userNameText = userString;
        cell.dateTimeText = [userDictionary valueForKey:@"created_at"];

        [cell refreshCell];
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
    NSDictionary *userDictionary = [tweetDictionary objectForKey:@"user"];
    
    detailPost = [tweetDictionary valueForKey:@"text"];
    detailIconPic = [[UIImage alloc] initWithData:image];
    detailFullName = [userDictionary valueForKey:@"name"];
    detailUserName = userString;
    detailDateTime = [userDictionary valueForKey:@"created_at"];
}

-(IBAction)onRefresh:(id)sender
{
    //[self reloadPosts];
}

-(IBAction)onProfile:(id)sender
{
    
}

// Unwind Button
-(IBAction)done:(UIStoryboardSegue*)segue
{
    
}

@end
