# Benchmarks

## Running a benchmark session

### Customize environment variables 

1. Have MWT cluster with enterprise ElasticSearch (ES) deployed to Kubernetes namespace 'kubeaddons-enterprise'
2. cd mwt
3. read [README](mwt/README.md)
4. If needed, set non-default values for environment variables: RALLY_TRACK, RALLY_TARGET_HOST, NUM_WAIT_SECS, ES_VERSION, RALLY_RACE_NUMBER,  RALLY_USER_TAG, RALLY_PARAMS.
   See below the default values for these vars

```bash
es_version="${ES_VERSION:-6.x}"
race_number="${RALLY_RACE_NUMBER:-x}"

track_name="${RALLY_TRACK:-geonames}"
target_host="${RALLY_TARGET_HOST:-127.0.0.1:9200}"
_default_user_tag="race_${race_number}:es-${es_version}"
user_tag="${RALLY_USER_TAG:-${_default_user_tag}}"
_default_params="--challenge=append-no-conflicts"
other_params="${RALLY_PARAMS:-${_default_params}}" 
```


### Run benchmark locally with port-forwarding to Cluster enabled (by default)

```bash
kubectl kuttl test --config kuttl-benchmark.yaml
```

