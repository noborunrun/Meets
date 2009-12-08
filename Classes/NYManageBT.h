//
//  NYManageBT.h
//  Meets
//
//  Created by yanagisawa.n on 12/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface NYManageBT : UIView <GKSessionDelegate>{
	GKSession *mySession;
	NSDictionary *_sendData;
	id delegate;
}
@property (nonatomic, retain) NSDictionary *_sendData;
@property (nonatomic, retain) id delegate;
@end
