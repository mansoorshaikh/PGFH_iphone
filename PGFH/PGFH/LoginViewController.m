//
//  LoginViewController.m
//  PGFH
//
//  Created by arvind on 8/18/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "HomeViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"
#import "Reachability.h"
#import "ViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize signUpButton,loginBtn,facebookloginBtn,forgtBtn,usernameTxt,passwordTxt,mainImg,subImg,iconImg,activityIndicator,ChangePass,changePassStr,upDateBtn,cancelBtn,firstname,emailStr,usernameStr,iconBackLbl,alert,appDelegate,alerts,alertView,contactImg;
- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate=[[UIApplication sharedApplication] delegate];
    appDelegate.index=0;
    self.navigationController.navigationBarHidden=YES;
    [activityIndicator stopAnimating];
    LoginViewController *login;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
          //  login=[[LoginViewController alloc] initWithNibName:@"LoginViewController~ipad" bundle:nil];
        
       
    }else
    {

    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if(height>=480 && height<568){
        
        
        mainImg.frame=CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [mainImg removeFromSuperview];
        [self.view addSubview:mainImg];
        
        iconBackLbl.frame=CGRectMake(0,40,self.view.bounds.size.width,103);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [iconBackLbl removeFromSuperview];
        [self.view addSubview:iconBackLbl];

        iconImg.frame=CGRectMake(80,43,150,100);
        iconImg.image=[UIImage imageNamed:@"pgfhlogo.png"];
        [iconImg removeFromSuperview];
        [self.view addSubview:iconImg];

        subImg.frame=CGRectMake(55,167,200,220);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [subImg removeFromSuperview];
        [self.view addSubview:subImg];
        
        usernameTxt.layer.frame=CGRectMake(60,175, 190,40);
        [usernameTxt removeFromSuperview];
        [self.view addSubview:usernameTxt];
        
        passwordTxt.layer.frame=CGRectMake(60, 220, 190,40);
        [passwordTxt removeFromSuperview];
        [self.view addSubview:passwordTxt];
        
        loginBtn.layer.frame=CGRectMake(60,270, 190,40);
        [loginBtn removeFromSuperview];
        [self.view addSubview:loginBtn];
        
        facebookloginBtn.layer.frame=CGRectMake(60,320, 190,40);
        [facebookloginBtn removeFromSuperview];
        [self.view addSubview:facebookloginBtn];
        
        
        signUpButton.frame = CGRectMake(50,350,80,40);
        [signUpButton addTarget:self action:@selector(signUpAction)forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:signUpButton];
        
        forgtBtn.layer.frame=CGRectMake(120, 350, 150, 40);
        [forgtBtn removeFromSuperview];
        [forgtBtn addTarget:self action:@selector(launchDialog:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:forgtBtn];
        
        [contactImg removeFromSuperview];
        contactImg.frame=CGRectMake(0,400,self.view.bounds.size.width-95,100);
        contactImg.image=[UIImage imageNamed:@"LOT33 ABS FOR PENANG FOOD HUNTER 2.jpg"];
        [self.view addSubview:contactImg];

    }else if(height>=568 && height<600){
        
        mainImg.frame=CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [mainImg removeFromSuperview];
        [self.view addSubview:mainImg];
        
        iconBackLbl.frame=CGRectMake(0,40,self.view.bounds.size.width,103);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [iconBackLbl removeFromSuperview];
        [self.view addSubview:iconBackLbl];

        iconImg.frame=CGRectMake(80,43,150,100);
        iconImg.image=[UIImage imageNamed:@"pgfhlogo.png"];
        [iconImg removeFromSuperview];
        [self.view addSubview:iconImg];
        
        subImg.frame=CGRectMake(43,167,230,250);
        //subImg.image=[UIImage imageNamed:@"mainfeeds_bg.png"];
        [subImg setBackgroundColor:[UIColor darkGrayColor]];
        [subImg removeFromSuperview];
        [self.view addSubview:subImg];

        usernameTxt.layer.frame=CGRectMake(55,180, 205,40);
        [usernameTxt removeFromSuperview];
        [self.view addSubview:usernameTxt];
        
        passwordTxt.layer.frame=CGRectMake(55, 230, 205,40);
        [passwordTxt removeFromSuperview];
        [self.view addSubview:passwordTxt];
        
        loginBtn.layer.frame=CGRectMake(51,280, 211,42);
        loginBtn.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:20];
        [loginBtn removeFromSuperview];
        [self.view addSubview:loginBtn];
        
        facebookloginBtn.layer.frame=CGRectMake(55,330, 205,40);
        [facebookloginBtn removeFromSuperview];
        [self.view addSubview:facebookloginBtn];

    
        signUpButton.frame = CGRectMake(45,370,80,40);
        [signUpButton addTarget:self action:@selector(signUpAction)forControlEvents:UIControlEventTouchUpInside];
        signUpButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:14];
        [self.view addSubview:signUpButton];
        
        forgtBtn.layer.frame=CGRectMake(120, 370, 150,40);
        [forgtBtn removeFromSuperview];
        [forgtBtn addTarget:self action:@selector(launchDialog:) forControlEvents:UIControlEventTouchDown];
        forgtBtn.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:14];
         forgtBtn.tintColor = [UIColor whiteColor];
        [self.view addSubview:forgtBtn];
        
        [self.view setBackgroundColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];
        
        [contactImg removeFromSuperview];
        contactImg.frame=CGRectMake(0,470,self.view.bounds.size.width-95,100);
        contactImg.image=[UIImage imageNamed:@"LOT33 ABS FOR PENANG FOOD HUNTER 2.jpg"];
        [self.view addSubview:contactImg];
        // A simple button to launch the demo
    }else{
       // login=[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];

    }
    }
   NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if([prefs stringForKey:@"loggedin"]!=nil){
        MainViewController *mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        [self.navigationController pushViewController:mvc animated:YES];
    }

    // Do any additional setup after loading the view from its nib.
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
-(IBAction)signUpAction{
    RegisterViewController *rvc;
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {

    rvc=[[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    }else{
        rvc=[[RegisterViewController alloc] initWithNibName:@"RegisterViewController~ipad" bundle:nil];

    }
    [self.navigationController pushViewController:rvc animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
-(IBAction)facebookAction{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerts show];
        
    }else{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];

    NSString *facebookID=[[NSUserDefaults standardUserDefaults] stringForKey:@"facebookid"];
    if(facebookID==nil || [facebookID isEqualToString:@""]){
        if (!FBSession.activeSession.isOpen) {
            [FBSession openActiveSessionWithReadPermissions:@[@"email",@"user_location"]
                                               allowLoginUI:YES
                                          completionHandler:^(FBSession *session,
                                                              FBSessionState state,
                                                              NSError *error) {
                                              if (error) {
                                                  UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"PGFH"
                                                                                                      message:@"Please sign in using Facebook"
                                                                                                     delegate:nil
                                                                                            cancelButtonTitle:@"OK"
                                                                                            otherButtonTitles:nil];
                                                  [alertView show];
                                                  [activityIndicator stopAnimating];
                                              } else if (session.isOpen) {
                                                  [[FBRequest requestForMe] startWithCompletionHandler:
                                                   ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
                                                       if (!error) {
                                                           [[FBRequest requestForMe] startWithCompletionHandler:
                                                            ^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
                                                                if (!error) {
                                                                    
                                                                    NSLog(@"result %@",user);
                                                                }
                                                            }];
                                                           NSLog(@"user >>> %@", user);                                                           firstname=[[NSString alloc]init];
                                                           emailStr=[[NSString alloc]init];
                                                           usernameStr=[[NSString alloc]init];

                                                           firstname=[user objectForKey:@"first_name"];
                                                           emailStr=[user objectForKey:@"email"];
                                                           usernameStr=[user objectForKey:@"name"];
                                                           [self signUpFacebookAction];
                                                       }
                                                   }];
                                              }
                                          }];
            return;
        }
    }else{
        MainViewController *mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        [self.navigationController pushViewController:mvc animated:YES];
    }
    [activityIndicator stopAnimating];
}
}

-(void)signUpFacebookAction{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSString* string2 = [usernameStr stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString* deviceid = [appDelegate.deviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];

        NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/registeruser.php?username=%@&password=%@&name=%@&phone=%@&email=%@&facebookuser=YES&deviceid=%@devicetype=iphone",string2,@"",firstname,@"",emailStr,deviceid];
        NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                      length:[mydata length] encoding: NSUTF8StringEncoding];
        
        UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"You are registered successfully!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alerts show];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:content forKey:@"loggedin"];
        [prefs synchronize];
        
        
    MainViewController *hvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [self.navigationController pushViewController:hvc animated:YES];
        
        [activityIndicator stopAnimating];
}

-(IBAction)loginAction{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alerts = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alerts show];
        
    }else{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    /*if ([emailTest evaluateWithObject:usernameTxt.text] == NO) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SKUBAG!" message:@"Please Enter Valid Email Address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [activityIndicator stopAnimating];
        
        return;
    }else */
    if ([usernameTxt.text isEqualToString:@""] || [passwordTxt.text isEqualToString:@""]){
        UIAlertView *alerts = [[UIAlertView alloc] initWithTitle:@"PGFH"
                                                        message:@"Please fill in username and password."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alerts show];
        [activityIndicator stopAnimating];
        
    }else{
        NSString* string2 = [appDelegate.deviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];

        NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/loginuser.php?username=%@&password=%@&deviceid=%@&devicetype=iphone",usernameTxt.text,passwordTxt.text,string2];
        
        NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                      length:[mydata length] encoding: NSUTF8StringEncoding];
        if([content isEqualToString:@"no"])
        {
            UIAlertView * alertss = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"This user does not exist please check user name and password !!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alertss show];
            [activityIndicator stopAnimating];
        }
        else{
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:content forKey:@"loggedin"];
            [prefs synchronize];
            
            [activityIndicator stopAnimating];
            MainViewController *hvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
            [self.navigationController pushViewController:hvc animated:YES];
            [activityIndicator stopAnimating];
        }
    }
 }
}

-(UIView *)changePassAlert{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300,200)];
    [demoView setBackgroundColor:[UIColor whiteColor]];
    demoView.layer.cornerRadius=5;
    [demoView.layer setMasksToBounds:YES];
    [demoView.layer setBorderWidth:1.0];
    demoView.layer.borderColor=[[UIColor blackColor]CGColor];
    
    
    UIButton *topButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 48)];
    [topButton setTitle:@"PGFH" forState:UIControlStateNormal];
    [topButton setBackgroundImage:[UIImage imageNamed:@"submitbtnpost.png"] forState:UIControlStateNormal];
    topButton.layer.cornerRadius=1.0;
    [topButton setFont:[UIFont boldSystemFontOfSize:20]];
    [demoView addSubview:topButton];

    UILabel *titleLbl=[[UILabel alloc] initWithFrame:CGRectMake(5, 50, 300, 48)];
    titleLbl.text= @"Recover your password..!!!";
    titleLbl.layer.cornerRadius=1.0;
    [titleLbl setBackgroundColor:[UIColor whiteColor]];
    [titleLbl setFont:[UIFont systemFontOfSize:20]];
    [demoView addSubview:titleLbl];
    
    ChangePass=[[UITextField alloc] initWithFrame:CGRectMake(5,100, 290,48)];
    ChangePass.placeholder=@"Enter your register email is here...";
    ChangePass.borderStyle =UITextBorderStyleRoundedRect;
    ChangePass.layer.cornerRadius=2.0;
    [ChangePass.layer setBorderWidth:1.0];
    [ChangePass setDelegate:self];
    ChangePass.layer.borderColor=[[UIColor blackColor]CGColor];
    [demoView addSubview:ChangePass];
    
    upDateBtn=[[UIButton alloc] initWithFrame:CGRectMake(0,150,150,50)];
    [upDateBtn setTitle:@"Submit" forState:UIControlStateNormal];
    [upDateBtn addTarget:self
                  action:@selector(updatePassword)
        forControlEvents:UIControlEventTouchUpInside];
    [upDateBtn setBackgroundImage:[UIImage imageNamed:@"submit.png"] forState:UIControlStateNormal];

    [upDateBtn setBackgroundColor:[UIColor clearColor]];
    [demoView addSubview:upDateBtn];
    
    cancelBtn=[[UIButton alloc] initWithFrame:CGRectMake(150,150,150,50)];
    [cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelBtn addTarget:self
                  action:@selector(closeAlert:)
        forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"submitbtnpost.png"] forState:UIControlStateNormal];
    [cancelBtn setBackgroundColor:[UIColor clearColor]];
    [demoView addSubview:cancelBtn];
    return demoView;
    
}
-(void)closeAlert:(id)sender{
    [alertView close];
}

-(void)updatePassword{
    [alert dismissWithClickedButtonIndex:0 animated:YES];

    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([emailTest evaluateWithObject:ChangePass.text] == NO) {
        
        UIAlertView *alerts = [[UIAlertView alloc] initWithTitle:@"PGFH" message:@"Please Enter Valid Email Address !!!." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alerts show];
        
    }else if ([ChangePass.text isEqualToString:@""]){
        UIAlertView *alerts = [[UIAlertView alloc] initWithTitle:@"PGFH"
                                                        message:@"Please fill in email id to proceed !!!."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alerts show];
    }else{
        [self changePasswordUpdate];
    }
}



- (IBAction)launchDialog:(id)sender
{
    // Here we need to pass a full frame
    alertView = [[CustomIOS7AlertView alloc] init];
    // Add some custom content to the alert view
    [alertView setContainerView:[self changePassAlert]];
    // Modify the parameters
    [alertView setDelegate:self];
    // You may use a Block, rather than a delegate.
    [alertView setUseMotionEffects:true];
    // And launch the dialog
    [alertView show];
}




-(void)changePasswordUpdate{
    
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    
    NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/forgotpassword.php?email=%@",ChangePass.text];
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                  length:[mydata length] encoding: NSUTF8StringEncoding];
    if ([content isEqualToString:@"success"]) {
        alerts = [[UIAlertView alloc] initWithTitle:@"PGFH"
                                                        message:@"Please check your email id !!!."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alerts show];
        [alertView close];

    }else{
        
        alerts = [[UIAlertView alloc] initWithTitle:@"PGFH"
                                                        message:@"Your email does not exist in database !!!."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alerts show];
    }

[alert dismissWithClickedButtonIndex:0 animated:YES];
    [activityIndicator stopAnimating];
    
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
