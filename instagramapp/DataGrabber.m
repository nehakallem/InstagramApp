//
//  DataGrabber.m
//  InstagramApp
//
//  Created by Neha Kallem on 3/10/15.
//  Copyright (c) 2015 Neha Kallem. All rights reserved.
//

#import "DataGrabber.h"

@interface DataGrabber() {
    
    NSString *nextURL;
    
}

@end


@implementation DataGrabber


-(void) getFreshData{
    NSURL *theURL;
    if(!nextURL) {
        theURL = [NSURL URLWithString:@"https://api.instagram.com/v1/tags/selfie/media/recent/?client_id=5f9365e9f1054aa991726d731c65aa02"];
    } else {
        theURL = [NSURL URLWithString:nextURL];
    }
    
    NSData *theImageData = [NSData dataWithContentsOfURL:theURL];
    
    NSError *error;
    NSDictionary *thePhotos = [NSJSONSerialization JSONObjectWithData:theImageData options:kNilOptions error:&error];
    
    NSLog(@"%@",thePhotos);
    
    nextURL = [[thePhotos objectForKey:@"pagination"] objectForKey:@"next_url"];
    if(!error) {
        [_dataGrabberDelegate provide:[thePhotos objectForKey:@"data"]];
    } else {
        NSLog(@"There was an Error - %@",error);
        [self performSelector:@selector(getFreshData) withObject:nil afterDelay:1.0];
    }
    
}


@end

