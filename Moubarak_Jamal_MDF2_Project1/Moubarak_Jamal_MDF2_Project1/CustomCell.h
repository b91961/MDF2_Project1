//
//  CustomCell.h
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UILabel *fullName;
    IBOutlet UILabel *userName;
    IBOutlet UILabel *post;
    IBOutlet UILabel *dateTime;
    IBOutlet UIImageView *userIcon;
}

-(void)refreshCell;

@property (nonatomic, strong) NSString *fullNameText;
@property (nonatomic, strong) NSString *userNameText;
@property (nonatomic, strong) NSString *postText;
@property (nonatomic, strong) NSString *dateTimeText;
@property (nonatomic, strong) UIImage *userIconPic;

@end
