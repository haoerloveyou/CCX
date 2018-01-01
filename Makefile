include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CCX
CCX_FILES = Tweak.xm $(wildcard *.m)
CCX_FRAMEWORKS = UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
