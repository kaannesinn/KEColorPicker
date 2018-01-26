//
//  ColorsViewController.m
//  KEColorPicker
//
//  Created by Kaan Esin on 25.01.2018.
//  Copyright © 2018 Kaan Esin. All rights reserved.
//

#import "ColorsViewController.h"
#import "ColorsCollectionViewCell.h"

@interface ColorsViewController ()

@property (nonatomic,strong) NSMutableArray *colors;

@end

@implementation ColorsViewController

-(NSMutableArray *)colors{
    if (!_colors) {
        _colors = [[NSMutableArray alloc] init];
        
        for (int i=0; i<255; i++) {
            [_colors addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:i/255.0 green:0/255.0 blue:0/255.0 alpha:1.0], @"color", @0, @"isImgSelected", nil]];
        }
        
        for (int i=0; i<255; i++) {
            [_colors addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0/255.0 green:i/255.0 blue:0/255.0 alpha:1.0], @"color", @0, @"isImgSelected", nil]];
        }
        
        for (int i=0; i<255; i++) {
            [_colors addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:i/255.0 alpha:1.0], @"color", @0, @"isImgSelected", nil]];
        }
        
        [self.colorCollectionView reloadData];
    }
    return _colors;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark collection
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.colors.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"ColorsCollectionViewCell";
    ColorsCollectionViewCell *cell = (ColorsCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.imgForColor.backgroundColor = [[self.colors objectAtIndex:indexPath.row] objectForKey:@"color"];
    cell.imgForColor.layer.masksToBounds = YES;
    cell.imgForColor.layer.borderColor = [[[self.colors objectAtIndex:indexPath.row] objectForKey:@"isImgSelected"] boolValue] ? [UIColor whiteColor].CGColor : [UIColor clearColor].CGColor;
    cell.imgForColor.layer.borderWidth = [[[self.colors objectAtIndex:indexPath.row] objectForKey:@"isImgSelected"] boolValue] ? 3.0 : 0.0;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for (int i=0; i<self.colors.count; i++) {
        NSMutableDictionary *tempDict = [self.colors objectAtIndex:i];
        [tempDict setObject:[NSNumber numberWithBool:i==indexPath.row] forKey:@"isImgSelected"];
        [self.colors replaceObjectAtIndex:i withObject:[tempDict mutableCopy]];
    }
    [collectionView reloadData];
    
    [self.delegate colorSelected:[[self.colors objectAtIndex:indexPath.row] objectForKey:@"color"]];
    [self dismissColorVC:nil];
}

- (IBAction)dismissColorVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
