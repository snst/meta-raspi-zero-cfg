SUMMARY = "bitbake-layers recipe"
DESCRIPTION = "Recipe created by bitbake-layers"
LICENSE="CLOSED"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

MY_WIFI_SSID ?= "ssid"
MY_WIFI_PASSWORD ?= "password"


SRC_URI += "file://wpa_supplicant-wlan0.conf"


do_install_append() {

	sed -i -e 's#[@]MY_WIFI_SSID[@]#${MY_WIFI_SSID}#' ${WORKDIR}/wpa_supplicant-wlan0.conf
	sed -i -e 's#[@]MY_WIFI_PASSWORD[@]#${MY_WIFI_PASSWORD}#' ${WORKDIR}/wpa_supplicant-wlan0.conf

	install -d ${D}${sysconfdir}/wpa_supplicant
	install -m 0755 ${WORKDIR}/wpa_supplicant-wlan0.conf ${D}${sysconfdir}/wpa_supplicant

	install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants
	ln -sf ${systemd_unitdir}/system/wpa_supplicant@.service ${D}${sysconfdir}/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service
}
