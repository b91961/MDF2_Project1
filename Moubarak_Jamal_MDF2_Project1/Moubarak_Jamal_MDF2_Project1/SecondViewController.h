//
//  SecondViewController.h
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    IBOutlet UILabel *sFullName;
    IBOutlet UILabel *sUserName;
    IBOutlet UILabel *sDetail;
    IBOutlet UILabel *sFollowed;
    IBOutlet UILabel *sFollowing;
    IBOutlet UIImageView *sUserIcon;
}

@property (nonatomic, strong) NSString *twitterFullName;
@property (nonatomic, strong) NSString *twitterUserName;
@property (nonatomic, strong) NSString *twitterDetail;
@property (nonatomic, strong) NSString *twitterFollowed;
@property (nonatomic, strong) NSString *twitterFollowing;
@property (nonatomic, strong) UIImage *twitterIconPic;

@end
