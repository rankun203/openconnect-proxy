#!/usr/bin/env bash

# borrowed from https://github.com/wazum/openconnect-proxy
# this implementation takes a different approach on issue https://github.com/wazum/openconnect-proxy/issues/8
run () {
  # Start openconnect
  if [[ -z "${OPENCONNECT_PASSWORD}" ]]; then
  # Ask for password
    openconnect -u "$OPENCONNECT_USER" $OPENCONNECT_OPTIONS $OPENCONNECT_URL
  elif [[ ! -z "${OPENCONNECT_PASSWORD}" ]] && [[ ! -z "${OPENCONNECT_MFA_CODE}" ]]; then
  # Multi factor authentication (MFA)
    (echo $OPENCONNECT_PASSWORD; echo $OPENCONNECT_MFA_CODE) | openconnect -u "$OPENCONNECT_USER" $OPENCONNECT_OPTIONS --passwd-on-stdin $OPENCONNECT_URL
  elif [[ ! -z "${OPENCONNECT_PASSWORD}" ]]; then
    # Standard authentication
    echo $OPENCONNECT_PASSWORD | openconnect -u "$OPENCONNECT_USER" --passwd-on-stdin --script-tun --script="ocproxy -g -D 1080" $OPENCONNECT_OPTIONS $OPENCONNECT_URL
  fi

  # Check if the user exists and create if it doesn't
  if ! id -u $SOCKS_USERNAME > /dev/null 2>&1; then
    useradd -r -s /bin/false $SOCKS_USERNAME && \
    echo "$SOCKS_USERNAME:$SOCKS_PASSWORD" | chpasswd
  fi
}

until (run); do
  echo "openconnect exited. Restarting process in 10 seconds…" >&2
  sleep 10
done

