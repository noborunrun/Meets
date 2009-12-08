//
//  ListView.h
//  Meets
//
//  Created by yanagisawa.n on 12/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NYManageBT;
@class MeetsAppDelegate;

@interface ListView : UITableViewController <UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
	NYManageBT *manageBT;
	IBOutlet UITableView *tableView;
	IBOutlet UILabel *passcode;
	MeetsAppDelegate *appDelegate;
	
}
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (readwrite, assign) MeetsAppDelegate *appDelegate;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UILabel *passcode;
@property (nonatomic, retain) NYManageBT *manageBT;

-(IBAction) showSetPasscodeView:(id)sender;

@end
