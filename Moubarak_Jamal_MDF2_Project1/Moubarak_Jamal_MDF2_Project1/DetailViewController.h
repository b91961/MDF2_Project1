//
//  DetailViewController.h
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

{
    IBOutlet UILabel *dFullName;
    IBOutlet UILabel *dUserName;
    IBOutlet UILabel *dPost;
    IBOutlet UILabel *dDateTime;
    IBOutlet UIImageView *dUserIcon;
}

@property (nonatomic, strong) NSString *dFullNameText;
@property (nonatomic, strong) NSString *dUserNameText;
@property (nonatomic, strong) NSString *dPostText;
@property (nonatomic, strong) NSString *dDateTimeText;
@property (nonatomic, strong) UIImage *dUserIconPic;

@end
