//
//  CustomCollectionViewCell.m
//  InstagramApp
//
//  Created by Neha Kallem on 3/10/15.
//  Copyright (c) 2015 Neha Kallem. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _theImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 150, 150)];
        [self.contentView addSubview:_theImageView];
    }
    return self;
}

-(void) setImageWithData:(NSDictionary *) thePhotoData {
    
    [self performSelectorInBackground:@selector(downloadImage:) withObject:[[[thePhotoData objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"]];

    
}

-(void) downloadImage:(NSString *)downloadURL {
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:downloadURL]];
    [self performSelectorOnMainThread:@selector(displayImage:) withObject:imageData waitUntilDone:YES];
    
}

-(void) displayImage:(NSData *) imageData {
    _theImageView.image = [UIImage imageWithData:imageData];
}



@end
