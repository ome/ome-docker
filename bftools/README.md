# What is Bio-Formats

Bio-Formats is a software tool for reading and writing image data using
standardized, open formats. Bio-Formats is a community driven project with a
standardized application interface that supports open source analysis programs
like ImageJ, CellProfiler and Icy, informatics solutions like OMERO and the JCB
DataViewer, and commercial programs like Matlab. 

> [http://www.openmicroscopy.org/site/products/bio-formats](http://www.openmicroscopy.org/site/products/bio-formats)

# How to use this `Dockerfile`

    docker pull openmicroscopy/bftools
    docker run -it -v /mydata:/home/bf/data openmicroscopy/bftools
    $ showinf data/somefile.ome.tiff
