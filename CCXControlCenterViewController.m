#import "CCXControlCenterViewController.h"

@implementation CCXControlCenterViewController
-(id)init {
  self = [super init];

  self.cardScrollView = [[UIScrollView alloc] init];
  self.cardScrollView.scrollEnabled = YES;
  self.cardScrollView.pagingEnabled = YES;
  self.cardScrollView.showsVerticalScrollIndicator = NO;
  self.cardScrollView.showsHorizontalScrollIndicator = NO;
  [self.view addSubview:self.cardScrollView];

  self.settingsCard = [[CCXSettingsCardViewController alloc] init];
  [self.cardScrollView addSubview:self.settingsCard.view];

  self.mediaCard = [[CCXMediaCardViewController alloc] init];
  [self.cardScrollView addSubview:self.mediaCard.view];

  return self;
}
-(void)viewDidLayoutSubviews {
  self.cardScrollView.frame = self.view.bounds;
  self.cardScrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, self.view.frame.size.height);

  self.settingsCard.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
  self.mediaCard.view.frame = CGRectMake(self.view.frame.size.width,0,self.view.frame.size.width, self.view.frame.size.height);
}
@end
