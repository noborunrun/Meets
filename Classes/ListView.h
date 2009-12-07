//
//  ListView.h
//  Meets
//
//  Created by yanagisawa.n on 12/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListView : UITableViewController <UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *tableView;
}
@property (nonatomic, retain) UITableView *tableView;

@end
