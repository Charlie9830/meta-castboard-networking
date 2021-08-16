# Includes a patch for the hostapd.service file that includes a 15 second delay to the daemon starting. This negates it trying to ping the wlan interface before the card firmware is ready.
# Also includes our own hostapd.conf file. This file isn't appended via the SRC_URI variable as it the orignal we are replacing comes from the hostapd repo instead of the files associated with the recipe.
# Therefore we 'manually' swap it out via the do_install_append() function.
FILESEXTRAPATHS_prepend := "${THISDIR}/hostapd:"
#SRC_URI += " file://hostapd.patch;patchdir=${WORKDIR}/ "

# Capture ${THISDIR} during Parsing with the walrus operator as it is unstable come build time.
THIS_APPEND_DIR := "${THISDIR}"

# The hostapd recipe disables auto run by default. Re enable it here.
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

do_install_append () {
 # Replace the default "hostapd.conf" file provided by the package with our own.
 install -m 0644 ${THIS_APPEND_DIR}/hostapd/hostapd.conf ${D}${sysconfdir}
}



