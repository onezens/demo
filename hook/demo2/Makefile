DEBUG = 1
THEOS_DEVICE_IP = 192.168.2.24
ARCHS = arm64 
TARGET = iphone:latest:8.0  
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = demo1
demo1_FILES = Tweak.xm
demo1_FRAMEWORKS = UIKit 
include $(THEOS_MAKE_PATH)/Tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
clean::
	rm -rf ./packages/*
	rm -rf ./.theos/*
