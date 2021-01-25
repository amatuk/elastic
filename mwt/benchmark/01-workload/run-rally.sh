#!/usr/bin/env bash
set -e

es_version="${ES_VERSION:-6.x}"
race_number="${RALLY_RACE_NUMBER:-x}"

track_name="${RALLY_TRACK:-geonames}"
target_host="${RALLY_TARGET_HOST:-127.0.0.1:9200}"
default_user_tag="race_${race_number}:es-${es_version}"
user_tag="${RALLY_USER_TAG:-${default_user_tag}}"
default_params="--challenge=append-no-conflicts"
other_params="${RALLY_PARAMS:-${default_params}}"

FULL_RALLY_CMD="esrally --pipeline=benchmark-only --target-host=$target_host --track=$track_name  --user-tag=\"$user_tag\" $other_params"
echo "Full rally command: [$FULL_RALLY_CMD]"
echo "Running Esrally ..."
$FULL_RALLY_CMD
