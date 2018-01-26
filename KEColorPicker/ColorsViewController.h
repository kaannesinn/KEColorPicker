//
//  ColorsViewController.h
//  KEColorPicker
//
//  Created by Kaan Esin on 25.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorsViewControllerDelegate <NSObject>

-(void)colorSelected:(UIColor*)selectedColor;

@end

@interface ColorsViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *colorCollectionView;
@property (nonatomic,assign) id<ColorsViewControllerDelegate> delegate;

- (IBAction)dismissColorVC:(id)sender;

@end
