//
//  WebViewController.h
//  BlogReader1
//
//  Created by DC on 10.05.2014.
//  Copyright (c) 2014 Dawid Cedrych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property(strong, nonatomic) IBOutlet UIWebView* WebView;
@property(strong, nonatomic) NSURL* blogPostURL;
@end
