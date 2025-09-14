################################################################################
#
# iwlwifi-210
#
################################################################################

IWLWIFI_210_DEPENDENCIES = linux-firmware

ifeq ($(BR2_PACKAGE_IWLWIFI_210),y)
LINUX_FIRMWARE_FILES += iwlwifi-ty-*.{ucode,pnvm}
LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
endif

$(eval $(virtual-package))
