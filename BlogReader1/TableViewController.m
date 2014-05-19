//
//  TableViewController.m
//  BlogReader1
//
//  Created by DC on 26.04.2014.
//  Copyright (c) 2014 Dawid Cedrych. All rights reserved.
//

#import "TableViewController.h"
#import"BlogPost.h"
#import"WebViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *blogURL=[NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary/"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    NSError *error = nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    NSLog(@"%@", dataDictionary);
    self.blogPosts = [NSMutableArray array];
    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];
    //petla tworzaca posty
    for(NSDictionary *bp in blogPostsArray)
    {
        //tworzymy obiekt klasy Blogpost
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bp objectForKey:@"title"]];
        blogPost.author =[bp objectForKey:@"author"];
        blogPost.thumbnail = [bp objectForKey:@"thumbnail"];
        blogPost.date = [bp objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bp objectForKey:@"url"]];
        //dodajemy go do listy postow bloga
        [self.blogPosts addObject:blogPost];
       
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}
//tutaj programujemy ile kolumn
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.blogPosts.count;
}

//tutaj wyswietlanie programuejmy
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath:indexPath];
//    NSDictionary *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    if([blogPost.thumbnail isKindOfClass:[NSString class]]){
    NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
    UIImage *image =[UIImage imageWithData:imageData];
    //ponizej jest nieaktulane bo teraz juz nie musimy przeszukiwac slownika tylko mamy dostep do author i dictionary
//    cell.textLabel.text = [blogPost valueForKey:@"title"];
//    cell.detailTextLabel.text = [blogPost valueForKey:@"author"];
    cell.imageView.image =image;
    } else {
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", blogPost.author, [blogPost formattedDate]];
    }
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if([segue.identifier isEqualToString:@"showBlogPost"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        //opcja nr 1
        //[segue.destinationViewController setBlogPostURL:blogPost.url];
       //opcja nr 2
        WebViewController *wbc = (WebViewController *)segue.destinationViewController;
        wbc.blogPostURL = blogPost.url;
    }
}


@end
