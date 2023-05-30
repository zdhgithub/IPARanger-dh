# export TARGET = iphone:clang:14.5:14.5

ROOTLESS = 1

ifeq ($(ROOTLESS),1)
    THEOS_PACKAGE_SCHEME=rootless
endif

ifeq ($(THEOS_PACKAGE_SCHEME), rootless)
    TARGET = iphone:clang:latest:15.0
else
    TARGET = iphone:clang:latest:12.0
endif

INSTALL_TARGET_PROCESSES = IPARanger
ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk
GO_EASY_ON_ME = 1
APPLICATION_NAME = IPARanger

SOURCES = $(shell find . -name 'IPAR*.m')

IPARanger_FILES = main.m $(SOURCES)
IPARanger_FRAMEWORKS = UIKit CoreGraphics
IPARanger_CFLAGS = -fobjc-arc
IPARanger_CODESIGN_FLAGS = -Sentitlements.plist
IPARanger_INSTALL_PATH = /var/jb/Applications


include $(THEOS_MAKE_PATH)/application.mk
