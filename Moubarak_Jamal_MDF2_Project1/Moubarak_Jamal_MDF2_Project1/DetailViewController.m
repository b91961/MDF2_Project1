//
//  DetailViewController.m
//  Moubarak_Jamal_MDF2_Project1
//
//  Created by Jamal Moubarak on 3/6/14.
//  Copyright (c) 2014 Jamal Moubarak. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize dFullNameText, dUserNameText, dPostText, dDateTimeText, dUserIconPic;
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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    dFullName.text = dFullNameText;
    dUserName.text = dUserNameText;
    dPost.text = dPostText;
    dDateTime.text = dDateTimeText;
    dUserIcon.image = dUserIconPic;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
