DEBUG = 1
THEOS_DEVICE_IP = 192.168.2.24
ARCHS = arm64 
TARGET = iphone:latest:8.0  
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = demo3
demo3_FILES = Tweak.xm fishhook.c
demo3_FRAMEWORKS = UIKit 
include $(THEOS_MAKE_PATH)/Tweak.mk

after-install::
	install.exec "killall -9 WeChat"
clean::
	rm -rf ./packages/*
	rm -rf ./.theos/*