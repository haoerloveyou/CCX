#import "CCXSettingsCardViewController.h"
#import "CCXMediaCardViewController.h"

@interface CCXControlCenterViewController : UIViewController
@property(nonatomic, retain) UIScrollView *cardScrollView;
@property(nonatomic, retain) CCXSettingsCardViewController *settingsCard;
@property(nonatomic, retain) CCXMediaCardViewController *mediaCard;
@end
