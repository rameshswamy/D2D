//
//  ViewController.m
//  D2D
//
//  Created by jaya prakash rao polsani on 13/12/12.
//  Copyright (c) 2012 jaya prakash rao polsani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize username_text,password_text,login,status;



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}



- (IBAction)Login: (id) sender
{
	// TODO: spawn a Login thread
	
	login.enabled = FALSE;
    const char *dbpath = [databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    [username_text resignFirstResponder];
    [password_text resignFirstResponder];
    
    if (sqlite3_open(dbpath, &LoginDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat: @"SELECT * FROM D2D WHERE  Password=\'%@\' and Email=\'%@\'",password_text.text,username_text.text];
        if ([username_text.text isEqualToString:@""]) {
            
            status.text=@"Please enter username";
            
        }
        else if ([password_text.text isEqualToString:@""]) {
            
            status.text=@"Please enter password";
            
        }
        
        else
        {
            
            const char *query_stmt = [querySQL UTF8String];
            
            if (sqlite3_prepare_v2(LoginDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
            {
                if (sqlite3_step(statement) == SQLITE_ROW)
                {
                    username_text.text = @"";
                    password_text.text = @"";
                    
                   // UITabBarController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
                    
                    UIViewController *controller=[self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
                    
                    
                    [self.navigationController pushViewController:controller animated:YES];
                    status.text=@" ";
                    
                }
                else {
                    // username.text = @"";
                    password_text.text = @"";
                    status.text=@"login failed";
                    
                }
                sqlite3_finalize(statement);
            }
            sqlite3_close(LoginDB);
        }
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, -70, 320, 460);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    self.view.frame=CGRectMake(0, 0, 320, 460);
    [textField resignFirstResponder];
    status.text=@"";
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    databasePath = [[NSBundle mainBundle] pathForResource:@"loginjp" ofType:@"sqlite"];
    
}
//for dismissing the keyboard where we touch on the screen
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch * touch = [touches anyObject];
//    if(touch.phase == UITouchPhaseBegan) {
//        [self.view endEditing:YES];
//    }
//}

-(IBAction)signUp:(id)sender
{
    
    [username_text resignFirstResponder];
    [password_text resignFirstResponder];
    username_text.text = @"";
    password_text.text = @"";
    status.text=@"";
    
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"Login"]) {

//    }
//}
- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.username_text = nil;
    self.password_text = nil;
    self.status = nil;
}

@end










