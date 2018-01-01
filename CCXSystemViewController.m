#import "CCXSystemViewController.h"
int ccheight;
@implementation CCXSystemViewController
__strong static id _sharedObject;

-(id)init {
  self = [super init];

  _sharedObject = self;

  self.backgroundView = [[UIView alloc] init];
  self.backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
  [self.view addSubview:self.backgroundView];

  self.pageControl = [[UIPageControl alloc] init];
  self.pageControl.numberOfPages = 2;
  self.pageControl.currentPage = 0;
  [self.view addSubview:self.pageControl];

  self.cardViewController = [[CCXControlCenterViewController alloc] init];
  [self.view addSubview:self.cardViewController.view];

  return self;
}

+ (id)sharedInstance
{
	return _sharedObject;
}

-(void)viewDidLayoutSubviews {
  ccheight = self.view.frame.size.height * 0.612;

  double height = self.view.frame.size.height;

  self.pageControl.frame = CGRectMake(self.view.frame.size.width / 2 - 15, height - (height * 0.022), 30, (height * 0.022));
  self.backgroundView.frame = [UIScreen mainScreen].bounds;
  self.cardViewController.view.frame = CGRectMake(0, height - ccheight - (height * 0.022), self.view.frame.size.width, ccheight);
}

-(void)setRevealProgress:(CGFloat)arg1 {
  if(arg1 < 0.9){
    [self displayPageControl:FALSE animated:TRUE];
  } else {
    [self displayPageControl:TRUE animated:TRUE];
  }

  self.backgroundView.alpha = arg1;

  double offset = (ccheight * (1 - arg1));

  if(offset < 0){
    offset = 0;
  }

  self.cardViewController.view.frame = CGRectMake(0, (self.view.frame.size.height - ccheight) + offset - self.view.frame.size.height * 0.022, self.view.frame.size.width, ccheight);

}
-(void)displayPageControl:(BOOL)arg1 animated:(BOOL)arg2{
  if(arg2){
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];

    if(arg1){
      self.pageControl.alpha = 1;
    } else {
      self.pageControl.alpha = 0;
    }

    [UIView commitAnimations];
  } else {
    self.pageControl.hidden = arg1;
  }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.view.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page; // you need to have a **iVar** with getter for pageControl
}
@end
