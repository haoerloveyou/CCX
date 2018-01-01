#import "headers.h"

%hook CCUIModularControlCenterOverlayViewController
%property(nonatomic, retain) CCXSystemViewController *controlCenterX;
//-(CGRect)overlayContainerFrame;
-(void)viewDidLoad {
  %orig;
  self.controlCenterX = [[CCXSystemViewController alloc] init];
}
%end
