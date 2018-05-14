#!/bin/bash
# assumes you're already logged in and in the correct project
oc new-app https://github.com/dougchansolute/openshift3-elk --context-dir=kibana --name=kibana
oc expose svc kibana