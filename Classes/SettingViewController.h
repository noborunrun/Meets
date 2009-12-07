//
//  SettingViewController.h
//  Meets
//
//  Created by yanagisawa.n on 12/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate> {
	IBOutlet UITextField *name;
	IBOutlet UITextView *profile;
	IBOutlet UIImageView *pict;
	
}

@property (nonatomic, retain) UITextField *name;
@property (nonatomic, retain) UITextView *profile;
@property (nonatomic, retain) UIImageView *pict;

-(IBAction) storageProfile:(id)sender;
-(IBAction) setImage:(id)sender;

@end
	