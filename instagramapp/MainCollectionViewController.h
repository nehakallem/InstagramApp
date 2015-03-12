//
//  MainCollectionViewController.h
//  InstagramApp
//
//  Created by Neha Kallem on 3/10/15.
//  Copyright (c) 2015 Neha Kallem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionViewCell.h"
#import "DataGrabber.h"

@interface MainCollectionViewController : UICollectionViewController <DataGrabberDelegate>

@property (nonatomic, retain) NSMutableArray *thePhotoArray;
@property(nonatomic) BOOL sharing;
@property (nonatomic, strong) NSIndexPath *selectedItemIndexPath;

@end
