#! /bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
ROOT=$DIR

source $ROOT/b64_toggle.sh
# set -x
# 'keke\nfefe\nlele\n|a2VrZQpmZWZlCmxlbGUK'
readonly testVars=(
'fafafa|ZmFmYWZhCg=='
'fafa fefe lkeke|ZmFmYSBmZWZlIGxrZWtlCg=='
'ZmFmYWZhCg==|fafafa'
'ZmFmYSBmZWZlIGxrZWtlCg==|fafa fefe lkeke'
'bmV4dXMtZ286QWxtYWZheGFfMDAxMjEyMwo=|nexus-go:Almafaxa_0012123'
'nexus-go:Almafaxa_0012123|bmV4dXMtZ286QWxtYWZheGFfMDAxMjEyMwo='
'ejRtQ05CV2tPd0Y4T1VoMwo=|z4mCNBWkOwF8OUh3'
'z4mCNBWkOwF8OUh3|ejRtQ05CV2tPd0Y4T1VoMwo='
'{ "auths": { "dockerhub.lol": { "auth": "faf" }, "dockerhub-faf.hu": { "auth": "fef" } } }|eyAiYXV0aHMiOiB7ICJkb2NrZXJodWIubG9sIjogeyAiYXV0aCI6ICJmYWYiIH0sICJkb2NrZXJodWItZmFmLmh1IjogeyAiYXV0aCI6ICJmZWYiIH0gfSB9Cg=='
'{\n   "auths":{\n      "dockerhub.lol":{\n         "auth":"faf"\n      },\n      "dockerhub-faf.hu":{\n         "auth":"fef"\n      }\n   }\n}|ewogICAiYXV0aHMiOnsKICAgICAgImRvY2tlcmh1Yi5sb2wiOnsKICAgICAgICAgImF1dGgiOiJmYWYiCiAgICAgIH0sCiAgICAgICJkb2NrZXJodWItZmFmLmh1Ijp7CiAgICAgICAgICJhdXRoIjoiZmVmIgogICAgICB9CiAgIH0KfQo='
'ewogICAiYXV0aHMiOnsKICAgICAgImRvY2tlcmh1Yi5sb2wiOnsKICAgICAgICAgImF1dGgiOiJmYWYiCiAgICAgIH0sCiAgICAgICJkb2NrZXJodWItZmFmLmh1Ijp7CiAgICAgICAgICJhdXRoIjoiZmVmIgogICAgICB9CiAgIH0KfQo|{\n   "auths":{\n      "dockerhub.lol":{\n         "auth":"faf"\n      },\n      "dockerhub-faf.hu":{\n         "auth":"fef"\n      }\n   }\n}'
)

echo "###### ARGTEST"

export TESTING=1
for fields in "${testVars[@]}"
do
    IFS=$'|' read -r "source" "expected" <<< "$fields"
    b64_result="$(b64_toggle "$( echo -e "$source" )" )"
    [ "$b64_result" = "$( echo -e "$expected" )" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -> $b64_result -> $expected" && exit 1; }
    # [ "$b64_result" = "$expected" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -> $b64_result -> $expected" && exit 1; }
    # [ "$b64_result" = "$expected" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -> $b64_result -> $expected"  ; }
done

echo "###### PIPETEST"

export TESTING=1
for fields in "${testVars[@]}"
do
    IFS=$'|' read -r "source" "expected" <<< "$fields"
    b64_result="$(echo -e "$source" | b64_toggle )"
    [ "$b64_result" = "$( echo -e "$expected" )" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -res-> $b64_result -exp-> $expected" && exit 1; }
    # [ "$b64_result" = "$expected" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -> $b64_result -> $expected" && exit 1; }
    # [ "$b64_result" = "$expected" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -> $b64_result -> $expected"  ; }
done
