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
FROM kctf-nsjail

COPY flag /chroot/
COPY nsjail.cfg /home/user/

CMD kctf_setup && \
    drop_privs \
    nsjail --config /kctf/nsjail_base.cfg --config /home/user/nsjail.cfg -- \
    /usr/bin/stdbuf -i0 -o0 -e0 \
    maybe_pow.sh \
    /bin/bash
