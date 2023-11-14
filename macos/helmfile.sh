#! /usr/bin/env bash

# set -x

HELMFILE_VERSION="0.157.0"
HELMFILE_SHA256SUM_arm64="7104b877e9004879e0b12f1bf3e363b152c1701e07e2f18ebf8495902e5e3009"
ARCH="arm64"

SHA256SUM="HELMFILE_SHA256SUM_${ARCH}"
CURL_OUT="helmfile.tar.gz"

# https://github.com/helmfile/helmfile/releases/download/v0.157.0/helmfile_0.157.0_darwin_arm64.tar.gz
curl -L -o "${CURL_OUT}" \
    "https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_darwin_${ARCH}.tar.gz"

echo "Downloaded SHA256: $(sha256sum ${CURL_OUT})"
echo "${!SHA256SUM} ${CURL_OUT}" | sha256sum -c -

tar -xzf "${CURL_OUT}" helmfile
rm -f "${CURL_OUT}"

mv helmfile /usr/local/bin/helmfile
chmod +x /usr/local/bin/helmfile

helmfile --version
