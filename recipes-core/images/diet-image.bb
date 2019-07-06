require recipes-core/images/core-image-base.bb
#require meta-raspberrypi/recipes-core/images/rpi-basic-image.bb

IMAGE_INSTALL_append = " linux-firmware-bcm43430 i2c-tools python-smbus wpa-supplicant systemd-analyze openssh"

DISTRO_FEATURES_append = " systemd wifi"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"