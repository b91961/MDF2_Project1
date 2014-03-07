//
//  DetailViewController.h
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface DetailViewController : UIViewController

{
    IBOutlet UILabel *dFullName;
    IBOutlet UILabel *dUserName;
    IBOutlet UILabel *dPost;
    IBOutlet UILabel *dDateTime;
    IBOutlet UIImageView *dUserIcon;
}

@property (nonatomic, strong) NSString *twitterFullName;
@property (nonatomic, strong) NSString *twitterUserName;
@property (nonatomic, strong) NSString *twitterPost;
@property (nonatomic, strong) NSString *twitterDateTime;
@property (nonatomic, strong) UIImage *twitterIconPic;

@end
