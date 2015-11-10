set -e
PREFIX=openmicroscopy

BASES=$(grep -h '^FROM' */Dockerfile | \
    cut -b6- | sort -u)
for base in $BASES
do
    if [ "${base#$PREFIX/}" = "$base" ]; then
        docker pull $base
    else
        echo Not pulling $base
    fi
done

for docker in $(python graph.py --order)
do
    cd $docker
    echo Building $docker
    docker build -t openmicroscopy/$docker . || {
        echo Build failure: $docker
        exit 1
    }
    cd ..
done
