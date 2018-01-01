#import "CCXSettingsCardViewController.h"
int offset = 12;
@implementation CCXSettingsCardViewController
-(id)init {
  self = [super init];

  self.backdropView = [[CCXCardBackdropView alloc] init];
  [self.view addSubview:self.backdropView];

  return self;
}
-(void)viewDidLayoutSubviews {
  self.backdropView.frame = CGRectMake(offset, 0, self.view.frame.size.width - offset*2, self.view.frame.size.height);
}
@end
