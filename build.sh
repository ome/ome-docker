set -e
PREFIX=openmicroscopy
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
