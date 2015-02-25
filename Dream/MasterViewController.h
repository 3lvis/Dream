//
//  MasterViewController.h
//  Dream
//
//  Created by Elvis Nuñez on 2/25/15.
//  Copyright (c) 2015 Elvis Nuñez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

