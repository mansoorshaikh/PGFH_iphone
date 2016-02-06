//
//  RegisterViewController.m
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "LoginViewController.h"
#import "menuControllers/MainViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize signUpButton,backBtn,usernameTxt,passwordTxt,nameTxt,phoneTxt,emailTxt,mainImg,subImg,signUpLbl,activityIndicator,appDelegate;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [activityIndicator stopAnimating];
    appDelegate=[[UIApplication sharedApplication] delegate];
    RegisterViewController *registers;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        registers=[[RegisterViewController alloc] initWithNibName:@"RegisterViewController~ipad" bundle:nil];
    }else
    {

    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if(height>=480 && height<568){
        mainImg.frame=CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [mainImg removeFromSuperview];
        [self.view addSubview:mainImg];

        subImg.frame=CGRectMake(30,40,260,420);
        subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [subImg removeFromSuperview];
        [self.view addSubview:subImg];
        
        signUpLbl.layer.frame=CGRectMake(120,50, 100,40);
        [signUpLbl removeFromSuperview];
        [self.view addSubview:signUpLbl];
        
        usernameTxt.layer.frame=CGRectMake(60,95, 200,40);
        [usernameTxt removeFromSuperview];
        [self.view addSubview:usernameTxt];
        
        passwordTxt.layer.frame=CGRectMake(60,150, 200,40);
        [passwordTxt removeFromSuperview];
        [self.view addSubview:passwordTxt];
        
        nameTxt.layer.frame=CGRectMake(60,205, 200,40);
        [nameTxt removeFromSuperview];
        [self.view addSubview:nameTxt];
        
        phoneTxt.layer.frame=CGRectMake(60,255, 200,40);
        [phoneTxt removeFromSuperview];
        [self.view addSubview:phoneTxt];
        
        emailTxt.layer.frame=CGRectMake(60,310, 200,40);
        [emailTxt removeFromSuperview];
        [self.view addSubview:emailTxt];
        
        signUpButton.layer.frame=CGRectMake(60,360, 200,40);
        [signUpButton removeFromSuperview];
        [self.view addSubview:signUpButton];
        
        backBtn.layer.frame=CGRectMake(60,410, 200,40);
        [backBtn removeFromSuperview];
        [self.view addSubview:backBtn];

    }else if(height>=568 && height<600){
        
        mainImg.frame=CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [mainImg removeFromSuperview];
        [self.view addSubview:mainImg];

        subImg.frame=CGRectMake(30,70,260,420);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [subImg setBackgroundColor:[UIColor lightGrayColor]];
        [subImg removeFromSuperview];
        [self.view addSubview:subImg];
        
        signUpLbl.layer.frame=CGRectMake(120,80, 100,40);
        [signUpLbl removeFromSuperview];
        [signUpLbl setFont:[UIFont fontWithName:@"Roboto-Regular" size:25]];
        [self.view addSubview:signUpLbl];

        usernameTxt.layer.frame=CGRectMake(50,125, 220,40);
        [usernameTxt removeFromSuperview];
        [self.view addSubview:usernameTxt];
        
        passwordTxt.layer.frame=CGRectMake(50,180, 220,40);
        [passwordTxt removeFromSuperview];
        [self.view addSubview:passwordTxt];
        
        nameTxt.layer.frame=CGRectMake(50,235, 220,40);
        [nameTxt removeFromSuperview];
        [self.view addSubview:nameTxt];
        
        phoneTxt.layer.frame=CGRectMake(50,285, 220,40);
        [phoneTxt removeFromSuperview];
        [phoneTxt setKeyboardType:UIKeyboardTypeNumberPad];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleBlackTranslucent;
        numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [numberToolbar sizeToFit];
        phoneTxt.inputAccessoryView = numberToolbar;
        //currentTextField.tag=5;
        phoneTxt.delegate=self;

        [self.view addSubview:phoneTxt];
        
        emailTxt.layer.frame=CGRectMake(50,340, 220,40);
        [emailTxt removeFromSuperview];
        [self.view addSubview:emailTxt];
        
        signUpButton.layer.frame=CGRectMake(50,390, 220,40);
        [signUpButton removeFromSuperview];
        signUpButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:25];
        [self.view addSubview:signUpButton];
        
        backBtn.layer.frame=CGRectMake(50,440, 220,40);
        [backBtn removeFromSuperview];
        backBtn.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:25];
        [self.view addSubview:backBtn];


    }
    
    [phoneTxt setKeyboardType:UIKeyboardTypeNumberPad];
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    phoneTxt.inputAccessoryView = numberToolbar;
    //currentTextField.tag=5;
    phoneTxt.delegate=self;
    }
    // Do any additional setup after loading the view from its nib.
}
-(void)doneWithNumberPad{
    [phoneTxt resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
}
-(IBAction)backAction{
    LoginViewController *lvc=[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:lvc animated:YES];

}
-(IBAction)signUpAction{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([usernameTxt.text isEqualToString:@""] || [passwordTxt.text isEqualToString:@""] || [nameTxt.text isEqualToString:@""] || [phoneTxt.text isEqualToString:@""] || [emailTxt.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"PGFH"
                                                        message:@"All fields are mandatory!!!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [activityIndicator stopAnimating];
        
    }else if ([emailTest evaluateWithObject:emailTxt.text] == NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"PGFH" message:@"Please Enter Valid Email Address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [activityIndicator stopAnimating];
        return;
    }else{
        NSString* deviceid = [appDelegate.deviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];

        NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/registeruser.php?username=%@&password=%@&name=%@&phone=%@&email=%@&deviceid=%@&devicetype=iphone&facebookuser=NO",usernameTxt.text,passwordTxt.text,nameTxt.text,phoneTxt.text,emailTxt.text,deviceid];
        NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                      length:[mydata length] encoding: NSUTF8StringEncoding];
        
        if([content isEqualToString:@"0"]){
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"Username or email is duplicated!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];

             [activityIndicator stopAnimating];
        }else{
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"You are registered successfully!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:content forKey:@"loggedin"];
        [prefs synchronize];
        
        
        
        MainViewController *hvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        [self.navigationController pushViewController:hvc animated:YES];
            
             [activityIndicator stopAnimating];
}
    }
   

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return NO;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
    
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -100; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==phoneTxt){
        NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        int length = [currentString length];
        if (length > 12) {
            return NO;
        }
        
    }
    int length = [self getLength:phoneTxt.text];
    if(length == 12) {
        if(range.length == 0)
            return NO;
    }
    if(length == 3){
        NSString *num = [self formatNumber:phoneTxt.text];
        phoneTxt.text = [NSString stringWithFormat:@"%@-",num];
        
        if(range.length > 0) {
            phoneTxt.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
            
        }
    } else if(length == 6) {
        NSString *num = [self formatNumber:phoneTxt.text];
        phoneTxt.text = [NSString stringWithFormat:@"%@-%@-",[num  substringToIndex:3],[num substringFromIndex:3]];
        if(range.length > 0) {
            phoneTxt.text = [NSString stringWithFormat:@"%@-%@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
    }
    
    
    return YES;
}
-(NSString*)formatNumber:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = [mobileNumber length];
    if(length > 10)
    {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
    }
    return mobileNumber;
}
-(int)getLength:(NSString*)mobileNumber
{
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    int length = [mobileNumber length];
    
    return length;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
