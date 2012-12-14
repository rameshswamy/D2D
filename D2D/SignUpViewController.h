//
//  SignUpViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 13/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import <QuartzCore/QuartzCore.h>

@interface SignUpViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
    IBOutlet UITextField *FirstName_text;
    IBOutlet UITextField *LastName_text;
    IBOutlet UITextField *Email_text;
    IBOutlet UITextField *Password_text;
    IBOutlet UITextField *Phone_text;
    IBOutlet UITextView *Address_text;
    
    
    NSString *databasePath;
    UILabel *status_label;
    sqlite3 *LoginDB;
}
@property (nonatomic, retain) UITextField *FirstName_text;
@property (nonatomic, retain) UITextField *LastName_text;
@property (nonatomic, retain) UITextField *Email_text;
@property (nonatomic, retain) UITextField *Password_text;
@property (nonatomic, retain) UITextField *Phone_text;
@property (nonatomic, retain) UITextView *Address_text;

@property (nonatomic, retain) UIButton *login;
@property (retain, nonatomic) IBOutlet UILabel *status_label;

-(IBAction)signUp:(id)sender;


@end
