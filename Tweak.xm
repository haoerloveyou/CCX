#import "headers.h"

%hook CCUIModularControlCenterOverlayViewController
%property(nonatomic, retain) CCXSystemViewController *controlCenterX;
-(void)viewDidLoad {
  %orig;

  self.overlayBackgroundView.tag = 2912;
  self.overlayBackgroundView.hidden = TRUE;

  self.overlayHeaderView.hidden = TRUE;

  self.controlCenterX = [[CCXSystemViewController alloc] init];
  self.controlCenterX.view.frame = CGRectMake(0,self.overlayScrollView.contentOffset.y,self.view.frame.size.width, self.view.frame.size.height);

  for(UIView *subview in self.overlayScrollView.subviews){
    [subview removeFromSuperview];
  }

  [self.overlayScrollView addSubview:self.controlCenterX.view];
  [self.overlayScrollView sendSubviewToBack:self.controlCenterX.view];
}
%end

%hook MTMaterialView
-(void)setWeighting:(CGFloat)arg1 {
  %orig;
  if(self.tag == 2912)
  [[CCXSystemViewController sharedInstance] setRevealProgress:arg1];
}
%end


@interface CCSModuleRepository : NSObject
@end

@interface CCSModuleMetadata : NSObject
+(instancetype)metadataForBundleAtURL:(id)arg1 ;
@property (nonatomic,copy,readonly) NSString* moduleIdentifier;
@end

%hook CCSModuleRepository
- (id)_loadAllModuleMetadata {
	NSArray *_directoryURLs = [self valueForKey:@"_directoryURLs"];
	NSMutableArray *modulesDict = [NSMutableArray new];
	for (NSURL *repositoryURL in _directoryURLs) {
		NSError *error = nil;
		NSArray *bundleURLs = [[NSFileManager defaultManager] contentsOfDirectoryAtURL:repositoryURL
															includingPropertiesForKeys:nil
                   															   options:(NSDirectoryEnumerationSkipsHiddenFiles)
                   																 error:&error];

		if (bundleURLs) {
			for (NSURL *bundleURL in bundleURLs) {
				if ([[bundleURL pathExtension] caseInsensitiveCompare:@"bundle"] == NSOrderedSame) {
					CCSModuleMetadata *metadata = [NSClassFromString(@"CCSModuleMetadata") metadataForBundleAtURL:bundleURL];
					if (metadata) {
						[modulesDict addObject: metadata];

					}
				}
			}
		}
	}

	return modulesDict;
}
%end
