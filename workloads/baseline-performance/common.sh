#!/usr/bin/env bash
source ../../utils/common.sh

openshift_login

export KUBE_BURNER_RELEASE_URL=${KUBE_BURNER_RELEASE_URL:-latest}

export ENABLE_INDEXING=${ENABLE_INDEXING:-true}
export ES_SERVER=${ES_SERVER:-https://search-perfscale-dev-chmf5l4sh66lvxbnadi4bznl3a.us-west-2.es.amazonaws.com:443}
export ES_INDEX=${ES_INDEX:-ripsaw-kube-burner}
export WRITE_TO_FILE=${WRITE_TO_FILE:-false}

# Time duration for which kube-burner will collect metrics
export WATCH_TIME=${WATCH_TIME:-30}


export UUID=${UUID:-$(uuidgen)}

export PROM_URL=https://$(oc get route -n openshift-monitoring prometheus-k8s -o jsonpath="{.spec.host}")
export PROM_TOKEN=$(oc -n openshift-monitoring sa get-token prometheus-k8s)

log(){
  echo -e "\033[1m$(date "+%d-%m-%YT%H:%M:%S") ${@}\033[0m"
}

