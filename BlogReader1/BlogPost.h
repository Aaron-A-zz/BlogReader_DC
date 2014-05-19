//
//  BlogPost.h
//  BlogReader1
//
//  Created by DC on 03.05.2014.
//  Copyright (c) 2014 Dawid Cedrych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *author;
@property(strong, nonatomic) NSString *thumbnail;
@property(strong, nonatomic) NSString *date;
@property(strong, nonatomic) NSURL *url;
-(id) initWithTitle: (NSString *)title;
+(id) blogPostWithTitle:(NSString*)title;
-(NSURL *) thumbnailURL;
-(NSString *)formattedDate;


@end
