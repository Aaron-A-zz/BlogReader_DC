//
//  BlogPost.m
//  BlogReader1
//
//  Created by DC on 03.05.2014.
//  Copyright (c) 2014 Dawid Cedrych. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost
//designated initializer
-(id) initWithTitle: (NSString *)title{
    self = [super init];
    
if(self)
{
    self.title = title;
    self.author = nil;
    self.thumbnail = nil;
}
    return self;
}
//convenience contructor
+(id) blogPostWithTitle:(NSString*)title
{
    return [[self alloc] initWithTitle:title];
}

-(NSURL *) thumbnailURL{
    return [NSURL URLWithString:self.thumbnail];
}
-(NSString *)formattedDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-DD-dd HH:mm:ss"];
    NSDate *tempDate = [dateFormatter dateFromString:self.date];
    [dateFormatter setDateFormat:@"EE MMM, dd"];
    return [dateFormatter stringFromDate:tempDate];
     
    
}

@end
