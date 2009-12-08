	//
	//  ListView.m
	//  Meets
	//
	//  Created by yanagisawa.n on 12/7/09.
	//  Copyright 2009 __MyCompanyName__. All rights reserved.
	//

#import "ListView.h"
#import "SetPasscodeViewController.h"
#import "NYManageBT.h"
#import "MeetsAppDelegate.h"

@implementation ListView
@synthesize tableView,passcode,manageBT,appDelegate;
@synthesize managedObjectContext,fetchedResultsController;

NSMutableString *_passcode;
SetPasscodeViewController *setPasscodeViewController;

-(IBAction) showSetPasscodeView:(id)sender {
	[self showSetPasscodeView];
}
/*
 - (id)initWithStyle:(UITableViewStyle)style {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 if (self = [super initWithStyle:style]) {
 }
 return self;
 }
 */
-(void) showSetPasscodeView {
	setPasscodeViewController = [[SetPasscodeViewController alloc] initWithNibName:@"SetPasscodeViewController" bundle:Nil];
		//	setPasscodeViewController.managedObjectContext = self.managedObjectContext;	
	[self.navigationController pushViewController:setPasscodeViewController animated:YES];
	[setPasscodeViewController release];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	_passcode = [[NSString alloc] init];
	if (setPasscodeViewController == nil) {
	setPasscodeViewController = [[SetPasscodeViewController alloc] initWithNibName:@"SetPasscodeViewController" bundle:Nil];
		//	setPasscodeViewController.managedObjectContext = self.managedObjectContext;
  _passcode = setPasscodeViewController._passcode;
	}	
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
	
		//Passcode取得
	if (_passcode == nil) {
		[self showSetPasscodeView];
	}else {
		passcode.text = [@"現在のパスコード：" stringByAppendingString:setPasscodeViewController._passcode];
	}
	
		//リストデータ取得
	
}


 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
	 _passcode = setPasscodeViewController._passcode;
	 if (_passcode == nil) {
		 passcode.text = [@"現在のパスコード：" stringByAppendingString:@"設定をしてください"];		 
	 }else {
		 passcode.text = [@"現在のパスコード：" stringByAppendingString:setPasscodeViewController._passcode];
	 }
	 
 }
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

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


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [[fetchedResultsController sections] count];
}


	// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	id <NSFetchedResultsSectionInfo> sectionInfo = [[fetchedResultsController sections] objectAtIndex:section];
	return [sectionInfo numberOfObjects];
}


	// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
    // Set up the cell...
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
		// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
		// [self.navigationController pushViewController:anotherViewController];
		// [anotherViewController release];
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
#pragma mark -
#pragma mark Add a new object

- (void)insertNewObject {
	
		// Create a new instance of the entity managed by the fetched results controller.
	NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
	NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
	NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
	
		// If appropriate, configure the new managed object.
		//ここでデータを入れる
		//		[newManagedObject setValue:<#(id)value#> forKey:@"ID"];
		//		[newManagedObject setValue:<#(id)value#> forKey:@"NAME"];
		//		[newManagedObject setValue:<#(id)value#> forKey:@"PICTURE"];
		//		[newManagedObject setValue:<#(id)value#> forKey:@"PROFILE"];
		//		[newManagedObject setValue:<#(id)value#> forKey:@""];
	[newManagedObject setValue:[NSDate date] forKey:@"EXCHANGE_DATE"];
	
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
	
	if (fetchedResultsController != nil) {
		return fetchedResultsController;
	}
	
	/*
	 Set up the fetched results controller.
	 */
		// Create the fetch request for the entity.
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
		// Edit the entity name as appropriate.
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"FRIEND_LIST" inManagedObjectContext:managedObjectContext];
	[fetchRequest setEntity:entity];
	
		// Set the batch size to a suitable number.
	[fetchRequest setFetchBatchSize:20];
	
		// Edit the sort key as appropriate.
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"EXCHANGE_DATE" ascending:NO];
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
	[self.tableView reloadData];
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

