//
//  MerchantListViewController.m
//  PGFH
//
//  Created by mansoor shaikh on 28/02/15.
//  Copyright (c) 2015 MobiWebCode. All rights reserved.
//

#import "MerchantListViewController.h"
#import "MerchantVO.h"
#import "UIColor+Expanded.h"
#import "MainViewController.h"
#include "NewPostViewController.h"
#import "SWRevealViewController.h"

@interface MerchantListViewController ()

@end

@implementation MerchantListViewController
@synthesize merchantTableview,merchantsArray,activityIndicator,filteredContentList;
@synthesize backBtn,userSearchBar,searchBtn,categoriesBtn,postBtn,mvc,logoimg,merchant,characters,searchString,merchantNameTextview,merchantDescriptionTextview,currentElement,currentElementData;
- (void)viewDidLoad {
    [super viewDidLoad];
    [activityIndicator stopAnimating];
    self.navigationController.navigationBarHidden=YES;
    mvc=[[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [self parseMerchantsList];
    self.navigationItem.hidesBackButton=YES;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
  
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    MerchantListViewController *mervc;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
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
        
        userSearchBar.layer.frame=CGRectMake(35,25,170, 30);
        [userSearchBar removeFromSuperview];
        UIToolbar* searchToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        searchToolbar.barStyle = UIBarStyleBlackTranslucent;
        searchToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [searchToolbar sizeToFit];
        userSearchBar.inputAccessoryView = searchToolbar;
        [self.view addSubview:userSearchBar];
        merchantTableview.frame=CGRectMake(0,70,self.view.bounds.size.width,self.view.bounds.size.height-220);
        [merchantTableview removeFromSuperview];
        [self.view addSubview:merchantTableview];


    }else if(height>=568 && height<600){
        //iphone 5
        
        backBtn.layer.frame=CGRectMake(5,27,30,30);
        [backBtn removeFromSuperview];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
        
        
        userSearchBar.layer.frame=CGRectMake(35,25,170, 30);
        [userSearchBar removeFromSuperview];
        UIToolbar* searchToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        searchToolbar.barStyle = UIBarStyleBlackTranslucent;
        searchToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [searchToolbar sizeToFit];
        userSearchBar.inputAccessoryView = searchToolbar;
        [self.view addSubview:userSearchBar];
        merchantTableview.frame=CGRectMake(0,70,self.view.bounds.size.width,self.view.bounds.size.height-220);
        [merchantTableview removeFromSuperview];
        [self.view addSubview:merchantTableview];


        // Do any additional setup after loading the view from its nib.
    }else{
        backBtn.layer.frame=CGRectMake(5,27,30,30);
        [backBtn removeFromSuperview];
        [backBtn setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
        [backBtn addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:backBtn];
        merchantTableview.frame=CGRectMake(0,70,self.view.bounds.size.width,self.view.bounds.size.height-100);
        [merchantTableview removeFromSuperview];
        [self.view addSubview:merchantTableview];

    }
    }
   

    // Do any additional setup after loading the view from its nib.
}
-(void)doneWithNumberPad{
    [self.userSearchBar resignFirstResponder];
    if ([userSearchBar.text isEqualToString:@""]) {
        filteredContentList=[[NSMutableArray alloc]init];
        filteredContentList=merchantsArray;
        [merchantTableview reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
}


-(void)parseMerchantsList{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSData *mydata = [[NSData alloc] init];

    NSString *urlString = [[NSString alloc]initWithFormat:@"http://www.pfh.com.my/pgfh/merchantlist.php"];
    
    //mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    NSURL *url      = [NSURL URLWithString:urlString];
    NSError *error;

    NSString * dataString = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    mydata = [dataString dataUsingEncoding:NSUTF8StringEncoding];

    NSXMLParser *timetableParser = [[NSXMLParser alloc] initWithData:mydata];
    [timetableParser setDelegate:self];
    [timetableParser setShouldProcessNamespaces:NO];
    [timetableParser setShouldReportNamespacePrefixes:NO];
    [timetableParser setShouldResolveExternalEntities:NO];
    
    [timetableParser parse];
    [merchantTableview reloadData];
    [activityIndicator stopAnimating];
    NSLog(@"user >>> %@", urlString);
    
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"merchantlist"]){
        merchantsArray=[[NSMutableArray alloc]init];

    }
    else if([elementName isEqualToString:@"merchant"]){
        merchant=[[MerchantVO alloc] init];
    }
    else if([elementName isEqualToString:@"merchantid"]){
        merchant.merchantid=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"merchantname"]){
        merchant.merchantname=[[NSString alloc] init];
        self.currentElement=[[NSString alloc] initWithString:elementName];
    }else if([elementName isEqualToString:@"merchantdescription"]){
        merchant.merchantdescription=[[NSString alloc] init];
        self.currentElement=[[NSString alloc] initWithString:elementName];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    characters=[[NSString alloc] initWithString:string];
    if([currentElement isEqualToString:@"merchantdescription"] || [currentElement isEqualToString:@"merchantname"]){
    if (!currentElementData) {
        currentElementData = [[NSMutableString alloc] init];
    }
    [currentElementData appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"merchantid"]){
        merchant.merchantid=characters;
    }else if([elementName isEqualToString:@"merchantname"]){
        merchant.merchantname=[NSString stringWithString:currentElementData];
        currentElementData=nil;
    }else if([elementName isEqualToString:@"merchantdescription"]){
        merchant.merchantdescription=[NSString stringWithString:currentElementData];
        currentElementData=nil;
        [merchantsArray addObject:merchant];
        filteredContentList=[[NSMutableArray alloc ]init];
        filteredContentList=merchantsArray;
    }
}

//tableview view delagates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [filteredContentList count];    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    MerchantVO *merchant=[filteredContentList objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:MyIdentifier] ;
    
    //cell.backgroundColor=[UIColor clearColor];
    tableView.backgroundColor=[UIColor clearColor];

    cell.backgroundColor=[UIColor clearColor];
    
        merchantNameTextview=[[UILabel alloc] initWithFrame:CGRectMake(5, 2, self.view.bounds.size.width-5, 25)];
        merchantNameTextview.text=merchant.merchantname;
        merchantNameTextview.textColor=[UIColor colorWithHexString:@"1acfe4"];
        [merchantNameTextview setFont:[UIFont fontWithName:@"Roboto-Regular" size:16]];
        [cell.contentView addSubview:merchantNameTextview];
        
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:merchant.merchantdescription];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
        
        merchantDescriptionTextview=[[UILabel alloc] initWithFrame:CGRectMake(5,0, self.view.bounds.size.width-5, [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString :merchant.merchantdescription] andWidth:self.view.bounds.size.width-60]+50)];
        CGSize textViewSize = [merchantDescriptionTextview sizeThatFits:CGSizeMake(merchantDescriptionTextview.frame.size.width, cell.bounds.size.height)];
    cell.backgroundColor=[UIColor clearColor];
        merchantDescriptionTextview.lineBreakMode = NSLineBreakByWordWrapping;
        merchantDescriptionTextview.numberOfLines = 0;
        if(![merchant.merchantdescription isEqualToString:@""] && merchant.merchantdescription!=nil)
        {
            [merchantDescriptionTextview setAttributedText:title];
        }else {
            [merchantDescriptionTextview setText:@"N/A"];
        }
        merchantDescriptionTextview.textAlignment = NSTextAlignmentLeft;
        [merchantDescriptionTextview setFont:[UIFont fontWithName:@"Roboto-Regular" size:14]];
        merchantDescriptionTextview.textColor=[UIColor colorWithHexString:@"000000"];
        [cell.contentView addSubview:merchantDescriptionTextview];
        
      return cell;
}
-(IBAction)popViewController{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    navController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [[[UIApplication sharedApplication] delegate] window].rootViewController=navController;
    [[[[UIApplication sharedApplication] delegate] window] makeKeyAndVisible];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        MerchantVO *merVo=[merchantsArray objectAtIndex:indexPath.row];
        NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:merVo.merchantdescription];
        UIFont *font = [UIFont systemFontOfSize:14];
        [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
        
        return [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-80]+140;

    }else{
    MerchantVO *merVo=[merchantsArray objectAtIndex:indexPath.row];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc]initWithString:merVo.merchantdescription];
    UIFont *font = [UIFont systemFontOfSize:14];
    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    
    return [self textViewHeightForAttributedText:title andWidth:self.view.bounds.size.width-40]+30;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

- (void)searchTableList {
    NSString *searchString = userSearchBar.text;
    filteredContentList=[[NSMutableArray alloc]init];
    for (int i=0; i<merchantsArray.count; i++) {
        MerchantVO *MVO=[merchantsArray objectAtIndex:i];
        
        NSComparisonResult result;
        if([MVO.merchantname  length] >= [searchString length]){
            result = [MVO.merchantname compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])];
        }
        if (result == NSOrderedSame)
        {
            [filteredContentList addObject:MVO];
        }

    
        NSComparisonResult results;
        if([MVO.merchantdescription  length] >= [searchString length]){
            result = [MVO.merchantdescription compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])];
        }
        if (results == NSOrderedSame)
        {
            [filteredContentList addObject:MVO];
        }
        

     }
    [merchantTableview reloadData];
}

#pragma mark - Search Implementation

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    isSearching = YES;
}
/*-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length != 0){
        isSearching = YES;
        [self searchTableList];
        
    }else {
        isSearching = NO;
        filteredContentList=[[NSMutableArray alloc]init];
        filteredContentList=merchantsArray;
        // tblContentList.hidden=YES;
    }
    [merchantTableview reloadData];
}
*/
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.userSearchBar resignFirstResponder];
    filteredContentList=[[NSMutableArray alloc]init];
    filteredContentList=merchantsArray;
    [merchantTableview reloadData];

    NSLog(@"Cancel clicked");
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)aSearchBar {
    [self.userSearchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)asearchBar {
    NSLog(@"Search Clicked");
    [self.userSearchBar resignFirstResponder];
    if(userSearchBar.text  !=nil) {
        isSearching = YES;
        [self searchTableList];
    }else {
        isSearching = NO;
        filteredContentList=[[NSMutableArray alloc]init];
        filteredContentList=merchantsArray;
        // tblContentList.hidden=YES;
    }
    [merchantTableview reloadData];
}



@end
