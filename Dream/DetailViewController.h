//
//  DetailViewController.h
//  Dream
//
//  Created by Elvis Nuñez on 2/25/15.
//  Copyright (c) 2015 Elvis Nuñez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

