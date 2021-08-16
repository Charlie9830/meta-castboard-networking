FILESEXTRAPATHS_prepend := "${THISDIR}/nginx:"
SRC_URI += " file://001-nginx-conf.patch;patchdir=${WORKDIR}/ "

# Capture ${THISDIR} during Parsing with the walrus operator as it is unstable come build time.
THIS_APPEND_DIR := "${THISDIR}"

