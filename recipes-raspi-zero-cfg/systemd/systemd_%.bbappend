PACKAGECONFIG += "networkd resolved"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " file://wireless.network"
SRC_URI += " file://wifi.service"


FILES_${PN} += "${sysconfdir}/systemd/network/wireless.network"


do_install_append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 0755 ${WORKDIR}/wireless.network ${D}${sysconfdir}/systemd/network

    install -d ${D}${sysconfdir}/systemd/system
	install -m 0755 ${WORKDIR}/wifi.service ${D}${sysconfdir}/systemd/system

	install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants
	ln -sf ${systemd_unitdir}/system/wifi.service ${D}${sysconfdir}/systemd/system/multi-user.target.wants/wifi.service
}

