//
//  ViewController.m
//  LPFCollectionViewArcLayout
//
//  Created by Roc on 2017/4/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "ViewController.h"
#import "LPFArcLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LPFArcLayout * layout = [[LPFArcLayout alloc]init];
    layout.itemSize = CGSizeMake(200, 200);
    UICollectionView * collectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(0,50, [UIScreen mainScreen].bounds.size.width, 400) collectionViewLayout:layout];
    collectionView.delegate=self;
    collectionView.dataSource=self;
    self.collectionView = collectionView;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collectionView];
    
    
    NSLog(@"1234");
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if ([self.collectionView.collectionViewLayout isKindOfClass:[LPFArcLayout class]]) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(200, 200);
        [self.collectionView setCollectionViewLayout:layout animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[LPFArcLayout alloc] init] animated:YES];
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 100;
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
