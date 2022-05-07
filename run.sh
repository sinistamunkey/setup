#!/usr/bin/env bash
set -Eeuo pipefail -o nounset

install_ansible() {
  echo "Installing ansible"
  result=$("pip3 -U install pip && pip3 install ansible")
  if [[ $result -ne 0 ]]; then
    echo "Error installing ansible. Exiting"
    exit 1
  fi
}

run_ansible() {
  command="ansible-playbook site.yaml"
  printf "Running: %s\n" "$command"
  eval "${command}"
}

if hash ansible 2>/dev/null; then
    run_ansible
else
    install_ansible
    run_ansible
fi
