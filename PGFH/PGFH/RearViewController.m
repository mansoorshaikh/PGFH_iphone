//
//  RearViewController.m
//  Chatapp
//
//  Created by arvind on 7/13/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import "RearViewController.h"
#import "UIColor+Expanded.h"
#import "SWRevealViewController.h"
#import "MainViewController.h"
@interface RearViewController ()

@end

@implementation RearViewController
@synthesize rearTableView = _rearTableView;
@synthesize appDelegate,usernameLabel,selectedMenuItem,titleLabel,imageLogo;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.rearTableView.separatorColor = [UIColor clearColor];
     appDelegate=[[UIApplication sharedApplication] delegate];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [imageLogo loadImageFromURL:[NSURL URLWithString:[prefs objectForKey:@"profileImage"]]];
    [imageLogo setBackgroundColor:[UIColor clearColor]];
   
    self.view.backgroundColor=[UIColor colorWithHexString:@"000000"];
    self.rearTableView.backgroundColor=[UIColor colorWithHexString:@"000000"];
    self.rearTableView.alwaysBounceVertical = NO;
    self.navigationController.navigationBarHidden=YES;
    usernameLabel.text=[prefs objectForKey:@"username"];
    UIFont *customFont = [UIFont fontWithName:@"OpenSans-Light" size:16];
    usernameLabel.font = customFont;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma marl - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
    
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor=[UIColor whiteColor];
    }
    
    UIImageView *menuItemImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,5,40,40)];
    UILabel *menuItemTextLabel=[[UILabel alloc] initWithFrame:CGRectMake(50, 5, 250, 45)];
    menuItemTextLabel.font = [UIFont boldSystemFontOfSize:18];
    menuItemTextLabel.textColor=[UIColor colorWithHexString:@"fefeff"];
    
    UIFont *customFont = [UIFont fontWithName:@"OpenSans-Light" size:16];
    menuItemTextLabel.font = customFont;
    
    cell.backgroundColor=[UIColor clearColor];
    
    if (row == 0)
    {
        menuItemImageView.image=[UIImage imageNamed:@"chaticon"];
        menuItemTextLabel.text = @"\tCHAT";
        [menuItemTextLabel.layer setCornerRadius:10];
        if([selectedMenuItem isEqualToString:@"     CHAT"]){
            cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tablecellselected.png"]];
        }
    }
    if (row == 2)
    {
        menuItemImageView.image=[UIImage imageNamed:@"recruitIcon"];
        menuItemTextLabel.text = @"\tADD NEW RECRUIT";
        [menuItemTextLabel.layer setCornerRadius:10];
        if([selectedMenuItem isEqualToString:@"     ADD NEW RECRUIT"]){
            cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tablecellselected.png"]];
        }
    }
    else if (row == 3)
    {
        menuItemImageView.image=[UIImage imageNamed:@"profileicon"];
        menuItemTextLabel.text = @"\tADD BUSINESS";
        [menuItemTextLabel.layer setCornerRadius:10];
        if([selectedMenuItem isEqualToString:@"     ADD BUSINESS"]){
            cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tablecellselected.png"]];
        }
        
    }
    else if (row == 4)
    {
        menuItemImageView.image=[UIImage imageNamed:@"guesticon"];
        menuItemTextLabel.text = @"\tADD NEW GUEST";
        [menuItemTextLabel.layer setCornerRadius:10];
    }
    else if (row == 5)
    {
        menuItemImageView.image=[UIImage imageNamed:@"matchupicon"];
        menuItemTextLabel.text = @"\tSUBMIT MATCH UP";
        [menuItemTextLabel.layer setCornerRadius:10];
    }else if (row == 6)
    {
        menuItemImageView.image=[UIImage imageNamed:@"officeicon"];
        menuItemTextLabel.text = @"\tOFFICE LOCATOR";
        [menuItemTextLabel.layer setCornerRadius:10];
    }else if (row == 7)
    {
        menuItemImageView.image=[UIImage imageNamed:@"logout.png"];
        menuItemTextLabel.text = @"\tLOGOUT";
        [menuItemTextLabel.layer setCornerRadius:10];
                
    }else if (row == 1)
    {
        menuItemImageView.image=[UIImage imageNamed:@"profileicon"];
        menuItemTextLabel.text = @"\tPROFILE";
        [menuItemTextLabel.layer setCornerRadius:10];
    }
    [menuItemTextLabel.layer setMasksToBounds:YES];
    [cell.contentView addSubview:menuItemImageView];
    [cell.contentView addSubview:menuItemTextLabel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // We know the frontViewController is a NavigationController
    NSInteger row = indexPath.row;
    MainViewController *mainvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    mainvc.index=row;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
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
