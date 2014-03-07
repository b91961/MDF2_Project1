//
//  CustomCell.m
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize fullNameText, userNameText, postText, dateTimeText, userIconPic;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshCell
{
    fullName.text = fullNameText;
    userName.text = userNameText;
    post.text = postText;
    dateTime.text = dateTimeText;
    userIcon.image = userIconPic;
}

@end
