################################################################################
#
# iwlwifi-210
#
################################################################################

IWLWIFI_210_DEPENDENCIES = linux-firmware

LINUX_FIRMWARE_FILES += iwlwifi-ty-*.{ucode,pnvm}
LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware

$(eval $(virtual-package))
