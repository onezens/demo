include $(THEOS)/makefiles/common.mk

TWEAK_NAME = demo1
demo1_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/Tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
