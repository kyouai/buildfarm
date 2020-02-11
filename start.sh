#!/bin/sh
gcloud compute instances create buildfarm  --machine-type=n1-standard-16 --preemptible --zone=us-central1-a --boot-disk-device-name=buildfarm --boot-disk-size=250GB --boot-disk-type=pd-ssd --image ubuntu-1604-xenial-v20200129 --image-project ubuntu-os-cloud

