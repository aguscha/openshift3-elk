#!/bin/bash
# assumes you're already logged in and in the correct project
# Logstash is more complicated than elasticsearch and kibana because it's an S2I (source to image) build.
# First, we use a dockerfile to set up a pod ensuring that the correct user is used for S2I. Then, that
# image is pushed to  the image stream. Afterwords, the image is used as a based for the S2I build.
oc new-build https://github.com/dougchansolute/openshift3-elk --context-dir=logstash --name=logstash-base
oc new-app test2/logstash-base~https://github.com/dougchansolute/openshift3-elk --context-dir=example --strategy=source --name=logstash --allow-missing-imagestream-tags
echo "setting up lsingress"
oc expose dc logstash --type=LoadBalancer --name=lsingress --port=5000
echo "about to create route for lsiungress"
oc expose svc lsingress