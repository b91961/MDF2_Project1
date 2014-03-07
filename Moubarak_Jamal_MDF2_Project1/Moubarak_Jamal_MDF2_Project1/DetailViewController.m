//
//  DetailViewController.m
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import "DetailViewController.h"
#import "CustomCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize twitterFullName, twitterUserName, twitterPost, twitterDateTime, twitterIconPic;
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
    self->dFullName.text = twitterFullName;
    self->dUserName.text = twitterUserName;
    self->dPost.text = twitterPost;
    self->dDateTime.text = twitterDateTime;
    self->dUserIcon.image = twitterIconPic;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
