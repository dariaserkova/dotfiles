#! /usr/bin/env bash

HELM_VERSION="v3.12.3"
HELM_SHA256SUM_arm64="240b0a7da9cae208000eff3d3fb95e0fa1f4903d95be62c3f276f7630b12dae1"
HELM_PLUGIN_SECRETS_VERSION="4.5.1"
HELM_PLUGIN_DIFF_VERSION="3.8.1"
HELM_PLUGIN_CM_PUSH_VERSION="0.10.4"
ARCH="arm64"

SHA256SUM="HELM_SHA256SUM_${ARCH}"
CURL_OUT="helm.tar.gz"

# https://get.helm.sh/helm-v3.12.3-darwin-arm64.tar.gz
curl -L -o "${CURL_OUT}" \
    "https://get.helm.sh/helm-${HELM_VERSION}-darwin-${ARCH}.tar.gz"

echo "Downloaded SHA256: $(sha256sum ${CURL_OUT})"
echo "${!SHA256SUM} ${CURL_OUT}" | sha256sum -c -

tar --strip-components=1 -xzf "${CURL_OUT}" "darwin-${ARCH}/helm"
rm -rf "${CURL_OUT}"

mv helm /usr/local/bin/helm
chmod +x /usr/local/bin/helm

helm version

helm plugin install https://github.com/jkroepke/helm-secrets \
    --version "${HELM_PLUGIN_SECRETS_VERSION}"

rm -rf /root/.local/share/helm/plugins/helm-secrets/.git

helm secrets --version


helm plugin install https://github.com/databus23/helm-diff \
    --version "${HELM_PLUGIN_DIFF_VERSION}"

rm -rf /root/.local/share/helm/plugins/helm-diff/.git

helm diff version


helm plugin install https://github.com/chartmuseum/helm-push \
    --version "${HELM_PLUGIN_CM_PUSH_VERSION}"

rm -rf /root/.local/share/helm/plugins/helm-push/.git

helm push --help
