#import "CCXSystemViewController.h"

@interface CCUIModularControlCenterOverlayViewController : UIViewController
@property(nonatomic, retain) CCXSystemViewController *controlCenterX;
@property(nonatomic, retain) UIView *overlayModuleCollectionView;
@property(nonatomic, retain) UIScrollView *overlayScrollView;
@property(nonatomic, retain) UIView *overlayBackgroundView;
@property(nonatomic, retain) UIView *overlayHeaderView;
-(void)_updatePresentationForLocationY:(double)arg1 ;
@end

@interface MTMaterialView : UIView
@end
