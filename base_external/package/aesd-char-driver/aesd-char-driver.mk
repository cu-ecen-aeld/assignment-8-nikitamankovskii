################################################################################
#
# aesd-char-driver
#
################################################################################

AESD_CHAR_DRIVER_VERSION = 81a98e771ca02d24b54ef952dc507eec79f96463

AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-nikitamankovskii.git
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver

define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0644 $(@D)/aesd-char-driver/aesdchar.ko \
		$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/aesdchar.ko
	$(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED) || true
endef

$(eval $(kernel-module))
$(eval $(generic-package))

