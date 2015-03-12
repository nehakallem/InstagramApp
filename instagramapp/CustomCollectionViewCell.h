//
//  CustomCollectionViewCell.h
//  InstagramApp
//
//  Created by Neha Kallem on 3/10/15.
//  Copyright (c) 2015 Neha Kallem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) UIImageView *theImageView;

-(void) setImageWithData:(NSDictionary *) thePhotoData;

@end
