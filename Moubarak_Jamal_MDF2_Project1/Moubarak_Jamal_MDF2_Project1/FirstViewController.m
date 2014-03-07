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
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,
    ^{
        [self loadTwitter];
    });
}

- (void)loadTwitter
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            alert = [[UIAlertView alloc]
                     initWithTitle:@"Loading Tweets"
                     message:nil
                     delegate:nil
                     cancelButtonTitle:nil
                     otherButtonTitles:nil];
            indicator = [[UIActivityIndicatorView alloc]
                         initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            indicator.center = CGPointMake(160, 300);
            indicator.hidesWhenStopped = YES;
            [self.view addSubview:indicator];
            [indicator startAnimating];
            [alert show];
            
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
                                            //NSLog(@"%@", [twitterFeed description]);
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
}
-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row)
    {
        //end of loading
        [indicator stopAnimating];
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [myTableView reloadData];
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
        
        //postString = [NSString stringWithFormat:@"%@", [tweetDictionary valueForKey:@"text"]];
        
        cell.postText = [tweetDictionary valueForKey:@"text"];
        
        NSDictionary *userDictionary = [tweetDictionary objectForKey:@"user"];
        if (userDictionary != nil)
        {
            image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[userDictionary valueForKey:@"profile_image_url_https"]]];
            nameString = [NSString stringWithFormat:@"%@", [userDictionary valueForKey:@"name"]];
            userString = [NSString stringWithFormat:@"@%@", [userDictionary valueForKey:@"screen_name"]];
            detailString = [NSString stringWithFormat:@"%@", [userDictionary valueForKey:@"description"]];
            followedString = [NSString stringWithFormat:@"%@", [userDictionary valueForKey:@"followers_count"]];
            followingString = [NSString stringWithFormat:@"%@", [userDictionary valueForKey:@"friends_count"]];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
            NSDate *date = [df dateFromString:[tweetDictionary valueForKey:@"created_at"]];
            [df setDateFormat:@"eee, MMM dd yyyy h:mm a"];
            dateStr = [df stringFromDate:date];
            
            cell.userIconPic = [[UIImage alloc] initWithData:image];
            cell.fullNameText = nameString;
            cell.userNameText = userString;
            cell.dateTimeText = dateStr;
        }
        [cell refreshCell];
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
    detailPost = [tweetDictionary valueForKey:@"text"];
    
    [self performSegueWithIdentifier:@"detail" sender:self];
}

-(IBAction)onRefresh:(id)sender
{
    [self loadTwitter];
}

-(IBAction)onPost:(id)sender
{
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if (slComposeViewController != nil)
    {
        [slComposeViewController setInitialText:@"Posted from Jamal's Twitter app"];
        
        [self presentViewController:slComposeViewController animated:true completion:nil];
    }
}

-(IBAction)onProfile:(id)sender
{
    [self performSegueWithIdentifier:@"second" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        DetailViewController *destination = segue.destinationViewController;
        destination.twitterPost = detailPost;
        destination.twitterIconPic = [[UIImage alloc] initWithData:image];
        destination.twitterFullName = nameString;
        destination.twitterUserName = userString;
        destination.twitterDateTime = dateStr;
    }
    else if ([segue.identifier isEqualToString:@"second"])
    {
        SecondViewController *destination = segue.destinationViewController;
        destination.twitterIconPic = [[UIImage alloc] initWithData:image];
        destination.twitterFullName = nameString;
        destination.twitterUserName = userString;
        destination.twitterDetail = detailString;
        destination.twitterFollowed = followedString;
        destination.twitterFollowing = followingString;
    }
}

// Unwind Button
-(IBAction)done:(UIStoryboardSegue*)segue
{
    
}

@end
