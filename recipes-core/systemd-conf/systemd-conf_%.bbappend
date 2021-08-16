FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
file://00-eth.network \
file://00-wlan.network \
"

FILES_${PN} += " \
${sysconfdir}/systemd/network/00-eth.network \
${sysconfdir}/systemd/network/00-wlan.network \
"

do_install_append () {
 # Install into systemd configuration directories
 install -d ${D}${sysconfdir}/systemd/network

 install -m 0644 ${WORKDIR}/00-eth.network ${D}${sysconfdir}/systemd/network
 install -m 0644 ${WORKDIR}/00-wlan.network ${D}${sysconfdir}/systemd/network
}
