#!/bin/bash
exists=$("hash ansible-playbook")

if [[ $exists -ne 0 ]]l then
    pip install ansible
fi
