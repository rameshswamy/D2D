//
//  WelcomeViewController.m
//  D2D
//
//  Created by Shankar Dabbiru on 14/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "WelcomeViewController.h"
#import

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
@synthesize imageView;
@synthesize searchBar;
@synthesize imagesArray;

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
    
    self.navigationItem.title=@"D2D";
    self.navigationController.navigationBar.tintColor=[UIColor blackColor];
    imagesArray = [[NSMutableArray alloc] init];
        // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    for (int i=1; i<=4; i++) {
        [imagesArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"image%d.png",i]]];
    }
    
    imageView.animationImages = imagesArray;
    imageView.animationDuration = 5;
    
    [imageView startAnimating] ;

}
-(void)viewWillDisappear:(BOOL)animated
{
    [imageView stopAnimating] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
