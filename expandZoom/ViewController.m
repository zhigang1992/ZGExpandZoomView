//
//  ViewController.m
//  expandZoom
//
//  Created by Kyle Fang on 6/24/13.
//  Copyright (c) 2013 Kyle Fang. All rights reserved.
//

#import "ViewController.h"


static CGFloat kImageOriginHight = 240.f;

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *expandZoomImageView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.contentInset = UIEdgeInsetsMake(kImageOriginHight, 0, 0, 0);
    [self.tableView addSubview:self.expandZoomImageView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.expandZoomImageView.frame = CGRectMake(0, -kImageOriginHight, self.tableView.frame.size.width, kImageOriginHight);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    if (yOffset < -kImageOriginHight) {
        CGRect f = self.expandZoomImageView.frame;
        f.origin.y = yOffset;
        f.size.height =  -yOffset;
        self.expandZoomImageView.frame = f;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
