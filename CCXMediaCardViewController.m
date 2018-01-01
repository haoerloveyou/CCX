#import "CCXMediaCardViewController.h"
int offsetm = 12;
@implementation CCXMediaCardViewController
-(id)init {
  self = [super init];

  self.backdropView = [[CCXCardBackdropView alloc] init];
  [self.view addSubview:self.backdropView];

  return self;
}
-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(offsetm, 0, self.view.frame.size.width - offsetm*2, self.view.frame.size.height);
}
@end
