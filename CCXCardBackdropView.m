#import "CCXCardBackdropView.h"

@implementation CCXCardBackdropView
-(id)init {
  self = [super init];

  _UIBackdropViewSettings *settings = [_UIBackdropViewSettings settingsForStyle:2060];
  self.backdropView = [[_UIBackdropView alloc] initWithSettings:settings];
  [self addSubview:self.backdropView];

  self.layer.cornerRadius = 13;
  self.clipsToBounds = TRUE;
  
  return self;
}
-(void)layoutSubviews {
  self.backdropView.frame = self.bounds;
}
@end
