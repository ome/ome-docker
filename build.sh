set -e
PREFIX=openmicroscopy

BASES=$(grep -h '^FROM' */Dockerfile | \
	sed -re 's|FROM\s+([A-Za-z0-9/-]+)(:.+)?|\1|' | sort -u)
echo Pulling $BASES
for base in $BASES
do
    docker pull $base
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
