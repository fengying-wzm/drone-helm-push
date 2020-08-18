#! /bin/bash

REPO="$PLUGIN_REPO"
echo "REPO -> $REPO"
if [ ! -n "$REPO" ]; then
  echo "settings: REPO not found "
  exit 1
fi

CHART="$PLUGIN_CHART"
echo "CHART -> $CHART"
if [ ! -n "$CHART" ]; then
  echo "settings: CHART not found "
  exit 1
fi

CERT="$PLUGIN_CERT"
echo "CERT -> $CERT"
if [ ! -n "$REPO" ]; then
  CERT=""
else
  echo -e "$CERT" > ./ca.crt
  chmod 777 ./ca.crt
  CERT="--ca-file ./ca.crt"
fi

USERNAME="$PLUGIN_USERNAME"
echo "USERNAME -> $USERNAME"
if [ ! -n "$USERNAME" ]; then
  USERNAME=""
else
  USERNAME="--username $USERNAME"
fi

PASSWORD="$PLUGIN_PASSWORD"
echo "PASSWORD -> $PASSWORD"
if [ ! -n "$PASSWORD" ]; then
  PASSWORD=""
else
  PASSWORD="--password $PASSWORD"
fi

helm push $CERT $USERNAME $PASSWORD $CHART $REPO
