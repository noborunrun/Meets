//
//  SetPasscodeViewController.h
//  Meets
//
//  Created by yanagisawa.n on 12/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeetsAppDelegate;

@interface SetPasscodeViewController : UIViewController <NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *fetchedResultsController;
	NSManagedObjectContext *managedObjectContext;
	
	IBOutlet UITextField *no1;
	IBOutlet UITextField *no2;
	IBOutlet UITextField *no3;
	IBOutlet UITextField *no4;
	NSString *_passcode;
	MeetsAppDelegate *appDelegate;
	//NSNumber *passcode;
}
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (readwrite, assign) MeetsAppDelegate *appDelegate;
@property (nonatomic, retain) UITextField *no1;
@property (nonatomic, retain) UITextField *no2;
@property (nonatomic, retain) UITextField *no3;
@property (nonatomic, retain) UITextField *no4;
@property (nonatomic, retain) NSString *_passcode;

-(IBAction) setPasscode:(id)sender;
-(id)getPasscode;

@end
