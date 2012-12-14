//
//  ViewController.h
//  D2D
//
//  Created by jaya prakash rao polsani on 13/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
@interface ViewController : UIViewController<UITextFieldDelegate>{
    IBOutlet UITextField *username_text;
    IBOutlet UITextField *password_text;
    NSString *databasePath;
    UILabel *status;
    sqlite3 *LoginDB;
    
}
@property (nonatomic, retain) UITextField *username_text;
@property (nonatomic, retain) UITextField *password_text;
@property (nonatomic, retain) UIButton *login;
@property (retain, nonatomic) IBOutlet UILabel *status;
//@property (nonatomic,readwrite) FirstViewController *firstViewController;
- (IBAction)Login:(id) sender;
-(IBAction)signUp:(id)sender;


@end
