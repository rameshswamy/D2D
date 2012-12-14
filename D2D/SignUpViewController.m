//
//  SignUpViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 13/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize FirstName_text,LastName_text,Email_text,Password_text,Phone_text, Address_text, status_label;

-(IBAction)signUp:(id)sender
{
    sqlite3_stmt *statement;
    
    const char *dbpath = [databasePath UTF8String];
    
    [FirstName_text resignFirstResponder];
    [LastName_text resignFirstResponder];
    [Email_text resignFirstResponder];
    [Password_text resignFirstResponder];
    [Address_text resignFirstResponder];
    [Phone_text resignFirstResponder];
    
    if (sqlite3_open(dbpath, &LoginDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO D2D (FirstName,LastName,Email,Password,Phone,Address) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", FirstName_text,LastName_text,Email_text,Password_text,Phone_text, Address_text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(LoginDB, insert_stmt, -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            if ([FirstName_text.text isEqualToString:@""]||[LastName_text.text isEqualToString:@""]||[Email_text.text isEqualToString:@""]||[Password_text.text isEqualToString:@""]||[Address_text.text isEqualToString:@""]||[Phone_text.text isEqualToString:@""]) {
                
                status_label.text=@"Please enter details properly";
                
            }
            else{
                // [insertSQL resignFirstResponder];
                
                status_label.text = @"Sign up Successful";
                FirstName_text.text = @"";
                LastName_text.text = @"";
                Email_text.text = @"";
                Password_text.text = @"";
                Address_text.text = @"";
                Phone_text.text = @"";
                UIViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
                
                
                [self.navigationController pushViewController:controller animated:YES];
                status_label.text=@" ";
            }
            
        }
        else {
            status_label.text = @"Failed to Sign Up";
            FirstName_text.text = @"";
            LastName_text.text = @"";
            Email_text.text = @"";
            Password_text.text = @"";
            Address_text.text = @"";
            Phone_text.text = @"";
            
        }
        sqlite3_finalize(statement);
        sqlite3_close(LoginDB);
    }
    
}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch * touch = [touches anyObject];
//    if(touch.phase == UITouchPhaseBegan) {
//        [self.view endEditing:YES];
//    }
//}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if ([textField tag]<4) {
    
    self.view.frame=CGRectMake(0, -40, 320, 460);
    }
    else {
        
        self.view.frame=CGRectMake(0, -100, 320, 460);
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 460);
    [textField resignFirstResponder];
    status_label.text=@"";
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [Address_text.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
   // [Address_text.layer setBorderColor: [[UIColor grayColor] CGColor]];
   // [Address_text.layer setBorderWidth: 1.0];
    [Address_text.layer setCornerRadius:8.0f];
    [Address_text.layer setMasksToBounds:YES];
    
    databasePath = [[NSBundle mainBundle] pathForResource:@"loginjp" ofType:@"sqlite"];
    
}


- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.FirstName_text = nil;
    self.LastName_text = nil;
    self.Email_text = nil;
    self.Password_text = nil;
    self.Address_text = nil;
    self.Phone_text = nil;
    self.status_label = nil;
}
@end