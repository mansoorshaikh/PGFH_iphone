//
//  CompanyWebsiteViewController.m
//  PGFH
//
//  Created by mansoor shaikh on 28/02/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import "CompanyWebsiteViewController.h"
#import "MainViewController.h"
#import "NewPostViewController.h"
#import "SWRevealViewController.h"

@interface CompanyWebsiteViewController ()

@end

@implementation CompanyWebsiteViewController
@synthesize backBtn,userSearchBar,searchBtn,categoriesBtn,postBtn,webView,mvc,logoimg;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    NSString *strURL = @"http://www.dagetechnology.com/";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    
    
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
   
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CompanyWebsiteViewController *compvc;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        compvc=[[CompanyWebsiteViewController alloc] initWithNibName:@"CompanyWebsiteViewController~ipad" bundle:nil];
         backBtn.layer.frame=CGRectMake(20,40,60,60);
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];

        }else
    {
    if(height>=480 && height<568){
        //iphone 4
        
        backBtn.layer.frame=CGRectMake(5,33,30,30);
        [backBtn removeFromSuperview];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:backBtn];
        
        logoimg.layer.frame=CGRectMake(80,2,150,70);
        [logoimg removeFromSuperview];
        [logoimg setImage:[UIImage imageNamed: @"icon@3x_180-180.png"]];
        [self.view addSubview:logoimg];

        
    }else if(height>=568 && height<600){
        //iphone 5
        
        backBtn.layer.frame=CGRectMake(5,27,30,30);
        [backBtn removeFromSuperview];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:backBtn];
        
        logoimg.layer.frame=CGRectMake(80,5,150,75);
        [logoimg removeFromSuperview];
        [logoimg setImage:[UIImage imageNamed: @"icon@3x_180-180.png"]];
        [self.view addSubview:logoimg];
 
        // Do any additional setup after loading the view from its nib.
    }else{
        backBtn.layer.frame=CGRectMake(5,27,30,30);
        [backBtn removeFromSuperview];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:backBtn];

    }
    }
}
-(IBAction)newPostAction{
    NewPostViewController *npvc;
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) {
        
        npvc=[[NewPostViewController alloc] initWithNibName:@"NewPostViewController" bundle:nil];
    }else{
        npvc=[[NewPostViewController alloc] initWithNibName:@"NewPostViewController~ipad" bundle:nil];
        
    }
    [self.navigationController pushViewController:npvc animated:YES];
}
- (void)viewDidLayoutSubviews {
    webView.frame = CGRectMake(0,75, self.view.frame.size.width, self.view.frame.size.height);
}

    // Do any additional setup after loading the view from its nib.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)popViewController{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    // The user clicked the [X] button or otherwise cleared the text.
    if([searchText length] == 0) {
        [searchBar performSelector: @selector(resignFirstResponder)
                        withObject: nil
                        afterDelay: 0.1];
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if(![userSearchBar.text isEqualToString:@""])
    {
        mvc.searchString=[[NSString alloc]init];
        mvc.searchString=userSearchBar.text;
        [self popViewController];
    }
   
    [self.userSearchBar resignFirstResponder];
    
}

-(void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    userSearchBar.showsCancelButton = NO;
    [self.userSearchBar resignFirstResponder];
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
