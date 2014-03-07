//
//  SecondViewController.m
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize twitterFullName, twitterUserName, twitterDetail, twitterFollowed, twitterFollowing, twitterIconPic;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self->sFullName.text = twitterFullName;
    self->sUserName.text = twitterUserName;
    self->sDetail.text = twitterDetail;
    self->sFollowed.text = twitterFollowed;
    self->sFollowing.text = twitterFollowing;
    self->sUserIcon.image = twitterIconPic;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
