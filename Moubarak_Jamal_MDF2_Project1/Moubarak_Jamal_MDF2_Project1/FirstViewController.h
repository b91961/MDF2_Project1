//
//  FirstViewController.h
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    
    NSArray *twitterFeed;
    NSData *image;
    NSString *postString;
    NSString *userString;
    NSString *nameString;
    NSString *detailString;
    NSString *detailPost;
    NSString *followedString;
    NSString *followingString;
    NSString *twitterPost;
    NSString *twitterFullName;
    NSString *twitterUserName;
    NSString *twitterDetail;
    NSString *twitterFollowed;
    NSString *twitterFollowing;
    NSString *twitterDateTime;
    UIImage *twitterIconPic;
    NSString *dateStr;
    UIAlertView *alert;
    UIActivityIndicatorView *indicator;
}

-(IBAction)onRefresh:(id)sender;
-(IBAction)onProfile:(id)sender;
-(IBAction)onPost:(id)sender;

@end
