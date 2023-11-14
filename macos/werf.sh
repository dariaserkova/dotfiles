#! /usr/bin/env bash

WERF_VERSION="1.2.248"
ARCH="arm64"
WERF_SHA256SUM_arm64="03f591ca4f4f29814f6a724bbf4fa38f0b4269368adb88a1f0215e43a50ddca9"

SHA256SUM="WERF_SHA256SUM_${ARCH}"
CURL_OUT="werf"

curl -L -o "${CURL_OUT}" \
        "https://tuf.werf.io/targets/releases/${WERF_VERSION}/darwin-${ARCH}/bin/werf"

echo "Downloaded SHA256: $(sha256sum ${CURL_OUT})"
echo "${!SHA256SUM} ${CURL_OUT}" | sha256sum -c -

mv "${CURL_OUT}" /usr/local/bin/werf
chmod +x /usr/local/bin/werf

werf version
