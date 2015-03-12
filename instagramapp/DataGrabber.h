//
//  DataGrabber.h
//  InstagramApp
//
//  Created by Neha Kallem on 3/10/15.
//  Copyright (c) 2015 Neha Kallem. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataGrabberDelegate <NSObject>
@optional
-(void) provide:(NSArray *)freshData;
@end


@interface DataGrabber : NSObject

@property (nonatomic, assign) id <DataGrabberDelegate> dataGrabberDelegate;

-(void) getFreshData;

@end

