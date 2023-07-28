source b64_toggle.sh

readonly testVars=(
'fafafa|ZmFmYWZhCg=='
'fafa fefe lkeke|ZmFmYSBmZWZlIGxrZWtlCg=='
'ZmFmYWZhCg==|fafafa'
'ZmFmYSBmZWZlIGxrZWtlCg==|fafa fefe lkeke'
'bmV4dXMtZ286QWxtYWZheGFfMDAxMjEyMwo=|nexus-go:Almafaxa_0012123'
'nexus-go:Almafaxa_0012123|bmV4dXMtZ286QWxtYWZheGFfMDAxMjEyMwo='
'ejRtQ05CV2tPd0Y4T1VoMwo=|z4mCNBWkOwF8OUh3'
'z4mCNBWkOwF8OUh3|ejRtQ05CV2tPd0Y4T1VoMwo='
)

export TESTING=1
for fields in "${testVars[@]}"
do
    IFS=$'|' read -r "source" "expected" <<< "$fields"
    b64_result="$(b64_toggle "$source" )"
    [ "$b64_result" = "$expected" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -> $b64_result -> $expected" && exit 1; }
    # [ "$b64_result" = "$expected" ] && { echo "[OK] $source " ;} || { echo "!!! NOK !!! $source -> $b64_result -> $expected"  ; }
done
