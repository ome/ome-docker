PREFIX=openmicroscopy
for docker in $(python graph.py --order)
do
    cd $docker
    docker build -t openmicroscopy/$docker .
    cd ..
done
