#!/bin/sh

set -ex

# Make sure we copy over the expected iwlwifi firmware files.
# The Buildroot linux-firmware package is only copying over iwlwifi-so-a0-gf-a0*.{ucode,pnvm},
# but the `iwlwifi` driver is looking for iwlwifi-ty-a0-gf-a0*.{ucode,pnvm} files.
cp $BUILD_DIR/linux-firmware-20250211/iwlwifi-ty-a0-gf-a0*.ucode $TARGET_DIR/lib/firmware
cp $BUILD_DIR/linux-firmware-20250211/iwlwifi-ty-a0-gf-a0.pnvm $TARGET_DIR/lib/firmware

# Create the fwup ops script for handling MicroSD/eMMC operations at runtime
mkdir -p $TARGET_DIR/usr/share/fwup

$HOST_DIR/usr/bin/fwup -c \
  -f $NERVES_DEFCONFIG_DIR/fwup-ops.conf \
  -o $TARGET_DIR/usr/share/fwup/ops.fw

ln -sf ops.fw $TARGET_DIR/usr/share/fwup/revert.fw

# Copy the fwup includes to the images dir
cp -rf $NERVES_DEFCONFIG_DIR/fwup_include $BINARIES_DIR
