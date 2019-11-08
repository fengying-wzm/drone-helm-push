#! /bin/bash -eu

set -o pipefail

CHART = "$PLUGIN_CHART"
CERT = "$PLUGIN_CERT"
USERNAME = "$PLUGIN_USERNAME"
PASSWORD = "$PLUGIN_PASSWORD"
REPO = "$PLUGIN_REPO"

helm package $CHART

helm push --ca-file $CERT --username $USERNAME --password $PASSWORD *.tgz $REPO
