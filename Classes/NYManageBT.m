//
//  NYManageBT.m
//  Meets
//
//  Created by yanagisawa.n on 12/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NYManageBT.h"

#define kSessionID @"_Meets.app"

@implementation NYManageBT
@synthesize _sendData,delegate;

+(void)startBTSessionWithData:(NSDictionary *)sendData{
	_sendData = sendData;
	mySession = [[GKSession alloc] initWithSessionID:kSessionID displayName:nil sessionMode:GKSessionModePeer];
	mySession.delegate = self;
	[mySession setDataReceiveHandler:self withContext:nil];
	mySession.available = YES;
	
	//[self addLog:[NSString stringWithFormat:@"誰かを探し始めた！自分のIDは %@",mySession.peerID]];
}
//- (id)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        // Initialization code
//    }
//    return self;
//}


//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}


- (void)dealloc {
    [super dealloc];
}

#pragma mark GKSessionDelegate

- (void)session:(GKSession *)session connectionWithPeerFailed:(NSString *)peerID withError:(NSError *)error {
	//[self addLog:[NSString stringWithFormat:@"%@ とうまく接続できない。 (%@)",peerID,[error localizedDescription]]];
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error {
	//[self addLog:[NSString stringWithFormat:@"ネットワークがおかしい？ (%@)",[error localizedDescription]]];
}

- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID {
	//[self addLog:[NSString stringWithFormat:@"%@ から接続したいと言われた！",peerID]];
	
	NSError *error;
	if(![mySession acceptConnectionFromPeer:peerID error:&error]) {
	//	[self addLog:[NSString stringWithFormat:@"%@ と接続できなかった… (%@)",peerID,[error localizedDescription]]];
	} else {
	//	[self addLog:[NSString stringWithFormat:@"%@ と接続できた！",peerID]];
		
	}
}

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state {	
	switch (state) {
		case GKPeerStateAvailable:
	//		[self addLog:[NSString stringWithFormat:@"%@ を見つけた！",peerID]];
	//		[self addLog:[NSString stringWithFormat:@"%@ に接続しに行く！",peerID]];
	//		[mySession connectToPeer:peerID withTimeout:10.0f];
			break;
		case GKPeerStateUnavailable:
	//		[self addLog:[NSString stringWithFormat:@"%@ を見失った！",peerID]];
			break;
		case GKPeerStateConnected:
	//		[self addLog:[NSString stringWithFormat:@"%@ が接続した！",peerID]];
	//		[mySession sendData:[[messageTextField text] dataUsingEncoding:NSUTF8StringEncoding] toPeers:[NSArray arrayWithObject:peerID] withDataMode:GKSendDataReliable error:nil];
	//		[self addLog:[NSString stringWithFormat:@"%@ にメッセージを送った！「%@」",peerID,[messageTextField text]]];
			break;
		case GKPeerStateDisconnected:
	//		[self addLog:[NSString stringWithFormat:@"%@ が切断された！",peerID]];
			break;
		case GKPeerStateConnecting:
	//		[self addLog:[NSString stringWithFormat:@"%@ が接続中！",peerID]];
			break;
		default:
			break;
	}
}

- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context {
	//[self addLog:[NSString stringWithFormat:@"%@ からメッセージを受け取った！ 「%@」",peer,[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]]];
}


@end
