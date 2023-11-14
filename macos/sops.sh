#! /usr/bin/env bash

set -x

SOPS_VERSION="v3.8.1"
SOPS_SHA256SUM_arm64="b5d172960c135c7b8cd9719cee94283bccdf5c046c7563391eee8dd4882d6573"
ARCH="arm64"

CURL_OUT="sops"
SHA256SUM="SOPS_SHA256SUM_${ARCH}"

curl -L -o "${CURL_OUT}" \
    "https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.darwin.${ARCH}"

echo "Downloaded SHA256: $(sha256sum ${CURL_OUT})"
echo "${!SHA256SUM} ${CURL_OUT}" | sha256sum -c -

mv "${CURL_OUT}" /usr/local/bin/sops
chmod +x /usr/local/bin/sops

sops --version
