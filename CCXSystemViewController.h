#import "CCXControlCenterViewController.h"

@interface CCXSystemViewController : UIViewController
@property(nonatomic, retain) UIView *backgroundView;
@property(nonatomic, retain) UIPageControl *pageControl;
@property(nonatomic, retain) CCXControlCenterViewController *cardViewController;
+(id)sharedInstance;
-(void)setRevealProgress:(CGFloat)arg1;
@end
