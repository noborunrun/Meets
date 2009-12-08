	//
	//  SetPasscodeViewController.m
	//  Meets
	//
	//  Created by yanagisawa.n on 12/8/09.
	//  Copyright 2009 __MyCompanyName__. All rights reserved.
	//

#import "SetPasscodeViewController.h"
#import "MeetsAppDelegate.h"

@implementation SetPasscodeViewController
@synthesize managedObjectContext,fetchedResultsController;
@synthesize no1,no2,no3,no4,_passcode,appDelegate;



	// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		appDelegate = (MeetsAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.managedObjectContext = appDelegate.managedObjectContext;

		NSError *error = nil;
		if (![[self fetchedResultsController] performFetch:&error]) {
			/*
			 Replace this implementation with code to handle the error appropriately.
			 
			 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
			 */
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			abort();
		}

		id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:0];

		NSLog(@"%@",[sectionInfo numberOfObjects]);
		if ([sectionInfo numberOfObjects] == nil) {
			_passcode = nil;
		}else {
			NSManagedObject *managedObject = [fetchedResultsController objectAtIndexPath:0];
			
			NSLog(@"%@",[[managedObject valueForKey:@"PASSCODE"] description]);	
			_passcode = [[managedObject valueForKey:@"PASSCODE"] description];			
		}

		
	}
	return self;
}


	// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
		// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
		// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
		// Release any retained subviews of the main view.
		// e.g. self.myOutlet = nil;
}

-(IBAction) setPasscode:(id)sender {
	NSLog(@"%d,%d,%d,%d",[no1.text length],[no2.text length],[no3.text length],[no4.text length]);
	if ([no1.text length] == 1 && [no2.text length] == 1 && [no3.text length] == 1 && [no4.text length] == 1 ) {
		_passcode = [[NSString alloc] initWithFormat:@"%@%@%@%@",no1.text,no2.text,no3.text,no4.text];
		[self insertNewObject];
	}else {
			//abort();
	}
	
}

-(id)getPasscode {
	NSManagedObject *managedObject = [fetchedResultsController objectAtIndexPath:0];
	return [[managedObject valueForKey:@"PASSCODE"] description];	
}

#pragma mark -
#pragma mark Add a new object

- (void)insertNewObject {
	
		// Create a new instance of the entity managed by the fetched results controller.
	NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
	NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
	NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
	NSLog(@"%@",[entity name]);
		// If appropriate, configure the new managed object.
		//ここでデータを入れる
	[newManagedObject setValue:_passcode forKey:@"PASSCODE"];
	
		// Save the context.
	NSError *error = nil;
	if (![context save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
}
#pragma mark -
#pragma mark Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController {
	
		//	if (fetchedResultsController != nil) {
		//		return fetchedResultsController;
		//	}
	
	/*
	 Set up the fetched results controller.
	 */
		// Create the fetch request for the entity.
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
		// Edit the entity name as appropriate.
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"PASSCODE" inManagedObjectContext:managedObjectContext];
	[fetchRequest setEntity:entity];
	
		// Set the batch size to a suitable number.
	[fetchRequest setFetchBatchSize:20];
	
		// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"PASSCODE" ascending:NO];
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
	
	[fetchRequest setSortDescriptors:sortDescriptors];
	
		// Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
	NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
	aFetchedResultsController.delegate = self;
	self.fetchedResultsController = aFetchedResultsController;
	
	[aFetchedResultsController release];
	[fetchRequest release];
	[sortDescriptor release];
	[sortDescriptors release];
	
	return fetchedResultsController;
}    


	// NSFetchedResultsControllerDelegate method to notify the delegate that all section and object changes have been processed. 
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
		// In the simplest, most efficient, case, reload the table view.
	
	[self.navigationController popViewControllerAnimated:YES];
}

/*
 Instead of using controllerDidChangeContent: to respond to all changes, you can implement all the delegate methods to update the table view in response to individual changes.  This may have performance implications if a large number of changes are made simultaneously.
 
 // Notifies the delegate that section and object changes are about to be processed and notifications will be sent. 
 - (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
 [self.tableView beginUpdates];
 }
 
 - (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
 // Update the table view appropriately.
 }
 
 - (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
 // Update the table view appropriately.
 }
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
 [self.tableView endUpdates];
 } 
 */

- (void)dealloc {
	[super dealloc];
}


@end
