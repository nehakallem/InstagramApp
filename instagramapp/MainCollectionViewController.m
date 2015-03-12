//
//  MainCollectionViewController.m
//  InstagramApp
//
//  Created by Neha Kallem on 3/10/15.
//  Copyright (c) 2015 Neha Kallem. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "CustomCollectionViewCell.h"
@interface MainCollectionViewController () {
    DataGrabber *dataGrabber;
    BOOL checkScroll;
    
}

@end

@implementation MainCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const instagramUrl = @"https://api.instagram.com/v1/tags/selfie/media/recent/?client_id=5f9365e9f1054aa991726d731c65aa02";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thePhotoArray = [[NSMutableArray alloc] init];
    checkScroll = YES;
    
    dataGrabber = [[DataGrabber alloc] init];
    dataGrabber.dataGrabberDelegate = self;
//    [dataGrabber getFreshData];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];


    self.collectionView.collectionViewLayout = layout;
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
        
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.thePhotoArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell setImageWithData:[self.thePhotoArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - DataGrabber delegate

-(void) provide:(NSArray *)freshData{
    
    [self.thePhotoArray addObjectsFromArray:freshData];
    [self.collectionView reloadData];
    checkScroll = YES;
    
    NSLog(@"checkScroll = YES");
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return CGSizeMake(150,150);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //Check if teh user scrolls to bottom - Get latest feed
    if(checkScroll){
        
        NSInteger currentOffset = scrollView.contentOffset.y;
        NSInteger maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
        
        if (maximumOffset - currentOffset <= 10.0) {
            checkScroll = NO;

            [dataGrabber getFreshData];
                NSLog(@"checkScroll = NO");
        }
    }
}



@end
