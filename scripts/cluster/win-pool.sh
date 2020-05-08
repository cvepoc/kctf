#!/bin/bash
# Copyright 2020 Google LLC
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     https://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -Eeuo pipefail
DIR="$( cd "$( dirname "$( readlink -f "${BASH_SOURCE[0]}")" )" >/dev/null && pwd )/../.."
source "${DIR}/scripts/lib/config.sh"

load_config

MACHINE_TYPE="n2-standard-4"
MIN_NODES="1"
MAX_NODES="2"
NUM_NODES="1"

gcloud container node-pools create "win" \
  --cluster="${CLUSTER_NAME}" \
  --machine-type="${MACHINE_TYPE}" \
  --enable-autorepair \
  --enable-autoupgrade \
  --num-nodes="${NUM_NODES}" \
  --enable-autoscaling \
  --min-nodes="${MIN_NODES}" \
  --max-nodes="${MAX_NODES}" \
  --no-enable-autoupgrade \
  --image-type=WINDOWS_SAC