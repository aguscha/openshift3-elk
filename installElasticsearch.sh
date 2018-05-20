#!/bin/bash
# assumes you're already logged in and in the correct project
oc new-app https://github.com/aguscha/openshift3-elk6 --context-dir=elasticsearch --name=elasticsearch
