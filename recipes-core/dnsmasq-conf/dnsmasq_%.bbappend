FILESEXTRAPATHS_prepend := "${THISDIR}/dnsmasq:"
SRC_URI += " file://001-dnsmasq-conf.patch;patchdir=${WORKDIR}/ "

# Capture ${THISDIR} during Parsing with the walrus operator as it is unstable come build time.
THIS_APPEND_DIR := "${THISDIR}"

