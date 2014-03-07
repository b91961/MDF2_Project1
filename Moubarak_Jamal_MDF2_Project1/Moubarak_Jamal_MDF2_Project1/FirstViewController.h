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
    NSString *userString;
    NSString *detailPost;
    NSString *detailFullName;
    NSString *detailUserName;
    NSString *detailDateTime;
    UIImage *detailIconPic;
}

-(IBAction)onRefresh:(id)sender;
-(IBAction)onProfile:(id)sender;

@end
