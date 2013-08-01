
--
-- GENERATED Wed Jul 31 15:54:25 2013 from /home/ubuntu/OMERO.server-4.4.8p1-ice34-b304/sql/psql/OMERO4.4__0
--
-- This file was created by the bin/omero db script command
-- and contains an MD5 version of your OMERO root users's password.
-- You should think about deleting it as soon as possible.
--
-- To create your database:
--
--     createdb omero
--     createlang plpgsql omero
--     psql omero < OMERO4.4__0.sql
--
--
BEGIN;


    create table acquisitionmode (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table annotation (
        discriminator varchar(31) not null,
        id int8 not null,
        description text,
        permissions int8 not null,
        ns varchar(255),
        version int4,
        timeValue timestamp,
        textValue text,
        boolValue bool,
        termValue text,
        longValue int8,
        doubleValue float8,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        "file" int8,
        primary key (id)
    );;

    create table annotationannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table arc (
        lightsource_id int8 not null,
        type int8 not null,
        primary key (lightsource_id)
    );;

    create table arctype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table binning (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table channel (
        id int8 not null,
        alpha int4,
        blue int4,
        permissions int8 not null,
        green int4,
        red int4,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        logicalChannel int8 not null,
        pixels int8 not null,
        statsInfo int8,
        pixels_index int4 not null,
        primary key (id),
        unique (pixels, pixels_index)
    );;

    create table channelannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table channelbinding (
        id int8 not null,
        active bool not null,
        alpha int4 not null,
        blue int4 not null,
        coefficient float8 not null,
        permissions int8 not null,
        green int4 not null,
        inputEnd float8 not null,
        inputStart float8 not null,
        noiseReduction bool not null,
        red int4 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        family int8 not null,
        renderingDef int8 not null,
        renderingDef_index int4 not null,
        primary key (id),
        unique (renderingDef, renderingDef_index)
    );;

    create table codomainmapcontext (
        id int8 not null,
        permissions int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        renderingDef int8 not null,
        renderingDef_index int4 not null,
        primary key (id),
        unique (renderingDef, renderingDef_index)
    );;

    create table contrastmethod (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table contraststretchingcontext (
        xend int4 not null,
        xstart int4 not null,
        yend int4 not null,
        ystart int4 not null,
        codomainmapcontext_id int8 not null,
        primary key (codomainmapcontext_id)
    );;

    create table correction (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table count_Annotation_annotationLinks_by_owner (
        Annotation_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Annotation_id, owner_id)
    );;

    create table count_Channel_annotationLinks_by_owner (
        Channel_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Channel_id, owner_id)
    );;

    create table count_Dataset_annotationLinks_by_owner (
        Dataset_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Dataset_id, owner_id)
    );;

    create table count_Dataset_imageLinks_by_owner (
        Dataset_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Dataset_id, owner_id)
    );;

    create table count_Dataset_projectLinks_by_owner (
        Dataset_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Dataset_id, owner_id)
    );;

    create table count_ExperimenterGroup_annotationLinks_by_owner (
        ExperimenterGroup_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (ExperimenterGroup_id, owner_id)
    );;

    create table count_Experimenter_annotationLinks_by_owner (
        Experimenter_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Experimenter_id, owner_id)
    );;

    create table count_FilterSet_emissionFilterLink_by_owner (
        FilterSet_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (FilterSet_id, owner_id)
    );;

    create table count_FilterSet_excitationFilterLink_by_owner (
        FilterSet_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (FilterSet_id, owner_id)
    );;

    create table count_Filter_emissionFilterLink_by_owner (
        Filter_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Filter_id, owner_id)
    );;

    create table count_Filter_excitationFilterLink_by_owner (
        Filter_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Filter_id, owner_id)
    );;

    create table count_Image_annotationLinks_by_owner (
        Image_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Image_id, owner_id)
    );;

    create table count_Image_datasetLinks_by_owner (
        Image_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Image_id, owner_id)
    );;

    create table count_Job_originalFileLinks_by_owner (
        Job_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Job_id, owner_id)
    );;

    create table count_LightPath_emissionFilterLink_by_owner (
        LightPath_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (LightPath_id, owner_id)
    );;

    create table count_LightPath_excitationFilterLink_by_owner (
        LightPath_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (LightPath_id, owner_id)
    );;

    create table count_Namespace_annotationLinks_by_owner (
        Namespace_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Namespace_id, owner_id)
    );;

    create table count_Node_annotationLinks_by_owner (
        Node_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Node_id, owner_id)
    );;

    create table count_OriginalFile_annotationLinks_by_owner (
        OriginalFile_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (OriginalFile_id, owner_id)
    );;

    create table count_OriginalFile_pixelsFileMaps_by_owner (
        OriginalFile_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (OriginalFile_id, owner_id)
    );;

    create table count_Pixels_annotationLinks_by_owner (
        Pixels_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Pixels_id, owner_id)
    );;

    create table count_Pixels_pixelsFileMaps_by_owner (
        Pixels_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Pixels_id, owner_id)
    );;

    create table count_PlaneInfo_annotationLinks_by_owner (
        PlaneInfo_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (PlaneInfo_id, owner_id)
    );;

    create table count_PlateAcquisition_annotationLinks_by_owner (
        PlateAcquisition_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (PlateAcquisition_id, owner_id)
    );;

    create table count_Plate_annotationLinks_by_owner (
        Plate_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Plate_id, owner_id)
    );;

    create table count_Plate_screenLinks_by_owner (
        Plate_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Plate_id, owner_id)
    );;

    create table count_Project_annotationLinks_by_owner (
        Project_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Project_id, owner_id)
    );;

    create table count_Project_datasetLinks_by_owner (
        Project_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Project_id, owner_id)
    );;

    create table count_Reagent_annotationLinks_by_owner (
        Reagent_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Reagent_id, owner_id)
    );;

    create table count_Reagent_wellLinks_by_owner (
        Reagent_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Reagent_id, owner_id)
    );;

    create table count_Roi_annotationLinks_by_owner (
        Roi_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Roi_id, owner_id)
    );;

    create table count_Screen_annotationLinks_by_owner (
        Screen_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Screen_id, owner_id)
    );;

    create table count_Screen_plateLinks_by_owner (
        Screen_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Screen_id, owner_id)
    );;

    create table count_Session_annotationLinks_by_owner (
        Session_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Session_id, owner_id)
    );;

    create table count_WellSample_annotationLinks_by_owner (
        WellSample_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (WellSample_id, owner_id)
    );;

    create table count_Well_annotationLinks_by_owner (
        Well_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Well_id, owner_id)
    );;

    create table count_Well_reagentLinks_by_owner (
        Well_id int8 not null,
        count int8 not null,
        owner_id int8 not null,
        primary key (Well_id, owner_id)
    );;

    create table dataset (
        id int8 not null,
        description text,
        permissions int8 not null,
        name varchar(255) not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table datasetannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table datasetimagelink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table dbpatch (
        id int8 not null,
        currentPatch int4 not null,
        currentVersion varchar(255) not null,
        permissions int8 not null,
        finished timestamp,
        message varchar(255),
        previousPatch int4 not null,
        previousVersion varchar(255) not null,
        external_id int8 unique,
        primary key (id)
    );;

    create table detector (
        id int8 not null,
        amplificationGain float8,
        permissions int8 not null,
        gain float8,
        lotNumber varchar(255),
        manufacturer varchar(255),
        model varchar(255),
        offsetValue float8,
        serialNumber varchar(255),
        version int4,
        voltage float8,
        zoom float8,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        instrument int8 not null,
        type int8 not null,
        primary key (id)
    );;

    create table detectorsettings (
        id int8 not null,
        permissions int8 not null,
        gain float8,
        offsetValue float8,
        readOutRate float8,
        version int4,
        voltage float8,
        binning int8,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        detector int8 not null,
        primary key (id)
    );;

    create table detectortype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table dichroic (
        id int8 not null,
        permissions int8 not null,
        lotNumber varchar(255),
        manufacturer varchar(255),
        model varchar(255),
        serialNumber varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        instrument int8 not null,
        primary key (id)
    );;

    create table dimensionorder (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table event (
        id int8 not null,
        permissions int8 not null,
        status varchar(255),
        time timestamp not null,
        containingEvent int8,
        external_id int8 unique,
        experimenter int8 not null,
        experimenterGroup int8,
        "session" int8 not null,
        type int8,
        primary key (id)
    );;

    create table eventlog (
        id int8 not null,
        action varchar(255) not null,
        permissions int8 not null,
        entityId int8 not null,
        entityType varchar(255) not null,
        external_id int8 unique,
        event int8 not null,
        primary key (id)
    );;

    create table eventtype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table experiment (
        id int8 not null,
        description text,
        permissions int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        type int8 not null,
        primary key (id)
    );;

    create table experimenter (
        id int8 not null,
        permissions int8 not null,
        email varchar(255),
        firstName varchar(255) not null,
        institution varchar(255),
        lastName varchar(255) not null,
        middleName varchar(255),
        omeName varchar(255) not null unique,
        version int4,
        external_id int8 unique,
        primary key (id)
    );;

    create table experimenterannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table experimentergroup (
        id int8 not null,
        description text,
        permissions int8 not null,
        name varchar(255) not null unique,
        version int4,
        external_id int8 unique,
        primary key (id)
    );;

    create table experimentergroupannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table experimenttype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table externalinfo (
        id int8 not null,
        permissions int8 not null,
        entityId int8 not null,
        entityType varchar(255) not null,
        lsid varchar(255),
        uuid varchar(255),
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        primary key (id)
    );;

    create table family (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table filament (
        lightsource_id int8 not null,
        type int8 not null,
        primary key (lightsource_id)
    );;

    create table filamenttype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table filter (
        id int8 not null,
        permissions int8 not null,
        filterWheel varchar(255),
        lotNumber varchar(255),
        manufacturer varchar(255),
        model varchar(255),
        serialNumber varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        instrument int8 not null,
        transmittanceRange int8,
        type int8,
        primary key (id)
    );;

    create table filterset (
        id int8 not null,
        permissions int8 not null,
        lotNumber varchar(255),
        manufacturer varchar(255),
        model varchar(255),
        serialNumber varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        dichroic int8,
        instrument int8 not null,
        primary key (id)
    );;

    create table filtersetemissionfilterlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table filtersetexcitationfilterlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table filtertype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table format (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table groupexperimentermap (
        id int8 not null,
        permissions int8 not null,
        owner bool not null,
        version int4,
        child int8 not null,
        external_id int8 unique,
        parent int8 not null,
        child_index int4 not null,
        primary key (id),
        unique (parent, child),
        unique (child, child_index)
    );;

    create table illumination (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table image (
        id int8 not null,
        acquisitionDate timestamp not null,
        archived bool,
        description text,
        permissions int8 not null,
        name varchar(255) not null,
        partial bool,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        experiment int8,
        format int8,
        imagingEnvironment int8,
        instrument int8,
        objectiveSettings int8,
        stageLabel int8,
        primary key (id)
    );;

    create table imageannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table imagingenvironment (
        id int8 not null,
        airPressure float8,
        co2percent float8,
        permissions int8 not null,
        humidity float8,
        temperature float8,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id),
        check (humidity >= 0 and humidity <= 1 and co2percent >= 0 and co2percent <= 1)
    );;

    create table immersion (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table importjob (
        imageDescription varchar(255) not null,
        imageName varchar(255) not null,
        job_id int8 not null,
        primary key (job_id)
    );;

    create table instrument (
        id int8 not null,
        permissions int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        microscope int8,
        primary key (id)
    );;

    create table job (
        id int8 not null,
        permissions int8 not null,
        finished timestamp,
        groupname varchar(255) not null,
        message varchar(255) not null,
        scheduledFor timestamp not null,
        started timestamp,
        submitted timestamp not null,
        type varchar(255) not null,
        username varchar(255) not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        status int8 not null,
        primary key (id)
    );;

    create table joboriginalfilelink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table jobstatus (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table laser (
        frequencyMultiplication int4,
        pockelCell bool,
        repetitionRate float8,
        tuneable bool,
        wavelength int4,
        lightsource_id int8 not null,
        laserMedium int8 not null,
        pulse int8,
        pump int8,
        type int8 not null,
        primary key (lightsource_id),
        check (frequencyMultiplication > 0 and wavelength > 0)
    );;

    create table lasermedium (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table lasertype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table lightemittingdiode (
        lightsource_id int8 not null,
        primary key (lightsource_id)
    );;

    create table lightpath (
        id int8 not null,
        permissions int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        dichroic int8,
        primary key (id)
    );;

    create table lightpathemissionfilterlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table lightpathexcitationfilterlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        parent_index int4 not null,
        primary key (id),
        unique (parent, parent_index),
        unique (parent, child, owner_id)
    );;

    create table lightsettings (
        id int8 not null,
        attenuation float8,
        permissions int8 not null,
        version int4,
        wavelength int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        lightSource int8 not null,
        microbeamManipulation int8,
        primary key (id),
        check (attenuation >= 0 and attenuation <= 1 and wavelength > 0)
    );;

    create table lightsource (
        id int8 not null,
        permissions int8 not null,
        lotNumber varchar(255),
        manufacturer varchar(255),
        model varchar(255),
        "power" float8,
        serialNumber varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        instrument int8 not null,
        primary key (id)
    );;

    create table link (
        id int8 not null,
        permissions int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table logicalchannel (
        id int8 not null,
        permissions int8 not null,
        emissionWave int4,
        excitationWave int4,
        fluor varchar(255),
        name varchar(255),
        ndFilter float8,
        pinHoleSize float8,
        pockelCellSetting int4,
        samplesPerPixel int4,
        version int4,
        contrastMethod int8,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        detectorSettings int8,
        filterSet int8,
        illumination int8,
        lightPath int8,
        lightSourceSettings int8,
        "mode" int8,
        otf int8,
        photometricInterpretation int8,
        primary key (id),
        check (excitationWave > 0 and emissionWave > 0 and samplesPerPixel > 0)
    );;

    create table medium (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table microbeammanipulation (
        id int8 not null,
        description text,
        permissions int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        experiment int8 not null,
        type int8 not null,
        primary key (id)
    );;

    create table microbeammanipulationtype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table microscope (
        id int8 not null,
        permissions int8 not null,
        lotNumber varchar(255),
        manufacturer varchar(255),
        model varchar(255),
        serialNumber varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        type int8 not null,
        primary key (id)
    );;

    create table microscopetype (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table namespace (
        id int8 not null,
        description text,
        permissions int8 not null,
        display bool,
        keywords text[],
        multivalued bool,
        name varchar(255) not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table namespaceannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table node (
        id int8 not null,
        conn varchar(255) not null,
        permissions int8 not null,
        down timestamp,
        scale int4,
        up timestamp not null,
        uuid varchar(255) not null unique,
        version int4,
        external_id int8 unique,
        primary key (id)
    );;

    create table nodeannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table objective (
        id int8 not null,
        calibratedMagnification float8,
        permissions int8 not null,
        iris bool,
        lensNA float8,
        lotNumber varchar(255),
        manufacturer varchar(255),
        model varchar(255),
        nominalMagnification int4,
        serialNumber varchar(255),
        version int4,
        workingDistance float8,
        correction int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        immersion int8 not null,
        instrument int8 not null,
        primary key (id),
        check (nominalMagnification > 0)
    );;

    create table objectivesettings (
        id int8 not null,
        correctionCollar float8,
        permissions int8 not null,
        refractiveIndex float8,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        medium int8,
        objective int8 not null,
        primary key (id)
    );;

    create table originalfile (
        id int8 not null,
        atime timestamp,
        ctime timestamp,
        permissions int8 not null,
        mimetype varchar(255),
        mtime timestamp,
        name varchar(255) not null,
        path text not null,
        sha1 varchar(255) not null,
        "size" int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table originalfileannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table otf (
        id int8 not null,
        permissions int8 not null,
        opticalAxisAveraged bool not null,
        path varchar(255) not null,
        sizeX int4 not null,
        sizeY int4 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        filterSet int8,
        instrument int8 not null,
        objective int8 not null,
        pixelsType int8 not null,
        primary key (id),
        check (sizeX > 0 and sizeY > 0)
    );;

    create table parsejob (
        params bytea,
        job_id int8 not null,
        primary key (job_id)
    );;

    create table photometricinterpretation (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table pixels (
        id int8 not null,
        permissions int8 not null,
        methodology varchar(255),
        physicalSizeX float8,
        physicalSizeY float8,
        physicalSizeZ float8,
        sha1 varchar(255) not null,
        sizeC int4 not null,
        sizeT int4 not null,
        sizeX int4 not null,
        sizeY int4 not null,
        sizeZ int4 not null,
        timeIncrement float8,
        version int4,
        waveIncrement int4,
        waveStart int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        dimensionOrder int8 not null,
        image int8 not null,
        pixelsType int8 not null,
        relatedTo int8,
        image_index int4 not null,
        primary key (id),
        unique (image, image_index),
        check (sizeX > 0 and sizeY > 0 and sizeZ > 0 and sizeC > 0 and sizeT > 0)
    );;

    create table pixelsannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table pixelsoriginalfilemap (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table pixelstype (
        id int8 not null,
        bitSize int4,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table planeinfo (
        id int8 not null,
        deltaT float8,
        permissions int8 not null,
        exposureTime float8,
        positionX float8,
        positionY float8,
        positionZ float8,
        theC int4 not null,
        theT int4 not null,
        theZ int4 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        pixels int8 not null,
        primary key (id),
        check (theZ >= 0 and theC >= 0 and theT >= 0)
    );;

    create table planeinfoannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table planeslicingcontext (
        "constant" bool not null,
        lowerLimit int4 not null,
        planePrevious int4 not null,
        planeSelected int4 not null,
        upperLimit int4 not null,
        codomainmapcontext_id int8 not null,
        primary key (codomainmapcontext_id)
    );;

    create table plate (
        id int8 not null,
        columnNamingConvention varchar(255),
        columns int4,
        defaultSample int4,
        description text,
        permissions int8 not null,
        externalIdentifier varchar(255),
        name varchar(255) not null,
        rowNamingConvention varchar(255),
        "rows" int4,
        status varchar(255),
        version int4,
        wellOriginX float8,
        wellOriginY float8,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table plateacquisition (
        id int8 not null,
        description text,
        permissions int8 not null,
        endTime timestamp,
        maximumFieldCount int4,
        name varchar(255),
        startTime timestamp,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        plate int8 not null,
        primary key (id)
    );;

    create table plateacquisitionannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table plateannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table project (
        id int8 not null,
        description text,
        permissions int8 not null,
        name varchar(255) not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table projectannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table projectdatasetlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table pulse (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table quantumdef (
        id int8 not null,
        bitResolution int4 not null,
        cdEnd int4 not null,
        cdStart int4 not null,
        permissions int8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table reagent (
        id int8 not null,
        description text,
        permissions int8 not null,
        name varchar(255),
        reagentIdentifier varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        screen int8 not null,
        primary key (id)
    );;

    create table reagentannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table renderingdef (
        id int8 not null,
        compression float8,
        defaultT int4 not null,
        defaultZ int4 not null,
        permissions int8 not null,
        name varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        model int8 not null,
        pixels int8 not null,
        quantization int8 not null,
        primary key (id)
    );;

    create table renderingmodel (
        id int8 not null,
        permissions int8 not null,
        value varchar(255) not null unique,
        external_id int8 unique,
        primary key (id)
    );;

    create table reverseintensitycontext (
        "reverse" bool not null,
        codomainmapcontext_id int8 not null,
        primary key (codomainmapcontext_id)
    );;

    create table roi (
        id int8 not null,
        description text,
        permissions int8 not null,
        keywords text[][],
        namespaces text[],
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        image int8,
        source int8,
        primary key (id)
    );;

    create table roiannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table screen (
        id int8 not null,
        description text,
        permissions int8 not null,
        name varchar(255) not null,
        protocolDescription varchar(255),
        protocolIdentifier varchar(255),
        reagentSetDescription varchar(255),
        reagentSetIdentifier varchar(255),
        type varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table screenannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table screenplatelink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table scriptjob (
        description varchar(255),
        job_id int8 not null,
        primary key (job_id)
    );;

    create table session (
        id int8 not null,
        closed timestamp,
        defaultEventType varchar(255) not null,
        permissions int8 not null,
        message text,
        started timestamp not null,
        timeToIdle int8 not null,
        timeToLive int8 not null,
        userAgent varchar(255),
        uuid varchar(255) not null unique,
        version int4,
        external_id int8 unique,
        node int8 not null,
        owner int8 not null,
        primary key (id)
    );;

    create table sessionannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table shape (
        discriminator varchar(31) not null,
        id int8 not null,
        permissions int8 not null,
        fillColor int4,
        fillRule varchar(255),
        fontFamily varchar(255),
        fontSize int4,
        fontStretch varchar(255),
        fontStyle varchar(255),
        fontVariant varchar(255),
        fontWeight varchar(255),
        g varchar(255),
        locked bool,
        strokeColor int4,
        strokeDashArray varchar(255),
        strokeDashOffset int4,
        strokeLineCap varchar(255),
        strokeLineJoin varchar(255),
        strokeMiterLimit int4,
        strokeWidth int4,
        theC int4,
        theT int4,
        theZ int4,
        transform varchar(255),
        vectorEffect varchar(255),
        version int4,
        visibility bool,
        points text,
        textValue text,
        cx float8,
        cy float8,
        anchor varchar(255),
        baselineShift varchar(255),
        decoration varchar(255),
        direction varchar(255),
        glyphOrientationVertical int4,
        writingMode varchar(255),
        x float8,
        y float8,
        d text,
        height float8,
        rx float8,
        width float8,
        bytes bytea,
        ry float8,
        x1 float8,
        x2 float8,
        y1 float8,
        y2 float8,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        roi int8 not null,
        pixels int8,
        roi_index int4 not null,
        primary key (id),
        unique (roi, roi_index)
    );;

    create table share (
        active bool not null,
        data bytea not null,
        itemCount int8 not null,
        session_id int8 not null,
        "group" int8 not null,
        primary key (session_id)
    );;

    create table sharemember (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        external_id int8 unique,
        parent int8 not null,
        primary key (id),
        unique (parent, child)
    );;

    create table stagelabel (
        id int8 not null,
        permissions int8 not null,
        name varchar(255) not null,
        positionX float8,
        positionY float8,
        positionZ float8,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table statsinfo (
        id int8 not null,
        permissions int8 not null,
        globalMax float8 not null,
        globalMin float8 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id)
    );;

    create table thumbnail (
        id int8 not null,
        permissions int8 not null,
        mimeType varchar(255) not null,
        "ref" varchar(255),
        sizeX int4 not null,
        sizeY int4 not null,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        pixels int8 not null,
        primary key (id)
    );;

    create table transmittancerange (
        id int8 not null,
        cutIn int4,
        cutInTolerance int4,
        cutOut int4,
        cutOutTolerance int4,
        permissions int8 not null,
        transmittance float8,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        primary key (id),
        check (cutIn > 0 and cutOut > 0 and cutInTolerance >= 0 and cutOutTolerance >= 0 and transmittance >= 0 and transmittance <= 1)
    );;

    create table well (
        id int8 not null,
        alpha int4,
        blue int4,
        "column" int4,
        permissions int8 not null,
        externalDescription varchar(255),
        externalIdentifier varchar(255),
        green int4,
        red int4,
        "row" int4,
        status varchar(255),
        type varchar(255),
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        plate int8 not null,
        primary key (id)
    );;

    create table wellannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table wellreagentlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    create table wellsample (
        id int8 not null,
        permissions int8 not null,
        posX float8,
        posY float8,
        timepoint timestamp,
        version int4,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        image int8 not null,
        plateAcquisition int8,
        well int8 not null,
        well_index int4 not null,
        primary key (id),
        unique (well, well_index)
    );;

    create table wellsampleannotationlink (
        id int8 not null,
        permissions int8 not null,
        version int4,
        child int8 not null,
        creation_id int8 not null,
        external_id int8 unique,
        group_id int8 not null,
        owner_id int8 not null,
        update_id int8 not null,
        parent int8 not null,
        primary key (id),
        unique (parent, child, owner_id)
    );;

    alter table acquisitionmode 
        add constraint FKacquisitionmode_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table annotation 
        add constraint FKannotation_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table annotation 
        add constraint FKannotation_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table annotation 
        add constraint FKannotation_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table annotation 
        add constraint FKfileannotation_file_originalfile 
        foreign key ("file") 
        references originalfile  ;;

    alter table annotation 
        add constraint FKannotation_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table annotation 
        add constraint FKannotation_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table annotationannotationlink 
        add constraint FKannotationannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table annotationannotationlink 
        add constraint FKannotationannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table annotationannotationlink 
        add constraint FKannotationannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table annotationannotationlink 
        add constraint FKannotationannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table annotationannotationlink 
        add constraint FKannotationannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table annotationannotationlink 
        add constraint FKannotationannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table annotationannotationlink 
        add constraint FKannotationannotationlink_parent_annotation 
        foreign key (parent) 
        references annotation  ;;

    alter table arc 
        add constraint FKarc_lightsource_id_lightsource 
        foreign key (lightsource_id) 
        references lightsource  ;;

    alter table arc 
        add constraint FKarc_type_arctype 
        foreign key (type) 
        references arctype  ;;

    alter table arctype 
        add constraint FKarctype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table binning 
        add constraint FKbinning_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table channel 
        add constraint FKchannel_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table channel 
        add constraint FKchannel_logicalChannel_logicalchannel 
        foreign key (logicalChannel) 
        references logicalchannel  ;;

    alter table channel 
        add constraint FKchannel_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table channel 
        add constraint FKchannel_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table channel 
        add constraint FKchannel_statsInfo_statsinfo 
        foreign key (statsInfo) 
        references statsinfo  ;;

    alter table channel 
        add constraint FKchannel_pixels_pixels 
        foreign key (pixels) 
        references pixels  ;;

    alter table channel 
        add constraint FKchannel_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table channel 
        add constraint FKchannel_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table channelannotationlink 
        add constraint FKchannelannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table channelannotationlink 
        add constraint FKchannelannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table channelannotationlink 
        add constraint FKchannelannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table channelannotationlink 
        add constraint FKchannelannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table channelannotationlink 
        add constraint FKchannelannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table channelannotationlink 
        add constraint FKchannelannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table channelannotationlink 
        add constraint FKchannelannotationlink_parent_channel 
        foreign key (parent) 
        references channel  ;;

    alter table channelbinding 
        add constraint FKchannelbinding_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table channelbinding 
        add constraint FKchannelbinding_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table channelbinding 
        add constraint FKchannelbinding_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table channelbinding 
        add constraint FKchannelbinding_family_family 
        foreign key (family) 
        references family  ;;

    alter table channelbinding 
        add constraint FKchannelbinding_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table channelbinding 
        add constraint FKchannelbinding_renderingDef_renderingdef 
        foreign key (renderingDef) 
        references renderingdef  ;;

    alter table channelbinding 
        add constraint FKchannelbinding_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table codomainmapcontext 
        add constraint FKcodomainmapcontext_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table codomainmapcontext 
        add constraint FKcodomainmapcontext_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table codomainmapcontext 
        add constraint FKcodomainmapcontext_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table codomainmapcontext 
        add constraint FKcodomainmapcontext_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table codomainmapcontext 
        add constraint FKcodomainmapcontext_renderingDef_renderingdef 
        foreign key (renderingDef) 
        references renderingdef  ;;

    alter table codomainmapcontext 
        add constraint FKcodomainmapcontext_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table contrastmethod 
        add constraint FKcontrastmethod_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table contraststretchingcontext 
        add constraint FKcontraststretchingcontext_codomainmapcontext_id_codomainmapcontext 
        foreign key (codomainmapcontext_id) 
        references codomainmapcontext  ;;

    alter table correction 
        add constraint FKcorrection_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table count_Annotation_annotationLinks_by_owner 
        add constraint FK_count_to_Annotation_annotationLinks 
        foreign key (Annotation_id) 
        references annotation  ;;

    alter table count_Channel_annotationLinks_by_owner 
        add constraint FK_count_to_Channel_annotationLinks 
        foreign key (Channel_id) 
        references channel  ;;

    alter table count_Dataset_annotationLinks_by_owner 
        add constraint FK_count_to_Dataset_annotationLinks 
        foreign key (Dataset_id) 
        references dataset  ;;

    alter table count_Dataset_imageLinks_by_owner 
        add constraint FK_count_to_Dataset_imageLinks 
        foreign key (Dataset_id) 
        references dataset  ;;

    alter table count_Dataset_projectLinks_by_owner 
        add constraint FK_count_to_Dataset_projectLinks 
        foreign key (Dataset_id) 
        references dataset  ;;

    alter table count_ExperimenterGroup_annotationLinks_by_owner 
        add constraint FK_count_to_ExperimenterGroup_annotationLinks 
        foreign key (ExperimenterGroup_id) 
        references experimentergroup  ;;

    alter table count_Experimenter_annotationLinks_by_owner 
        add constraint FK_count_to_Experimenter_annotationLinks 
        foreign key (Experimenter_id) 
        references experimenter  ;;

    alter table count_FilterSet_emissionFilterLink_by_owner 
        add constraint FK_count_to_FilterSet_emissionFilterLink 
        foreign key (FilterSet_id) 
        references filterset  ;;

    alter table count_FilterSet_excitationFilterLink_by_owner 
        add constraint FK_count_to_FilterSet_excitationFilterLink 
        foreign key (FilterSet_id) 
        references filterset  ;;

    alter table count_Filter_emissionFilterLink_by_owner 
        add constraint FK_count_to_Filter_emissionFilterLink 
        foreign key (Filter_id) 
        references filter  ;;

    alter table count_Filter_excitationFilterLink_by_owner 
        add constraint FK_count_to_Filter_excitationFilterLink 
        foreign key (Filter_id) 
        references filter  ;;

    alter table count_Image_annotationLinks_by_owner 
        add constraint FK_count_to_Image_annotationLinks 
        foreign key (Image_id) 
        references image  ;;

    alter table count_Image_datasetLinks_by_owner 
        add constraint FK_count_to_Image_datasetLinks 
        foreign key (Image_id) 
        references image  ;;

    alter table count_Job_originalFileLinks_by_owner 
        add constraint FK_count_to_Job_originalFileLinks 
        foreign key (Job_id) 
        references job  ;;

    alter table count_LightPath_emissionFilterLink_by_owner 
        add constraint FK_count_to_LightPath_emissionFilterLink 
        foreign key (LightPath_id) 
        references lightpath  ;;

    alter table count_LightPath_excitationFilterLink_by_owner 
        add constraint FK_count_to_LightPath_excitationFilterLink 
        foreign key (LightPath_id) 
        references lightpath  ;;

    alter table count_Namespace_annotationLinks_by_owner 
        add constraint FK_count_to_Namespace_annotationLinks 
        foreign key (Namespace_id) 
        references namespace  ;;

    alter table count_Node_annotationLinks_by_owner 
        add constraint FK_count_to_Node_annotationLinks 
        foreign key (Node_id) 
        references node  ;;

    alter table count_OriginalFile_annotationLinks_by_owner 
        add constraint FK_count_to_OriginalFile_annotationLinks 
        foreign key (OriginalFile_id) 
        references originalfile  ;;

    alter table count_OriginalFile_pixelsFileMaps_by_owner 
        add constraint FK_count_to_OriginalFile_pixelsFileMaps 
        foreign key (OriginalFile_id) 
        references originalfile  ;;

    alter table count_Pixels_annotationLinks_by_owner 
        add constraint FK_count_to_Pixels_annotationLinks 
        foreign key (Pixels_id) 
        references pixels  ;;

    alter table count_Pixels_pixelsFileMaps_by_owner 
        add constraint FK_count_to_Pixels_pixelsFileMaps 
        foreign key (Pixels_id) 
        references pixels  ;;

    alter table count_PlaneInfo_annotationLinks_by_owner 
        add constraint FK_count_to_PlaneInfo_annotationLinks 
        foreign key (PlaneInfo_id) 
        references planeinfo  ;;

    alter table count_PlateAcquisition_annotationLinks_by_owner 
        add constraint FK_count_to_PlateAcquisition_annotationLinks 
        foreign key (PlateAcquisition_id) 
        references plateacquisition  ;;

    alter table count_Plate_annotationLinks_by_owner 
        add constraint FK_count_to_Plate_annotationLinks 
        foreign key (Plate_id) 
        references plate  ;;

    alter table count_Plate_screenLinks_by_owner 
        add constraint FK_count_to_Plate_screenLinks 
        foreign key (Plate_id) 
        references plate  ;;

    alter table count_Project_annotationLinks_by_owner 
        add constraint FK_count_to_Project_annotationLinks 
        foreign key (Project_id) 
        references project  ;;

    alter table count_Project_datasetLinks_by_owner 
        add constraint FK_count_to_Project_datasetLinks 
        foreign key (Project_id) 
        references project  ;;

    alter table count_Reagent_annotationLinks_by_owner 
        add constraint FK_count_to_Reagent_annotationLinks 
        foreign key (Reagent_id) 
        references reagent  ;;

    alter table count_Reagent_wellLinks_by_owner 
        add constraint FK_count_to_Reagent_wellLinks 
        foreign key (Reagent_id) 
        references reagent  ;;

    alter table count_Roi_annotationLinks_by_owner 
        add constraint FK_count_to_Roi_annotationLinks 
        foreign key (Roi_id) 
        references roi  ;;

    alter table count_Screen_annotationLinks_by_owner 
        add constraint FK_count_to_Screen_annotationLinks 
        foreign key (Screen_id) 
        references screen  ;;

    alter table count_Screen_plateLinks_by_owner 
        add constraint FK_count_to_Screen_plateLinks 
        foreign key (Screen_id) 
        references screen  ;;

    alter table count_Session_annotationLinks_by_owner 
        add constraint FK_count_to_Session_annotationLinks 
        foreign key (Session_id) 
        references session  ;;

    alter table count_WellSample_annotationLinks_by_owner 
        add constraint FK_count_to_WellSample_annotationLinks 
        foreign key (WellSample_id) 
        references wellsample  ;;

    alter table count_Well_annotationLinks_by_owner 
        add constraint FK_count_to_Well_annotationLinks 
        foreign key (Well_id) 
        references well  ;;

    alter table count_Well_reagentLinks_by_owner 
        add constraint FK_count_to_Well_reagentLinks 
        foreign key (Well_id) 
        references well  ;;

    alter table dataset 
        add constraint FKdataset_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table dataset 
        add constraint FKdataset_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table dataset 
        add constraint FKdataset_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table dataset 
        add constraint FKdataset_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table dataset 
        add constraint FKdataset_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table datasetannotationlink 
        add constraint FKdatasetannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table datasetannotationlink 
        add constraint FKdatasetannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table datasetannotationlink 
        add constraint FKdatasetannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table datasetannotationlink 
        add constraint FKdatasetannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table datasetannotationlink 
        add constraint FKdatasetannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table datasetannotationlink 
        add constraint FKdatasetannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table datasetannotationlink 
        add constraint FKdatasetannotationlink_parent_dataset 
        foreign key (parent) 
        references dataset  ;;

    alter table datasetimagelink 
        add constraint FKdatasetimagelink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table datasetimagelink 
        add constraint FKdatasetimagelink_child_image 
        foreign key (child) 
        references image  ;;

    alter table datasetimagelink 
        add constraint FKdatasetimagelink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table datasetimagelink 
        add constraint FKdatasetimagelink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table datasetimagelink 
        add constraint FKdatasetimagelink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table datasetimagelink 
        add constraint FKdatasetimagelink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table datasetimagelink 
        add constraint FKdatasetimagelink_parent_dataset 
        foreign key (parent) 
        references dataset  ;;

    alter table dbpatch 
        add constraint FKdbpatch_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table detector 
        add constraint FKdetector_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table detector 
        add constraint FKdetector_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table detector 
        add constraint FKdetector_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table detector 
        add constraint FKdetector_type_detectortype 
        foreign key (type) 
        references detectortype  ;;

    alter table detector 
        add constraint FKdetector_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table detector 
        add constraint FKdetector_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table detector 
        add constraint FKdetector_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table detectorsettings 
        add constraint FKdetectorsettings_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table detectorsettings 
        add constraint FKdetectorsettings_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table detectorsettings 
        add constraint FKdetectorsettings_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table detectorsettings 
        add constraint FKdetectorsettings_binning_binning 
        foreign key (binning) 
        references binning  ;;

    alter table detectorsettings 
        add constraint FKdetectorsettings_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table detectorsettings 
        add constraint FKdetectorsettings_detector_detector 
        foreign key (detector) 
        references detector  ;;

    alter table detectorsettings 
        add constraint FKdetectorsettings_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table detectortype 
        add constraint FKdetectortype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table dichroic 
        add constraint FKdichroic_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table dichroic 
        add constraint FKdichroic_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table dichroic 
        add constraint FKdichroic_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table dichroic 
        add constraint FKdichroic_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table dichroic 
        add constraint FKdichroic_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table dichroic 
        add constraint FKdichroic_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table dimensionorder 
        add constraint FKdimensionorder_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table event 
        add constraint FKevent_experimenterGroup_experimentergroup 
        foreign key (experimenterGroup) 
        references experimentergroup  ;;

    alter table event 
        add constraint FKevent_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table event 
        add constraint FKevent_session_session 
        foreign key ("session") 
        references session  ;;

    alter table event 
        add constraint FKevent_containingEvent_event 
        foreign key (containingEvent) 
        references event  ;;

    alter table event 
        add constraint FKevent_type_eventtype 
        foreign key (type) 
        references eventtype  ;;

    alter table event 
        add constraint FKevent_experimenter_experimenter 
        foreign key (experimenter) 
        references experimenter  ;;

    alter table eventlog 
        add constraint FKeventlog_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table eventlog 
        add constraint FKeventlog_event_event 
        foreign key (event) 
        references event  ;;

    alter table eventtype 
        add constraint FKeventtype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table experiment 
        add constraint FKexperiment_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table experiment 
        add constraint FKexperiment_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table experiment 
        add constraint FKexperiment_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table experiment 
        add constraint FKexperiment_type_experimenttype 
        foreign key (type) 
        references experimenttype  ;;

    alter table experiment 
        add constraint FKexperiment_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table experiment 
        add constraint FKexperiment_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table experimenter 
        add constraint FKexperimenter_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table experimenterannotationlink 
        add constraint FKexperimenterannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table experimenterannotationlink 
        add constraint FKexperimenterannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table experimenterannotationlink 
        add constraint FKexperimenterannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table experimenterannotationlink 
        add constraint FKexperimenterannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table experimenterannotationlink 
        add constraint FKexperimenterannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table experimenterannotationlink 
        add constraint FKexperimenterannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table experimenterannotationlink 
        add constraint FKexperimenterannotationlink_parent_experimenter 
        foreign key (parent) 
        references experimenter  ;;

    alter table experimentergroup 
        add constraint FKexperimentergroup_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table experimentergroupannotationlink 
        add constraint FKexperimentergroupannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table experimentergroupannotationlink 
        add constraint FKexperimentergroupannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table experimentergroupannotationlink 
        add constraint FKexperimentergroupannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table experimentergroupannotationlink 
        add constraint FKexperimentergroupannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table experimentergroupannotationlink 
        add constraint FKexperimentergroupannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table experimentergroupannotationlink 
        add constraint FKexperimentergroupannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table experimentergroupannotationlink 
        add constraint FKexperimentergroupannotationlink_parent_experimentergroup 
        foreign key (parent) 
        references experimentergroup  ;;

    alter table experimenttype 
        add constraint FKexperimenttype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table externalinfo 
        add constraint FKexternalinfo_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table externalinfo 
        add constraint FKexternalinfo_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table externalinfo 
        add constraint FKexternalinfo_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table externalinfo 
        add constraint FKexternalinfo_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table family 
        add constraint FKfamily_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table filament 
        add constraint FKfilament_lightsource_id_lightsource 
        foreign key (lightsource_id) 
        references lightsource  ;;

    alter table filament 
        add constraint FKfilament_type_filamenttype 
        foreign key (type) 
        references filamenttype  ;;

    alter table filamenttype 
        add constraint FKfilamenttype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table filter 
        add constraint FKfilter_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table filter 
        add constraint FKfilter_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table filter 
        add constraint FKfilter_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table filter 
        add constraint FKfilter_transmittanceRange_transmittancerange 
        foreign key (transmittanceRange) 
        references transmittancerange  ;;

    alter table filter 
        add constraint FKfilter_type_filtertype 
        foreign key (type) 
        references filtertype  ;;

    alter table filter 
        add constraint FKfilter_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table filter 
        add constraint FKfilter_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table filter 
        add constraint FKfilter_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table filterset 
        add constraint FKfilterset_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table filterset 
        add constraint FKfilterset_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table filterset 
        add constraint FKfilterset_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table filterset 
        add constraint FKfilterset_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table filterset 
        add constraint FKfilterset_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table filterset 
        add constraint FKfilterset_dichroic_dichroic 
        foreign key (dichroic) 
        references dichroic  ;;

    alter table filterset 
        add constraint FKfilterset_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table filtersetemissionfilterlink 
        add constraint FKfiltersetemissionfilterlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table filtersetemissionfilterlink 
        add constraint FKfiltersetemissionfilterlink_child_filter 
        foreign key (child) 
        references filter  ;;

    alter table filtersetemissionfilterlink 
        add constraint FKfiltersetemissionfilterlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table filtersetemissionfilterlink 
        add constraint FKfiltersetemissionfilterlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table filtersetemissionfilterlink 
        add constraint FKfiltersetemissionfilterlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table filtersetemissionfilterlink 
        add constraint FKfiltersetemissionfilterlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table filtersetemissionfilterlink 
        add constraint FKfiltersetemissionfilterlink_parent_filterset 
        foreign key (parent) 
        references filterset  ;;

    alter table filtersetexcitationfilterlink 
        add constraint FKfiltersetexcitationfilterlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table filtersetexcitationfilterlink 
        add constraint FKfiltersetexcitationfilterlink_child_filter 
        foreign key (child) 
        references filter  ;;

    alter table filtersetexcitationfilterlink 
        add constraint FKfiltersetexcitationfilterlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table filtersetexcitationfilterlink 
        add constraint FKfiltersetexcitationfilterlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table filtersetexcitationfilterlink 
        add constraint FKfiltersetexcitationfilterlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table filtersetexcitationfilterlink 
        add constraint FKfiltersetexcitationfilterlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table filtersetexcitationfilterlink 
        add constraint FKfiltersetexcitationfilterlink_parent_filterset 
        foreign key (parent) 
        references filterset  ;;

    alter table filtertype 
        add constraint FKfiltertype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table format 
        add constraint FKformat_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table groupexperimentermap 
        add constraint FKgroupexperimentermap_child_experimenter 
        foreign key (child) 
        references experimenter  ;;

    alter table groupexperimentermap 
        add constraint FKgroupexperimentermap_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table groupexperimentermap 
        add constraint FKgroupexperimentermap_parent_experimentergroup 
        foreign key (parent) 
        references experimentergroup  ;;

    alter table illumination 
        add constraint FKillumination_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table image 
        add constraint FKimage_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table image 
        add constraint FKimage_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table image 
        add constraint FKimage_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table image 
        add constraint FKimage_imagingEnvironment_imagingenvironment 
        foreign key (imagingEnvironment) 
        references imagingenvironment  ;;

    alter table image 
        add constraint FKimage_experiment_experiment 
        foreign key (experiment) 
        references experiment  ;;

    alter table image 
        add constraint FKimage_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table image 
        add constraint FKimage_format_format 
        foreign key (format) 
        references format  ;;

    alter table image 
        add constraint FKimage_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table image 
        add constraint FKimage_stageLabel_stagelabel 
        foreign key (stageLabel) 
        references stagelabel  ;;

    alter table image 
        add constraint FKimage_objectiveSettings_objectivesettings 
        foreign key (objectiveSettings) 
        references objectivesettings  ;;

    alter table image 
        add constraint FKimage_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table imageannotationlink 
        add constraint FKimageannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table imageannotationlink 
        add constraint FKimageannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table imageannotationlink 
        add constraint FKimageannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table imageannotationlink 
        add constraint FKimageannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table imageannotationlink 
        add constraint FKimageannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table imageannotationlink 
        add constraint FKimageannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table imageannotationlink 
        add constraint FKimageannotationlink_parent_image 
        foreign key (parent) 
        references image  ;;

    alter table imagingenvironment 
        add constraint FKimagingenvironment_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table imagingenvironment 
        add constraint FKimagingenvironment_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table imagingenvironment 
        add constraint FKimagingenvironment_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table imagingenvironment 
        add constraint FKimagingenvironment_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table imagingenvironment 
        add constraint FKimagingenvironment_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table immersion 
        add constraint FKimmersion_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table importjob 
        add constraint FKimportjob_job_id_job 
        foreign key (job_id) 
        references job  ;;

    alter table instrument 
        add constraint FKinstrument_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table instrument 
        add constraint FKinstrument_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table instrument 
        add constraint FKinstrument_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table instrument 
        add constraint FKinstrument_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table instrument 
        add constraint FKinstrument_microscope_microscope 
        foreign key (microscope) 
        references microscope  ;;

    alter table instrument 
        add constraint FKinstrument_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table job 
        add constraint FKjob_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table job 
        add constraint FKjob_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table job 
        add constraint FKjob_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table job 
        add constraint FKjob_status_jobstatus 
        foreign key (status) 
        references jobstatus  ;;

    alter table job 
        add constraint FKjob_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table job 
        add constraint FKjob_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table joboriginalfilelink 
        add constraint FKjoboriginalfilelink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table joboriginalfilelink 
        add constraint FKjoboriginalfilelink_child_originalfile 
        foreign key (child) 
        references originalfile  ;;

    alter table joboriginalfilelink 
        add constraint FKjoboriginalfilelink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table joboriginalfilelink 
        add constraint FKjoboriginalfilelink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table joboriginalfilelink 
        add constraint FKjoboriginalfilelink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table joboriginalfilelink 
        add constraint FKjoboriginalfilelink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table joboriginalfilelink 
        add constraint FKjoboriginalfilelink_parent_job 
        foreign key (parent) 
        references job  ;;

    alter table jobstatus 
        add constraint FKjobstatus_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table laser 
        add constraint FKlaser_lightsource_id_lightsource 
        foreign key (lightsource_id) 
        references lightsource  ;;

    alter table laser 
        add constraint FKlaser_pump_lightsource 
        foreign key (pump) 
        references lightsource  ;;

    alter table laser 
        add constraint FKlaser_laserMedium_lasermedium 
        foreign key (laserMedium) 
        references lasermedium  ;;

    alter table laser 
        add constraint FKlaser_pulse_pulse 
        foreign key (pulse) 
        references pulse  ;;

    alter table laser 
        add constraint FKlaser_type_lasertype 
        foreign key (type) 
        references lasertype  ;;

    alter table lasermedium 
        add constraint FKlasermedium_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table lasertype 
        add constraint FKlasertype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table lightemittingdiode 
        add constraint FKlightemittingdiode_lightsource_id_lightsource 
        foreign key (lightsource_id) 
        references lightsource  ;;

    alter table lightpath 
        add constraint FKlightpath_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table lightpath 
        add constraint FKlightpath_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table lightpath 
        add constraint FKlightpath_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table lightpath 
        add constraint FKlightpath_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table lightpath 
        add constraint FKlightpath_dichroic_dichroic 
        foreign key (dichroic) 
        references dichroic  ;;

    alter table lightpath 
        add constraint FKlightpath_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table lightpathemissionfilterlink 
        add constraint FKlightpathemissionfilterlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table lightpathemissionfilterlink 
        add constraint FKlightpathemissionfilterlink_child_filter 
        foreign key (child) 
        references filter  ;;

    alter table lightpathemissionfilterlink 
        add constraint FKlightpathemissionfilterlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table lightpathemissionfilterlink 
        add constraint FKlightpathemissionfilterlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table lightpathemissionfilterlink 
        add constraint FKlightpathemissionfilterlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table lightpathemissionfilterlink 
        add constraint FKlightpathemissionfilterlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table lightpathemissionfilterlink 
        add constraint FKlightpathemissionfilterlink_parent_lightpath 
        foreign key (parent) 
        references lightpath  ;;

    alter table lightpathexcitationfilterlink 
        add constraint FKlightpathexcitationfilterlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table lightpathexcitationfilterlink 
        add constraint FKlightpathexcitationfilterlink_child_filter 
        foreign key (child) 
        references filter  ;;

    alter table lightpathexcitationfilterlink 
        add constraint FKlightpathexcitationfilterlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table lightpathexcitationfilterlink 
        add constraint FKlightpathexcitationfilterlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table lightpathexcitationfilterlink 
        add constraint FKlightpathexcitationfilterlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table lightpathexcitationfilterlink 
        add constraint FKlightpathexcitationfilterlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table lightpathexcitationfilterlink 
        add constraint FKlightpathexcitationfilterlink_parent_lightpath 
        foreign key (parent) 
        references lightpath  ;;

    alter table lightsettings 
        add constraint FKlightsettings_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table lightsettings 
        add constraint FKlightsettings_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table lightsettings 
        add constraint FKlightsettings_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table lightsettings 
        add constraint FKlightsettings_lightSource_lightsource 
        foreign key (lightSource) 
        references lightsource  ;;

    alter table lightsettings 
        add constraint FKlightsettings_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table lightsettings 
        add constraint FKlightsettings_microbeamManipulation_microbeammanipulation 
        foreign key (microbeamManipulation) 
        references microbeammanipulation  ;;

    alter table lightsettings 
        add constraint FKlightsettings_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table lightsource 
        add constraint FKlightsource_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table lightsource 
        add constraint FKlightsource_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table lightsource 
        add constraint FKlightsource_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table lightsource 
        add constraint FKlightsource_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table lightsource 
        add constraint FKlightsource_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table lightsource 
        add constraint FKlightsource_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table link 
        add constraint FKlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table link 
        add constraint FKlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table link 
        add constraint FKlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table link 
        add constraint FKlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table link 
        add constraint FKlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_photometricInterpretation_photometricinterpretation 
        foreign key (photometricInterpretation) 
        references photometricinterpretation  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_lightPath_lightpath 
        foreign key (lightPath) 
        references lightpath  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_mode_acquisitionmode 
        foreign key ("mode") 
        references acquisitionmode  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_otf_otf 
        foreign key (otf) 
        references otf  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_lightSourceSettings_lightsettings 
        foreign key (lightSourceSettings) 
        references lightsettings  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_filterSet_filterset 
        foreign key (filterSet) 
        references filterset  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_detectorSettings_detectorsettings 
        foreign key (detectorSettings) 
        references detectorsettings  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_contrastMethod_contrastmethod 
        foreign key (contrastMethod) 
        references contrastmethod  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table logicalchannel 
        add constraint FKlogicalchannel_illumination_illumination 
        foreign key (illumination) 
        references illumination  ;;

    alter table medium 
        add constraint FKmedium_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table microbeammanipulation 
        add constraint FKmicrobeammanipulation_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table microbeammanipulation 
        add constraint FKmicrobeammanipulation_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table microbeammanipulation 
        add constraint FKmicrobeammanipulation_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table microbeammanipulation 
        add constraint FKmicrobeammanipulation_experiment_experiment 
        foreign key (experiment) 
        references experiment  ;;

    alter table microbeammanipulation 
        add constraint FKmicrobeammanipulation_type_microbeammanipulationtype 
        foreign key (type) 
        references microbeammanipulationtype  ;;

    alter table microbeammanipulation 
        add constraint FKmicrobeammanipulation_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table microbeammanipulation 
        add constraint FKmicrobeammanipulation_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table microbeammanipulationtype 
        add constraint FKmicrobeammanipulationtype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table microscope 
        add constraint FKmicroscope_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table microscope 
        add constraint FKmicroscope_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table microscope 
        add constraint FKmicroscope_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table microscope 
        add constraint FKmicroscope_type_microscopetype 
        foreign key (type) 
        references microscopetype  ;;

    alter table microscope 
        add constraint FKmicroscope_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table microscope 
        add constraint FKmicroscope_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table microscopetype 
        add constraint FKmicroscopetype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table namespace 
        add constraint FKnamespace_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table namespace 
        add constraint FKnamespace_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table namespace 
        add constraint FKnamespace_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table namespace 
        add constraint FKnamespace_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table namespace 
        add constraint FKnamespace_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table namespaceannotationlink 
        add constraint FKnamespaceannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table namespaceannotationlink 
        add constraint FKnamespaceannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table namespaceannotationlink 
        add constraint FKnamespaceannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table namespaceannotationlink 
        add constraint FKnamespaceannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table namespaceannotationlink 
        add constraint FKnamespaceannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table namespaceannotationlink 
        add constraint FKnamespaceannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table namespaceannotationlink 
        add constraint FKnamespaceannotationlink_parent_namespace 
        foreign key (parent) 
        references namespace  ;;

    alter table node 
        add constraint FKnode_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table nodeannotationlink 
        add constraint FKnodeannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table nodeannotationlink 
        add constraint FKnodeannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table nodeannotationlink 
        add constraint FKnodeannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table nodeannotationlink 
        add constraint FKnodeannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table nodeannotationlink 
        add constraint FKnodeannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table nodeannotationlink 
        add constraint FKnodeannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table nodeannotationlink 
        add constraint FKnodeannotationlink_parent_node 
        foreign key (parent) 
        references node  ;;

    alter table objective 
        add constraint FKobjective_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table objective 
        add constraint FKobjective_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table objective 
        add constraint FKobjective_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table objective 
        add constraint FKobjective_immersion_immersion 
        foreign key (immersion) 
        references immersion  ;;

    alter table objective 
        add constraint FKobjective_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table objective 
        add constraint FKobjective_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table objective 
        add constraint FKobjective_correction_correction 
        foreign key (correction) 
        references correction  ;;

    alter table objective 
        add constraint FKobjective_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table objectivesettings 
        add constraint FKobjectivesettings_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table objectivesettings 
        add constraint FKobjectivesettings_medium_medium 
        foreign key (medium) 
        references medium  ;;

    alter table objectivesettings 
        add constraint FKobjectivesettings_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table objectivesettings 
        add constraint FKobjectivesettings_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table objectivesettings 
        add constraint FKobjectivesettings_objective_objective 
        foreign key (objective) 
        references objective  ;;

    alter table objectivesettings 
        add constraint FKobjectivesettings_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table objectivesettings 
        add constraint FKobjectivesettings_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table originalfile 
        add constraint FKoriginalfile_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table originalfile 
        add constraint FKoriginalfile_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table originalfile 
        add constraint FKoriginalfile_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table originalfile 
        add constraint FKoriginalfile_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table originalfile 
        add constraint FKoriginalfile_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table originalfileannotationlink 
        add constraint FKoriginalfileannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table originalfileannotationlink 
        add constraint FKoriginalfileannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table originalfileannotationlink 
        add constraint FKoriginalfileannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table originalfileannotationlink 
        add constraint FKoriginalfileannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table originalfileannotationlink 
        add constraint FKoriginalfileannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table originalfileannotationlink 
        add constraint FKoriginalfileannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table originalfileannotationlink 
        add constraint FKoriginalfileannotationlink_parent_originalfile 
        foreign key (parent) 
        references originalfile  ;;

    alter table otf 
        add constraint FKotf_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table otf 
        add constraint FKotf_filterSet_filterset 
        foreign key (filterSet) 
        references filterset  ;;

    alter table otf 
        add constraint FKotf_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table otf 
        add constraint FKotf_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table otf 
        add constraint FKotf_objective_objective 
        foreign key (objective) 
        references objective  ;;

    alter table otf 
        add constraint FKotf_instrument_instrument 
        foreign key (instrument) 
        references instrument  ;;

    alter table otf 
        add constraint FKotf_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table otf 
        add constraint FKotf_pixelsType_pixelstype 
        foreign key (pixelsType) 
        references pixelstype  ;;

    alter table otf 
        add constraint FKotf_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table parsejob 
        add constraint FKparsejob_job_id_job 
        foreign key (job_id) 
        references job  ;;

    alter table photometricinterpretation 
        add constraint FKphotometricinterpretation_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table pixels 
        add constraint FKpixels_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table pixels 
        add constraint FKpixels_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table pixels 
        add constraint FKpixels_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table pixels 
        add constraint FKpixels_dimensionOrder_dimensionorder 
        foreign key (dimensionOrder) 
        references dimensionorder  ;;

    alter table pixels 
        add constraint FKpixels_relatedTo_pixels 
        foreign key (relatedTo) 
        references pixels  ;;

    alter table pixels 
        add constraint FKpixels_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table pixels 
        add constraint FKpixels_image_image 
        foreign key (image) 
        references image  ;;

    alter table pixels 
        add constraint FKpixels_pixelsType_pixelstype 
        foreign key (pixelsType) 
        references pixelstype  ;;

    alter table pixels 
        add constraint FKpixels_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table pixelsannotationlink 
        add constraint FKpixelsannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table pixelsannotationlink 
        add constraint FKpixelsannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table pixelsannotationlink 
        add constraint FKpixelsannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table pixelsannotationlink 
        add constraint FKpixelsannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table pixelsannotationlink 
        add constraint FKpixelsannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table pixelsannotationlink 
        add constraint FKpixelsannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table pixelsannotationlink 
        add constraint FKpixelsannotationlink_parent_pixels 
        foreign key (parent) 
        references pixels  ;;

    alter table pixelsoriginalfilemap 
        add constraint FKpixelsoriginalfilemap_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table pixelsoriginalfilemap 
        add constraint FKpixelsoriginalfilemap_child_pixels 
        foreign key (child) 
        references pixels  ;;

    alter table pixelsoriginalfilemap 
        add constraint FKpixelsoriginalfilemap_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table pixelsoriginalfilemap 
        add constraint FKpixelsoriginalfilemap_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table pixelsoriginalfilemap 
        add constraint FKpixelsoriginalfilemap_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table pixelsoriginalfilemap 
        add constraint FKpixelsoriginalfilemap_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table pixelsoriginalfilemap 
        add constraint FKpixelsoriginalfilemap_parent_originalfile 
        foreign key (parent) 
        references originalfile  ;;

    alter table pixelstype 
        add constraint FKpixelstype_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table planeinfo 
        add constraint FKplaneinfo_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table planeinfo 
        add constraint FKplaneinfo_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table planeinfo 
        add constraint FKplaneinfo_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table planeinfo 
        add constraint FKplaneinfo_pixels_pixels 
        foreign key (pixels) 
        references pixels  ;;

    alter table planeinfo 
        add constraint FKplaneinfo_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table planeinfo 
        add constraint FKplaneinfo_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table planeinfoannotationlink 
        add constraint FKplaneinfoannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table planeinfoannotationlink 
        add constraint FKplaneinfoannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table planeinfoannotationlink 
        add constraint FKplaneinfoannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table planeinfoannotationlink 
        add constraint FKplaneinfoannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table planeinfoannotationlink 
        add constraint FKplaneinfoannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table planeinfoannotationlink 
        add constraint FKplaneinfoannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table planeinfoannotationlink 
        add constraint FKplaneinfoannotationlink_parent_planeinfo 
        foreign key (parent) 
        references planeinfo  ;;

    alter table planeslicingcontext 
        add constraint FKplaneslicingcontext_codomainmapcontext_id_codomainmapcontext 
        foreign key (codomainmapcontext_id) 
        references codomainmapcontext  ;;

    alter table plate 
        add constraint FKplate_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table plate 
        add constraint FKplate_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table plate 
        add constraint FKplate_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table plate 
        add constraint FKplate_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table plate 
        add constraint FKplate_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table plateacquisition 
        add constraint FKplateacquisition_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table plateacquisition 
        add constraint FKplateacquisition_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table plateacquisition 
        add constraint FKplateacquisition_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table plateacquisition 
        add constraint FKplateacquisition_plate_plate 
        foreign key (plate) 
        references plate  ;;

    alter table plateacquisition 
        add constraint FKplateacquisition_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table plateacquisition 
        add constraint FKplateacquisition_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table plateacquisitionannotationlink 
        add constraint FKplateacquisitionannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table plateacquisitionannotationlink 
        add constraint FKplateacquisitionannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table plateacquisitionannotationlink 
        add constraint FKplateacquisitionannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table plateacquisitionannotationlink 
        add constraint FKplateacquisitionannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table plateacquisitionannotationlink 
        add constraint FKplateacquisitionannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table plateacquisitionannotationlink 
        add constraint FKplateacquisitionannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table plateacquisitionannotationlink 
        add constraint FKplateacquisitionannotationlink_parent_plateacquisition 
        foreign key (parent) 
        references plateacquisition  ;;

    alter table plateannotationlink 
        add constraint FKplateannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table plateannotationlink 
        add constraint FKplateannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table plateannotationlink 
        add constraint FKplateannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table plateannotationlink 
        add constraint FKplateannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table plateannotationlink 
        add constraint FKplateannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table plateannotationlink 
        add constraint FKplateannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table plateannotationlink 
        add constraint FKplateannotationlink_parent_plate 
        foreign key (parent) 
        references plate  ;;

    alter table project 
        add constraint FKproject_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table project 
        add constraint FKproject_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table project 
        add constraint FKproject_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table project 
        add constraint FKproject_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table project 
        add constraint FKproject_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table projectannotationlink 
        add constraint FKprojectannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table projectannotationlink 
        add constraint FKprojectannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table projectannotationlink 
        add constraint FKprojectannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table projectannotationlink 
        add constraint FKprojectannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table projectannotationlink 
        add constraint FKprojectannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table projectannotationlink 
        add constraint FKprojectannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table projectannotationlink 
        add constraint FKprojectannotationlink_parent_project 
        foreign key (parent) 
        references project  ;;

    alter table projectdatasetlink 
        add constraint FKprojectdatasetlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table projectdatasetlink 
        add constraint FKprojectdatasetlink_child_dataset 
        foreign key (child) 
        references dataset  ;;

    alter table projectdatasetlink 
        add constraint FKprojectdatasetlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table projectdatasetlink 
        add constraint FKprojectdatasetlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table projectdatasetlink 
        add constraint FKprojectdatasetlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table projectdatasetlink 
        add constraint FKprojectdatasetlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table projectdatasetlink 
        add constraint FKprojectdatasetlink_parent_project 
        foreign key (parent) 
        references project  ;;

    alter table pulse 
        add constraint FKpulse_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table quantumdef 
        add constraint FKquantumdef_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table quantumdef 
        add constraint FKquantumdef_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table quantumdef 
        add constraint FKquantumdef_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table quantumdef 
        add constraint FKquantumdef_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table quantumdef 
        add constraint FKquantumdef_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table reagent 
        add constraint FKreagent_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table reagent 
        add constraint FKreagent_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table reagent 
        add constraint FKreagent_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table reagent 
        add constraint FKreagent_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table reagent 
        add constraint FKreagent_screen_screen 
        foreign key (screen) 
        references screen  ;;

    alter table reagent 
        add constraint FKreagent_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table reagentannotationlink 
        add constraint FKreagentannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table reagentannotationlink 
        add constraint FKreagentannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table reagentannotationlink 
        add constraint FKreagentannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table reagentannotationlink 
        add constraint FKreagentannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table reagentannotationlink 
        add constraint FKreagentannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table reagentannotationlink 
        add constraint FKreagentannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table reagentannotationlink 
        add constraint FKreagentannotationlink_parent_reagent 
        foreign key (parent) 
        references reagent  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_quantization_quantumdef 
        foreign key (quantization) 
        references quantumdef  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_model_renderingmodel 
        foreign key (model) 
        references renderingmodel  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_pixels_pixels 
        foreign key (pixels) 
        references pixels  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table renderingdef 
        add constraint FKrenderingdef_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table renderingmodel 
        add constraint FKrenderingmodel_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table reverseintensitycontext 
        add constraint FKreverseintensitycontext_codomainmapcontext_id_codomainmapcontext 
        foreign key (codomainmapcontext_id) 
        references codomainmapcontext  ;;

    alter table roi 
        add constraint FKroi_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table roi 
        add constraint FKroi_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table roi 
        add constraint FKroi_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table roi 
        add constraint FKroi_source_originalfile 
        foreign key (source) 
        references originalfile  ;;

    alter table roi 
        add constraint FKroi_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table roi 
        add constraint FKroi_image_image 
        foreign key (image) 
        references image  ;;

    alter table roi 
        add constraint FKroi_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table roiannotationlink 
        add constraint FKroiannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table roiannotationlink 
        add constraint FKroiannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table roiannotationlink 
        add constraint FKroiannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table roiannotationlink 
        add constraint FKroiannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table roiannotationlink 
        add constraint FKroiannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table roiannotationlink 
        add constraint FKroiannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table roiannotationlink 
        add constraint FKroiannotationlink_parent_roi 
        foreign key (parent) 
        references roi  ;;

    alter table screen 
        add constraint FKscreen_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table screen 
        add constraint FKscreen_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table screen 
        add constraint FKscreen_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table screen 
        add constraint FKscreen_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table screen 
        add constraint FKscreen_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table screenannotationlink 
        add constraint FKscreenannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table screenannotationlink 
        add constraint FKscreenannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table screenannotationlink 
        add constraint FKscreenannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table screenannotationlink 
        add constraint FKscreenannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table screenannotationlink 
        add constraint FKscreenannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table screenannotationlink 
        add constraint FKscreenannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table screenannotationlink 
        add constraint FKscreenannotationlink_parent_screen 
        foreign key (parent) 
        references screen  ;;

    alter table screenplatelink 
        add constraint FKscreenplatelink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table screenplatelink 
        add constraint FKscreenplatelink_child_plate 
        foreign key (child) 
        references plate  ;;

    alter table screenplatelink 
        add constraint FKscreenplatelink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table screenplatelink 
        add constraint FKscreenplatelink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table screenplatelink 
        add constraint FKscreenplatelink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table screenplatelink 
        add constraint FKscreenplatelink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table screenplatelink 
        add constraint FKscreenplatelink_parent_screen 
        foreign key (parent) 
        references screen  ;;

    alter table scriptjob 
        add constraint FKscriptjob_job_id_job 
        foreign key (job_id) 
        references job  ;;

    alter table session 
        add constraint FKsession_node_node 
        foreign key (node) 
        references node  ;;

    alter table session 
        add constraint FKsession_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table session 
        add constraint FKsession_owner_experimenter 
        foreign key (owner) 
        references experimenter  ;;

    alter table sessionannotationlink 
        add constraint FKsessionannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table sessionannotationlink 
        add constraint FKsessionannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table sessionannotationlink 
        add constraint FKsessionannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table sessionannotationlink 
        add constraint FKsessionannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table sessionannotationlink 
        add constraint FKsessionannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table sessionannotationlink 
        add constraint FKsessionannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table sessionannotationlink 
        add constraint FKsessionannotationlink_parent_session 
        foreign key (parent) 
        references session  ;;

    alter table shape 
        add constraint FKshape_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table shape 
        add constraint FKshape_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table shape 
        add constraint FKshape_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table shape 
        add constraint FKmask_pixels_pixels 
        foreign key (pixels) 
        references pixels  ;;

    alter table shape 
        add constraint FKshape_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table shape 
        add constraint FKshape_roi_roi 
        foreign key (roi) 
        references roi  ;;

    alter table shape 
        add constraint FKshape_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table share 
        add constraint FKshare_group_experimentergroup 
        foreign key ("group") 
        references experimentergroup  ;;

    alter table share 
        add constraint FKshare_session_id_session 
        foreign key (session_id) 
        references session  ;;

    alter table sharemember 
        add constraint FKsharemember_child_experimenter 
        foreign key (child) 
        references experimenter  ;;

    alter table sharemember 
        add constraint FKsharemember_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table sharemember 
        add constraint FKsharemember_parent_share 
        foreign key (parent) 
        references share  ;;

    alter table stagelabel 
        add constraint FKstagelabel_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table stagelabel 
        add constraint FKstagelabel_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table stagelabel 
        add constraint FKstagelabel_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table stagelabel 
        add constraint FKstagelabel_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table stagelabel 
        add constraint FKstagelabel_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table statsinfo 
        add constraint FKstatsinfo_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table statsinfo 
        add constraint FKstatsinfo_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table statsinfo 
        add constraint FKstatsinfo_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table statsinfo 
        add constraint FKstatsinfo_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table statsinfo 
        add constraint FKstatsinfo_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table thumbnail 
        add constraint FKthumbnail_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table thumbnail 
        add constraint FKthumbnail_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table thumbnail 
        add constraint FKthumbnail_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table thumbnail 
        add constraint FKthumbnail_pixels_pixels 
        foreign key (pixels) 
        references pixels  ;;

    alter table thumbnail 
        add constraint FKthumbnail_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table thumbnail 
        add constraint FKthumbnail_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table transmittancerange 
        add constraint FKtransmittancerange_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table transmittancerange 
        add constraint FKtransmittancerange_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table transmittancerange 
        add constraint FKtransmittancerange_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table transmittancerange 
        add constraint FKtransmittancerange_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table transmittancerange 
        add constraint FKtransmittancerange_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table well 
        add constraint FKwell_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table well 
        add constraint FKwell_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table well 
        add constraint FKwell_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table well 
        add constraint FKwell_plate_plate 
        foreign key (plate) 
        references plate  ;;

    alter table well 
        add constraint FKwell_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table well 
        add constraint FKwell_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table wellannotationlink 
        add constraint FKwellannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table wellannotationlink 
        add constraint FKwellannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table wellannotationlink 
        add constraint FKwellannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table wellannotationlink 
        add constraint FKwellannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table wellannotationlink 
        add constraint FKwellannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table wellannotationlink 
        add constraint FKwellannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table wellannotationlink 
        add constraint FKwellannotationlink_parent_well 
        foreign key (parent) 
        references well  ;;

    alter table wellreagentlink 
        add constraint FKwellreagentlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table wellreagentlink 
        add constraint FKwellreagentlink_child_reagent 
        foreign key (child) 
        references reagent  ;;

    alter table wellreagentlink 
        add constraint FKwellreagentlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table wellreagentlink 
        add constraint FKwellreagentlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table wellreagentlink 
        add constraint FKwellreagentlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table wellreagentlink 
        add constraint FKwellreagentlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table wellreagentlink 
        add constraint FKwellreagentlink_parent_well 
        foreign key (parent) 
        references well  ;;

    alter table wellsample 
        add constraint FKwellsample_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table wellsample 
        add constraint FKwellsample_plateAcquisition_plateacquisition 
        foreign key (plateAcquisition) 
        references plateacquisition  ;;

    alter table wellsample 
        add constraint FKwellsample_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table wellsample 
        add constraint FKwellsample_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table wellsample 
        add constraint FKwellsample_well_well 
        foreign key (well) 
        references well  ;;

    alter table wellsample 
        add constraint FKwellsample_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table wellsample 
        add constraint FKwellsample_image_image 
        foreign key (image) 
        references image  ;;

    alter table wellsample 
        add constraint FKwellsample_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table wellsampleannotationlink 
        add constraint FKwellsampleannotationlink_creation_id_event 
        foreign key (creation_id) 
        references event  ;;

    alter table wellsampleannotationlink 
        add constraint FKwellsampleannotationlink_child_annotation 
        foreign key (child) 
        references annotation  ;;

    alter table wellsampleannotationlink 
        add constraint FKwellsampleannotationlink_update_id_event 
        foreign key (update_id) 
        references event  ;;

    alter table wellsampleannotationlink 
        add constraint FKwellsampleannotationlink_external_id_externalinfo 
        foreign key (external_id) 
        references externalinfo  ;;

    alter table wellsampleannotationlink 
        add constraint FKwellsampleannotationlink_group_id_experimentergroup 
        foreign key (group_id) 
        references experimentergroup  ;;

    alter table wellsampleannotationlink 
        add constraint FKwellsampleannotationlink_owner_id_experimenter 
        foreign key (owner_id) 
        references experimenter  ;;

    alter table wellsampleannotationlink 
        add constraint FKwellsampleannotationlink_parent_wellsample 
        foreign key (parent) 
        references wellsample  ;;

    create table seq_table (
         sequence_name varchar(255) not null ,
         next_val int8,
        primary key ( sequence_name ) 
    ) ;;
--
-- Copyright 2008 Glencoe Software, Inc. All rights reserved.
-- Use is subject to license terms supplied in LICENSE.txt
--

-- This file was generated by dsl/resources/ome/dsl/views.vm
-- and can be used to overwrite the generated Map<Long, Long> tables
-- with functional views.

  DROP TABLE count_Dataset_projectLinks_by_owner;

  CREATE OR REPLACE VIEW count_Dataset_projectLinks_by_owner (Dataset_id, owner_id, count) AS select child, owner_id, count(*)
    FROM projectdatasetlink GROUP BY child, owner_id ORDER BY child;

  DROP TABLE count_Dataset_imageLinks_by_owner;

  CREATE OR REPLACE VIEW count_Dataset_imageLinks_by_owner (Dataset_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM datasetimagelink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Dataset_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Dataset_annotationLinks_by_owner (Dataset_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM datasetannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Plate_screenLinks_by_owner;

  CREATE OR REPLACE VIEW count_Plate_screenLinks_by_owner (Plate_id, owner_id, count) AS select child, owner_id, count(*)
    FROM screenplatelink GROUP BY child, owner_id ORDER BY child;

  DROP TABLE count_Plate_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Plate_annotationLinks_by_owner (Plate_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM plateannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Channel_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Channel_annotationLinks_by_owner (Channel_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM channelannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_WellSample_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_WellSample_annotationLinks_by_owner (WellSample_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM wellsampleannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_PlaneInfo_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_PlaneInfo_annotationLinks_by_owner (PlaneInfo_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM planeinfoannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Namespace_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Namespace_annotationLinks_by_owner (Namespace_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM namespaceannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Image_datasetLinks_by_owner;

  CREATE OR REPLACE VIEW count_Image_datasetLinks_by_owner (Image_id, owner_id, count) AS select child, owner_id, count(*)
    FROM datasetimagelink GROUP BY child, owner_id ORDER BY child;

  DROP TABLE count_Image_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Image_annotationLinks_by_owner (Image_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM imageannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Project_datasetLinks_by_owner;

  CREATE OR REPLACE VIEW count_Project_datasetLinks_by_owner (Project_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM projectdatasetlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Project_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Project_annotationLinks_by_owner (Project_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM projectannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Pixels_pixelsFileMaps_by_owner;

  CREATE OR REPLACE VIEW count_Pixels_pixelsFileMaps_by_owner (Pixels_id, owner_id, count) AS select child, owner_id, count(*)
    FROM pixelsoriginalfilemap GROUP BY child, owner_id ORDER BY child;

  DROP TABLE count_Pixels_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Pixels_annotationLinks_by_owner (Pixels_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM pixelsannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_LightPath_excitationFilterLink_by_owner;

  CREATE OR REPLACE VIEW count_LightPath_excitationFilterLink_by_owner (LightPath_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM lightpathexcitationfilterlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_LightPath_emissionFilterLink_by_owner;

  CREATE OR REPLACE VIEW count_LightPath_emissionFilterLink_by_owner (LightPath_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM lightpathemissionfilterlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Roi_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Roi_annotationLinks_by_owner (Roi_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM roiannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Well_reagentLinks_by_owner;

  CREATE OR REPLACE VIEW count_Well_reagentLinks_by_owner (Well_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM wellreagentlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Well_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Well_annotationLinks_by_owner (Well_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM wellannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Reagent_wellLinks_by_owner;

  CREATE OR REPLACE VIEW count_Reagent_wellLinks_by_owner (Reagent_id, owner_id, count) AS select child, owner_id, count(*)
    FROM wellreagentlink GROUP BY child, owner_id ORDER BY child;

  DROP TABLE count_Reagent_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Reagent_annotationLinks_by_owner (Reagent_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM reagentannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_OriginalFile_pixelsFileMaps_by_owner;

  CREATE OR REPLACE VIEW count_OriginalFile_pixelsFileMaps_by_owner (OriginalFile_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM pixelsoriginalfilemap GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_OriginalFile_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_OriginalFile_annotationLinks_by_owner (OriginalFile_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM originalfileannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Annotation_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Annotation_annotationLinks_by_owner (Annotation_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM annotationannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Job_originalFileLinks_by_owner;

  CREATE OR REPLACE VIEW count_Job_originalFileLinks_by_owner (Job_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM joboriginalfilelink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_FilterSet_excitationFilterLink_by_owner;

  CREATE OR REPLACE VIEW count_FilterSet_excitationFilterLink_by_owner (FilterSet_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM filtersetexcitationfilterlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_FilterSet_emissionFilterLink_by_owner;

  CREATE OR REPLACE VIEW count_FilterSet_emissionFilterLink_by_owner (FilterSet_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM filtersetemissionfilterlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Screen_plateLinks_by_owner;

  CREATE OR REPLACE VIEW count_Screen_plateLinks_by_owner (Screen_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM screenplatelink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Screen_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_Screen_annotationLinks_by_owner (Screen_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM screenannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_PlateAcquisition_annotationLinks_by_owner;

  CREATE OR REPLACE VIEW count_PlateAcquisition_annotationLinks_by_owner (PlateAcquisition_id, owner_id, count) AS select parent, owner_id, count(*)
    FROM plateacquisitionannotationlink GROUP BY parent, owner_id ORDER BY parent;

  DROP TABLE count_Filter_excitationFilterLink_by_owner;

  CREATE OR REPLACE VIEW count_Filter_excitationFilterLink_by_owner (Filter_id, owner_id, count) AS select child, owner_id, count(*)
    FROM filtersetexcitationfilterlink GROUP BY child, owner_id ORDER BY child;

  DROP TABLE count_Filter_emissionFilterLink_by_owner;

  CREATE OR REPLACE VIEW count_Filter_emissionFilterLink_by_owner (Filter_id, owner_id, count) AS select child, owner_id, count(*)
    FROM filtersetemissionfilterlink GROUP BY child, owner_id ORDER BY child;

--
-- Copyright 2006 University of Dundee. All rights reserved.
-- Use is subject to license terms supplied in LICENSE.txt
--

--
-- This file was generated by dsl/resources/ome/dsl/psql-footer.vm
--

--
-- Triggers
--
  CREATE OR REPLACE FUNCTION channel_pixels_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.pixels = old.pixels AND new.pixels_index = old.pixels_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM channel
       WHERE pixels = new.pixels AND pixels_index = new.pixels_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping channel % via (-1 - oldvalue )'', duplicate;
          UPDATE channel SET pixels_index = -1 - pixels_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER channel_pixels_index_trigger
        BEFORE UPDATE ON channel
        FOR EACH ROW EXECUTE PROCEDURE channel_pixels_index_move ();

  CREATE OR REPLACE FUNCTION wellsample_well_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.well = old.well AND new.well_index = old.well_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM wellsample
       WHERE well = new.well AND well_index = new.well_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping wellsample % via (-1 - oldvalue )'', duplicate;
          UPDATE wellsample SET well_index = -1 - well_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER wellsample_well_index_trigger
        BEFORE UPDATE ON wellsample
        FOR EACH ROW EXECUTE PROCEDURE wellsample_well_index_move ();

  CREATE OR REPLACE FUNCTION lightpathexcitationfilterlink_parent_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.parent = old.parent AND new.parent_index = old.parent_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM lightpathexcitationfilterlink
       WHERE parent = new.parent AND parent_index = new.parent_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping lightpathexcitationfilterlink % via (-1 - oldvalue )'', duplicate;
          UPDATE lightpathexcitationfilterlink SET parent_index = -1 - parent_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER lightpathexcitationfilterlink_parent_index_trigger
        BEFORE UPDATE ON lightpathexcitationfilterlink
        FOR EACH ROW EXECUTE PROCEDURE lightpathexcitationfilterlink_parent_index_move ();

  CREATE OR REPLACE FUNCTION groupexperimentermap_child_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.child = old.child AND new.child_index = old.child_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM groupexperimentermap
       WHERE child = new.child AND child_index = new.child_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping groupexperimentermap % via (-1 - oldvalue )'', duplicate;
          UPDATE groupexperimentermap SET child_index = -1 - child_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER groupexperimentermap_child_index_trigger
        BEFORE UPDATE ON groupexperimentermap
        FOR EACH ROW EXECUTE PROCEDURE groupexperimentermap_child_index_move ();

  CREATE OR REPLACE FUNCTION codomainmapcontext_renderingDef_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.renderingDef = old.renderingDef AND new.renderingDef_index = old.renderingDef_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM codomainmapcontext
       WHERE renderingDef = new.renderingDef AND renderingDef_index = new.renderingDef_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping codomainmapcontext % via (-1 - oldvalue )'', duplicate;
          UPDATE codomainmapcontext SET renderingDef_index = -1 - renderingDef_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER codomainmapcontext_renderingDef_index_trigger
        BEFORE UPDATE ON codomainmapcontext
        FOR EACH ROW EXECUTE PROCEDURE codomainmapcontext_renderingDef_index_move ();

  CREATE OR REPLACE FUNCTION pixels_image_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.image = old.image AND new.image_index = old.image_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM pixels
       WHERE image = new.image AND image_index = new.image_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping pixels % via (-1 - oldvalue )'', duplicate;
          UPDATE pixels SET image_index = -1 - image_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER pixels_image_index_trigger
        BEFORE UPDATE ON pixels
        FOR EACH ROW EXECUTE PROCEDURE pixels_image_index_move ();

  CREATE OR REPLACE FUNCTION channelbinding_renderingDef_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.renderingDef = old.renderingDef AND new.renderingDef_index = old.renderingDef_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM channelbinding
       WHERE renderingDef = new.renderingDef AND renderingDef_index = new.renderingDef_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping channelbinding % via (-1 - oldvalue )'', duplicate;
          UPDATE channelbinding SET renderingDef_index = -1 - renderingDef_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER channelbinding_renderingDef_index_trigger
        BEFORE UPDATE ON channelbinding
        FOR EACH ROW EXECUTE PROCEDURE channelbinding_renderingDef_index_move ();

  CREATE OR REPLACE FUNCTION shape_roi_index_move() RETURNS "trigger" AS '
    DECLARE
      duplicate INT8;
    BEGIN

      -- Avoids a query if the new and old values of x are the same.
      IF new.roi = old.roi AND new.roi_index = old.roi_index THEN
          RETURN new;
      END IF;

      -- At most, there should be one duplicate
      SELECT id INTO duplicate
        FROM shape
       WHERE roi = new.roi AND roi_index = new.roi_index
      OFFSET 0
       LIMIT 1;

      IF duplicate IS NOT NULL THEN
          RAISE NOTICE ''Remapping shape % via (-1 - oldvalue )'', duplicate;
          UPDATE shape SET roi_index = -1 - roi_index WHERE id = duplicate;
      END IF;

      RETURN new;
    END;' LANGUAGE plpgsql;

  CREATE TRIGGER shape_roi_index_trigger
        BEFORE UPDATE ON shape
        FOR EACH ROW EXECUTE PROCEDURE shape_roi_index_move ();


--
-- Indexes
--
  CREATE INDEX i_wellsampleannotationlink_owner ON wellsampleannotationlink(owner_id);
  CREATE INDEX i_wellsampleannotationlink_group ON wellsampleannotationlink(group_id);
  CREATE INDEX i_WellSampleAnnotationLink_parent ON wellsampleannotationlink(parent);
  CREATE INDEX i_WellSampleAnnotationLink_child ON wellsampleannotationlink(child);
  CREATE INDEX i_wellannotationlink_owner ON wellannotationlink(owner_id);
  CREATE INDEX i_wellannotationlink_group ON wellannotationlink(group_id);
  CREATE INDEX i_WellAnnotationLink_parent ON wellannotationlink(parent);
  CREATE INDEX i_WellAnnotationLink_child ON wellannotationlink(child);
  CREATE INDEX i_dataset_owner ON dataset(owner_id);
  CREATE INDEX i_dataset_group ON dataset(group_id);
  CREATE INDEX i_plate_owner ON plate(owner_id);
  CREATE INDEX i_plate_group ON plate(group_id);
  CREATE INDEX i_thumbnail_owner ON thumbnail(owner_id);
  CREATE INDEX i_thumbnail_group ON thumbnail(group_id);
  CREATE INDEX i_Thumbnail_pixels ON thumbnail(pixels);
  CREATE INDEX i_channel_owner ON channel(owner_id);
  CREATE INDEX i_channel_group ON channel(group_id);
  CREATE INDEX i_Channel_statsInfo ON channel(statsInfo);
  CREATE INDEX i_Channel_logicalChannel ON channel(logicalChannel);
  CREATE INDEX i_Channel_pixels ON channel(pixels);
  CREATE INDEX i_imageannotationlink_owner ON imageannotationlink(owner_id);
  CREATE INDEX i_imageannotationlink_group ON imageannotationlink(group_id);
  CREATE INDEX i_ImageAnnotationLink_parent ON imageannotationlink(parent);
  CREATE INDEX i_ImageAnnotationLink_child ON imageannotationlink(child);
  CREATE INDEX i_link_owner ON link(owner_id);
  CREATE INDEX i_link_group ON link(group_id);
  CREATE INDEX i_lightpathemissionfilterlink_owner ON lightpathemissionfilterlink(owner_id);
  CREATE INDEX i_lightpathemissionfilterlink_group ON lightpathemissionfilterlink(group_id);
  CREATE INDEX i_LightPathEmissionFilterLink_parent ON lightpathemissionfilterlink(parent);
  CREATE INDEX i_LightPathEmissionFilterLink_child ON lightpathemissionfilterlink(child);
  CREATE INDEX i_filtersetemissionfilterlink_owner ON filtersetemissionfilterlink(owner_id);
  CREATE INDEX i_filtersetemissionfilterlink_group ON filtersetemissionfilterlink(group_id);
  CREATE INDEX i_FilterSetEmissionFilterLink_parent ON filtersetemissionfilterlink(parent);
  CREATE INDEX i_FilterSetEmissionFilterLink_child ON filtersetemissionfilterlink(child);
  CREATE INDEX i_filtersetexcitationfilterlink_owner ON filtersetexcitationfilterlink(owner_id);
  CREATE INDEX i_filtersetexcitationfilterlink_group ON filtersetexcitationfilterlink(group_id);
  CREATE INDEX i_FilterSetExcitationFilterLink_parent ON filtersetexcitationfilterlink(parent);
  CREATE INDEX i_FilterSetExcitationFilterLink_child ON filtersetexcitationfilterlink(child);
  CREATE INDEX i_microscope_owner ON microscope(owner_id);
  CREATE INDEX i_microscope_group ON microscope(group_id);
  CREATE INDEX i_Microscope_type ON microscope(type);
  CREATE INDEX i_originalfileannotationlink_owner ON originalfileannotationlink(owner_id);
  CREATE INDEX i_originalfileannotationlink_group ON originalfileannotationlink(group_id);
  CREATE INDEX i_OriginalFileAnnotationLink_parent ON originalfileannotationlink(parent);
  CREATE INDEX i_OriginalFileAnnotationLink_child ON originalfileannotationlink(child);
  CREATE INDEX i_wellsample_owner ON wellsample(owner_id);
  CREATE INDEX i_wellsample_group ON wellsample(group_id);
  CREATE INDEX i_WellSample_plateAcquisition ON wellsample(plateAcquisition);
  CREATE INDEX i_WellSample_well ON wellsample(well);
  CREATE INDEX i_WellSample_image ON wellsample(image);
  CREATE INDEX i_planeinfo_owner ON planeinfo(owner_id);
  CREATE INDEX i_planeinfo_group ON planeinfo(group_id);
  CREATE INDEX i_PlaneInfo_pixels ON planeinfo(pixels);
  CREATE INDEX i_lightpathexcitationfilterlink_owner ON lightpathexcitationfilterlink(owner_id);
  CREATE INDEX i_lightpathexcitationfilterlink_group ON lightpathexcitationfilterlink(group_id);
  CREATE INDEX i_LightPathExcitationFilterLink_parent ON lightpathexcitationfilterlink(parent);
  CREATE INDEX i_LightPathExcitationFilterLink_child ON lightpathexcitationfilterlink(child);
  CREATE INDEX i_GroupExperimenterMap_parent ON groupexperimentermap(parent);
  CREATE INDEX i_GroupExperimenterMap_child ON groupexperimentermap(child);
  CREATE INDEX i_planeinfoannotationlink_owner ON planeinfoannotationlink(owner_id);
  CREATE INDEX i_planeinfoannotationlink_group ON planeinfoannotationlink(group_id);
  CREATE INDEX i_PlaneInfoAnnotationLink_parent ON planeinfoannotationlink(parent);
  CREATE INDEX i_PlaneInfoAnnotationLink_child ON planeinfoannotationlink(child);
  CREATE INDEX i_transmittancerange_owner ON transmittancerange(owner_id);
  CREATE INDEX i_transmittancerange_group ON transmittancerange(group_id);
  CREATE INDEX i_wellreagentlink_owner ON wellreagentlink(owner_id);
  CREATE INDEX i_wellreagentlink_group ON wellreagentlink(group_id);
  CREATE INDEX i_WellReagentLink_parent ON wellreagentlink(parent);
  CREATE INDEX i_WellReagentLink_child ON wellreagentlink(child);
  CREATE INDEX i_Arc_type ON arc(type);
  CREATE INDEX i_EventLog_event ON eventlog(event);
  CREATE INDEX i_quantumdef_owner ON quantumdef(owner_id);
  CREATE INDEX i_quantumdef_group ON quantumdef(group_id);
  CREATE INDEX i_namespace_owner ON namespace(owner_id);
  CREATE INDEX i_namespace_group ON namespace(group_id);
  CREATE INDEX i_image_owner ON image(owner_id);
  CREATE INDEX i_image_group ON image(group_id);
  CREATE INDEX i_Image_format ON image(format);
  CREATE INDEX i_Image_imagingEnvironment ON image(imagingEnvironment);
  CREATE INDEX i_Image_objectiveSettings ON image(objectiveSettings);
  CREATE INDEX i_Image_instrument ON image(instrument);
  CREATE INDEX i_Image_stageLabel ON image(stageLabel);
  CREATE INDEX i_Image_experiment ON image(experiment);
  CREATE INDEX i_microbeammanipulation_owner ON microbeammanipulation(owner_id);
  CREATE INDEX i_microbeammanipulation_group ON microbeammanipulation(group_id);
  CREATE INDEX i_MicrobeamManipulation_type ON microbeammanipulation(type);
  CREATE INDEX i_MicrobeamManipulation_experiment ON microbeammanipulation(experiment);
  CREATE INDEX i_joboriginalfilelink_owner ON joboriginalfilelink(owner_id);
  CREATE INDEX i_joboriginalfilelink_group ON joboriginalfilelink(group_id);
  CREATE INDEX i_JobOriginalFileLink_parent ON joboriginalfilelink(parent);
  CREATE INDEX i_JobOriginalFileLink_child ON joboriginalfilelink(child);
  CREATE INDEX i_renderingdef_owner ON renderingdef(owner_id);
  CREATE INDEX i_renderingdef_group ON renderingdef(group_id);
  CREATE INDEX i_RenderingDef_pixels ON renderingdef(pixels);
  CREATE INDEX i_RenderingDef_model ON renderingdef(model);
  CREATE INDEX i_RenderingDef_quantization ON renderingdef(quantization);
  CREATE INDEX i_datasetimagelink_owner ON datasetimagelink(owner_id);
  CREATE INDEX i_datasetimagelink_group ON datasetimagelink(group_id);
  CREATE INDEX i_DatasetImageLink_parent ON datasetimagelink(parent);
  CREATE INDEX i_DatasetImageLink_child ON datasetimagelink(child);
  CREATE INDEX i_codomainmapcontext_owner ON codomainmapcontext(owner_id);
  CREATE INDEX i_codomainmapcontext_group ON codomainmapcontext(group_id);
  CREATE INDEX i_CodomainMapContext_renderingDef ON codomainmapcontext(renderingDef);
  CREATE INDEX i_project_owner ON project(owner_id);
  CREATE INDEX i_project_group ON project(group_id);
  CREATE INDEX i_channelannotationlink_owner ON channelannotationlink(owner_id);
  CREATE INDEX i_channelannotationlink_group ON channelannotationlink(group_id);
  CREATE INDEX i_ChannelAnnotationLink_parent ON channelannotationlink(parent);
  CREATE INDEX i_ChannelAnnotationLink_child ON channelannotationlink(child);
  CREATE INDEX i_stagelabel_owner ON stagelabel(owner_id);
  CREATE INDEX i_stagelabel_group ON stagelabel(group_id);
  CREATE INDEX i_experimentergroupannotationlink_owner ON experimentergroupannotationlink(owner_id);
  CREATE INDEX i_experimentergroupannotationlink_group ON experimentergroupannotationlink(group_id);
  CREATE INDEX i_ExperimenterGroupAnnotationLink_parent ON experimentergroupannotationlink(parent);
  CREATE INDEX i_ExperimenterGroupAnnotationLink_child ON experimentergroupannotationlink(child);
  CREATE INDEX i_pixels_owner ON pixels(owner_id);
  CREATE INDEX i_pixels_group ON pixels(group_id);
  CREATE INDEX i_Pixels_image ON pixels(image);
  CREATE INDEX i_Pixels_relatedTo ON pixels(relatedTo);
  CREATE INDEX i_Pixels_pixelsType ON pixels(pixelsType);
  CREATE INDEX i_Pixels_dimensionOrder ON pixels(dimensionOrder);
  CREATE INDEX i_lightpath_owner ON lightpath(owner_id);
  CREATE INDEX i_lightpath_group ON lightpath(group_id);
  CREATE INDEX i_LightPath_dichroic ON lightpath(dichroic);
  CREATE INDEX i_roi_owner ON roi(owner_id);
  CREATE INDEX i_roi_group ON roi(group_id);
  CREATE INDEX i_Roi_image ON roi(image);
  CREATE INDEX i_Roi_source ON roi(source);
  CREATE INDEX i_roiannotationlink_owner ON roiannotationlink(owner_id);
  CREATE INDEX i_roiannotationlink_group ON roiannotationlink(group_id);
  CREATE INDEX i_RoiAnnotationLink_parent ON roiannotationlink(parent);
  CREATE INDEX i_RoiAnnotationLink_child ON roiannotationlink(child);
  CREATE INDEX i_externalinfo_owner ON externalinfo(owner_id);
  CREATE INDEX i_externalinfo_group ON externalinfo(group_id);
  CREATE INDEX i_FileAnnotation_file ON annotation("file");
  CREATE INDEX i_annotationannotationlink_owner ON annotationannotationlink(owner_id);
  CREATE INDEX i_annotationannotationlink_group ON annotationannotationlink(group_id);
  CREATE INDEX i_AnnotationAnnotationLink_parent ON annotationannotationlink(parent);
  CREATE INDEX i_AnnotationAnnotationLink_child ON annotationannotationlink(child);
  CREATE INDEX i_objectivesettings_owner ON objectivesettings(owner_id);
  CREATE INDEX i_objectivesettings_group ON objectivesettings(group_id);
  CREATE INDEX i_ObjectiveSettings_medium ON objectivesettings(medium);
  CREATE INDEX i_ObjectiveSettings_objective ON objectivesettings(objective);
  CREATE INDEX i_nodeannotationlink_owner ON nodeannotationlink(owner_id);
  CREATE INDEX i_nodeannotationlink_group ON nodeannotationlink(group_id);
  CREATE INDEX i_NodeAnnotationLink_parent ON nodeannotationlink(parent);
  CREATE INDEX i_NodeAnnotationLink_child ON nodeannotationlink(child);
  CREATE INDEX i_Share_group ON share("group");
  CREATE INDEX i_instrument_owner ON instrument(owner_id);
  CREATE INDEX i_instrument_group ON instrument(group_id);
  CREATE INDEX i_Instrument_microscope ON instrument(microscope);
  CREATE INDEX i_namespaceannotationlink_owner ON namespaceannotationlink(owner_id);
  CREATE INDEX i_namespaceannotationlink_group ON namespaceannotationlink(group_id);
  CREATE INDEX i_NamespaceAnnotationLink_parent ON namespaceannotationlink(parent);
  CREATE INDEX i_NamespaceAnnotationLink_child ON namespaceannotationlink(child);
  CREATE INDEX i_well_owner ON well(owner_id);
  CREATE INDEX i_well_group ON well(group_id);
  CREATE INDEX i_Well_plate ON well(plate);
  CREATE INDEX i_imagingenvironment_owner ON imagingenvironment(owner_id);
  CREATE INDEX i_imagingenvironment_group ON imagingenvironment(group_id);
  CREATE INDEX i_projectannotationlink_owner ON projectannotationlink(owner_id);
  CREATE INDEX i_projectannotationlink_group ON projectannotationlink(group_id);
  CREATE INDEX i_ProjectAnnotationLink_parent ON projectannotationlink(parent);
  CREATE INDEX i_ProjectAnnotationLink_child ON projectannotationlink(child);
  CREATE INDEX i_reagent_owner ON reagent(owner_id);
  CREATE INDEX i_reagent_group ON reagent(group_id);
  CREATE INDEX i_Reagent_screen ON reagent(screen);
  CREATE INDEX i_detector_owner ON detector(owner_id);
  CREATE INDEX i_detector_group ON detector(group_id);
  CREATE INDEX i_Detector_type ON detector(type);
  CREATE INDEX i_Detector_instrument ON detector(instrument);
  CREATE INDEX i_otf_owner ON otf(owner_id);
  CREATE INDEX i_otf_group ON otf(group_id);
  CREATE INDEX i_OTF_pixelsType ON otf(pixelsType);
  CREATE INDEX i_OTF_filterSet ON otf(filterSet);
  CREATE INDEX i_OTF_objective ON otf(objective);
  CREATE INDEX i_OTF_instrument ON otf(instrument);
  CREATE INDEX i_reagentannotationlink_owner ON reagentannotationlink(owner_id);
  CREATE INDEX i_reagentannotationlink_group ON reagentannotationlink(group_id);
  CREATE INDEX i_ReagentAnnotationLink_parent ON reagentannotationlink(parent);
  CREATE INDEX i_ReagentAnnotationLink_child ON reagentannotationlink(child);
  CREATE INDEX i_lightsettings_owner ON lightsettings(owner_id);
  CREATE INDEX i_lightsettings_group ON lightsettings(group_id);
  CREATE INDEX i_LightSettings_lightSource ON lightsettings(lightSource);
  CREATE INDEX i_LightSettings_microbeamManipulation ON lightsettings(microbeamManipulation);
  CREATE INDEX i_originalfile_owner ON originalfile(owner_id);
  CREATE INDEX i_originalfile_group ON originalfile(group_id);
  CREATE INDEX i_lightsource_owner ON lightsource(owner_id);
  CREATE INDEX i_lightsource_group ON lightsource(group_id);
  CREATE INDEX i_LightSource_instrument ON lightsource(instrument);
  CREATE INDEX i_annotation_owner ON annotation(owner_id);
  CREATE INDEX i_annotation_group ON annotation(group_id);
  CREATE INDEX i_job_owner ON job(owner_id);
  CREATE INDEX i_job_group ON job(group_id);
  CREATE INDEX i_Job_status ON job(status);
  CREATE INDEX i_Mask_pixels ON shape(pixels);
  CREATE INDEX i_ShareMember_parent ON sharemember(parent);
  CREATE INDEX i_ShareMember_child ON sharemember(child);
  CREATE INDEX i_filterset_owner ON filterset(owner_id);
  CREATE INDEX i_filterset_group ON filterset(group_id);
  CREATE INDEX i_FilterSet_instrument ON filterset(instrument);
  CREATE INDEX i_FilterSet_dichroic ON filterset(dichroic);
  CREATE INDEX i_projectdatasetlink_owner ON projectdatasetlink(owner_id);
  CREATE INDEX i_projectdatasetlink_group ON projectdatasetlink(group_id);
  CREATE INDEX i_ProjectDatasetLink_parent ON projectdatasetlink(parent);
  CREATE INDEX i_ProjectDatasetLink_child ON projectdatasetlink(child);
  CREATE INDEX i_experimenterannotationlink_owner ON experimenterannotationlink(owner_id);
  CREATE INDEX i_experimenterannotationlink_group ON experimenterannotationlink(group_id);
  CREATE INDEX i_ExperimenterAnnotationLink_parent ON experimenterannotationlink(parent);
  CREATE INDEX i_ExperimenterAnnotationLink_child ON experimenterannotationlink(child);
  CREATE INDEX i_plateannotationlink_owner ON plateannotationlink(owner_id);
  CREATE INDEX i_plateannotationlink_group ON plateannotationlink(group_id);
  CREATE INDEX i_PlateAnnotationLink_parent ON plateannotationlink(parent);
  CREATE INDEX i_PlateAnnotationLink_child ON plateannotationlink(child);
  CREATE INDEX i_Laser_type ON laser(type);
  CREATE INDEX i_Laser_laserMedium ON laser(laserMedium);
  CREATE INDEX i_Laser_pulse ON laser(pulse);
  CREATE INDEX i_Laser_pump ON laser(pump);
  CREATE INDEX i_channelbinding_owner ON channelbinding(owner_id);
  CREATE INDEX i_channelbinding_group ON channelbinding(group_id);
  CREATE INDEX i_ChannelBinding_renderingDef ON channelbinding(renderingDef);
  CREATE INDEX i_ChannelBinding_family ON channelbinding(family);
  CREATE INDEX i_statsinfo_owner ON statsinfo(owner_id);
  CREATE INDEX i_statsinfo_group ON statsinfo(group_id);
  CREATE INDEX i_screen_owner ON screen(owner_id);
  CREATE INDEX i_screen_group ON screen(group_id);
  CREATE INDEX i_dichroic_owner ON dichroic(owner_id);
  CREATE INDEX i_dichroic_group ON dichroic(group_id);
  CREATE INDEX i_Dichroic_instrument ON dichroic(instrument);
  CREATE INDEX i_Session_node ON session(node);
  CREATE INDEX i_Session_owner ON session(owner);
  CREATE INDEX i_plateacquisition_owner ON plateacquisition(owner_id);
  CREATE INDEX i_plateacquisition_group ON plateacquisition(group_id);
  CREATE INDEX i_PlateAcquisition_plate ON plateacquisition(plate);
  CREATE INDEX i_Filament_type ON filament(type);
  CREATE INDEX i_screenannotationlink_owner ON screenannotationlink(owner_id);
  CREATE INDEX i_screenannotationlink_group ON screenannotationlink(group_id);
  CREATE INDEX i_ScreenAnnotationLink_parent ON screenannotationlink(parent);
  CREATE INDEX i_ScreenAnnotationLink_child ON screenannotationlink(child);
  CREATE INDEX i_pixelsannotationlink_owner ON pixelsannotationlink(owner_id);
  CREATE INDEX i_pixelsannotationlink_group ON pixelsannotationlink(group_id);
  CREATE INDEX i_PixelsAnnotationLink_parent ON pixelsannotationlink(parent);
  CREATE INDEX i_PixelsAnnotationLink_child ON pixelsannotationlink(child);
  CREATE INDEX i_objective_owner ON objective(owner_id);
  CREATE INDEX i_objective_group ON objective(group_id);
  CREATE INDEX i_Objective_immersion ON objective(immersion);
  CREATE INDEX i_Objective_correction ON objective(correction);
  CREATE INDEX i_Objective_instrument ON objective(instrument);
  CREATE INDEX i_datasetannotationlink_owner ON datasetannotationlink(owner_id);
  CREATE INDEX i_datasetannotationlink_group ON datasetannotationlink(group_id);
  CREATE INDEX i_DatasetAnnotationLink_parent ON datasetannotationlink(parent);
  CREATE INDEX i_DatasetAnnotationLink_child ON datasetannotationlink(child);
  CREATE INDEX i_experiment_owner ON experiment(owner_id);
  CREATE INDEX i_experiment_group ON experiment(group_id);
  CREATE INDEX i_Experiment_type ON experiment(type);
  CREATE INDEX i_detectorsettings_owner ON detectorsettings(owner_id);
  CREATE INDEX i_detectorsettings_group ON detectorsettings(group_id);
  CREATE INDEX i_DetectorSettings_binning ON detectorsettings(binning);
  CREATE INDEX i_DetectorSettings_detector ON detectorsettings(detector);
  CREATE INDEX i_filter_owner ON filter(owner_id);
  CREATE INDEX i_filter_group ON filter(group_id);
  CREATE INDEX i_Filter_type ON filter(type);
  CREATE INDEX i_Filter_transmittanceRange ON filter(transmittanceRange);
  CREATE INDEX i_Filter_instrument ON filter(instrument);
  CREATE INDEX i_plateacquisitionannotationlink_owner ON plateacquisitionannotationlink(owner_id);
  CREATE INDEX i_plateacquisitionannotationlink_group ON plateacquisitionannotationlink(group_id);
  CREATE INDEX i_PlateAcquisitionAnnotationLink_parent ON plateacquisitionannotationlink(parent);
  CREATE INDEX i_PlateAcquisitionAnnotationLink_child ON plateacquisitionannotationlink(child);
  CREATE INDEX i_pixelsoriginalfilemap_owner ON pixelsoriginalfilemap(owner_id);
  CREATE INDEX i_pixelsoriginalfilemap_group ON pixelsoriginalfilemap(group_id);
  CREATE INDEX i_PixelsOriginalFileMap_parent ON pixelsoriginalfilemap(parent);
  CREATE INDEX i_PixelsOriginalFileMap_child ON pixelsoriginalfilemap(child);
  CREATE INDEX i_logicalchannel_owner ON logicalchannel(owner_id);
  CREATE INDEX i_logicalchannel_group ON logicalchannel(group_id);
  CREATE INDEX i_LogicalChannel_illumination ON logicalchannel(illumination);
  CREATE INDEX i_LogicalChannel_contrastMethod ON logicalchannel(contrastMethod);
  CREATE INDEX i_LogicalChannel_otf ON logicalchannel(otf);
  CREATE INDEX i_LogicalChannel_detectorSettings ON logicalchannel(detectorSettings);
  CREATE INDEX i_LogicalChannel_lightSourceSettings ON logicalchannel(lightSourceSettings);
  CREATE INDEX i_LogicalChannel_filterSet ON logicalchannel(filterSet);
  CREATE INDEX i_LogicalChannel_photometricInterpretation ON logicalchannel(photometricInterpretation);
  CREATE INDEX i_LogicalChannel_mode ON logicalchannel("mode");
  CREATE INDEX i_LogicalChannel_lightPath ON logicalchannel(lightPath);
  CREATE INDEX i_sessionannotationlink_owner ON sessionannotationlink(owner_id);
  CREATE INDEX i_sessionannotationlink_group ON sessionannotationlink(group_id);
  CREATE INDEX i_SessionAnnotationLink_parent ON sessionannotationlink(parent);
  CREATE INDEX i_SessionAnnotationLink_child ON sessionannotationlink(child);
  CREATE INDEX i_screenplatelink_owner ON screenplatelink(owner_id);
  CREATE INDEX i_screenplatelink_group ON screenplatelink(group_id);
  CREATE INDEX i_ScreenPlateLink_parent ON screenplatelink(parent);
  CREATE INDEX i_ScreenPlateLink_child ON screenplatelink(child);
  CREATE INDEX i_shape_owner ON shape(owner_id);
  CREATE INDEX i_shape_group ON shape(group_id);
  CREATE INDEX i_Shape_roi ON shape(roi);
  CREATE INDEX i_Event_experimenter ON event(experimenter);
  CREATE INDEX i_Event_experimenterGroup ON event(experimenterGroup);
  CREATE INDEX i_Event_type ON event(type);
  CREATE INDEX i_Event_containingEvent ON event(containingEvent);
  CREATE INDEX i_Event_session ON event("session");

--
-- Finally, a function for showing our permissions
-- select id, ome_perms(permissions) FROM sometable...
--

CREATE OR REPLACE FUNCTION ome_perms(p INT8) RETURNS VARCHAR AS '
DECLARE
    ur CHAR DEFAULT ''-'';
    uw CHAR DEFAULT ''-'';
    gr CHAR DEFAULT ''-'';
    gw CHAR DEFAULT ''-'';
    wr CHAR DEFAULT ''-'';
    ww CHAR DEFAULT ''-'';
BEGIN
    -- annotate flags may be overwritten by write flags

    -- shift 8 (-RWA--------)
    SELECT INTO ur CASE WHEN (p & 1024) = 1024 THEN ''r'' ELSE ''-'' END;
    SELECT INTO uw CASE WHEN (p &  512) =  512 THEN ''w''
                        WHEN (p &  256) =  256 THEN ''a'' ELSE ''-'' END;

    -- shift 4 (-----RWA----)
    SELECT INTO gr CASE WHEN (p &   64) =   64 THEN ''r'' ELSE ''-'' END;
    SELECT INTO gw CASE WHEN (p &   32) =   32 THEN ''w''
                        WHEN (p &   16) =   16 THEN ''a'' ELSE ''-'' END;

    -- shift 0 (---------RWA)
    SELECT INTO wr CASE WHEN (p &    4) =    4 THEN ''r'' ELSE ''-'' END;
    SELECT INTO ww CASE WHEN (p &    2) =    2 THEN ''w''
                        WHEN (p &    1) =    1 THEN ''a'' ELSE ''-'' END;

    RETURN ur || uw || gr || gw || wr || ww;
END;' LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION omero_43_check_pg_advisory_lock() RETURNS void AS '
DECLARE
    txt text;
BEGIN
      BEGIN
        PERFORM pg_advisory_lock(1, 1);
        PERFORM pg_advisory_unlock(1, 1);
      EXCEPTION
        WHEN undefined_function THEN
         txt := chr(10) ||
            ''====================================================================================='' || chr(10) ||
            ''pg_advisory_lock does not exist!'' || chr(10) || chr(10) ||
            ''You must upgrade to PostgreSQL 8.2 or above'' || chr(10) ||
            ''====================================================================================='' || chr(10) || chr(10);
         -- 8.1 is unsupported starting with OMERO4.3 (See #4902)
         RAISE EXCEPTION ''%'', txt;
      END;
END;' LANGUAGE plpgsql;
SELECT omero_43_check_pg_advisory_lock();
DROP FUNCTION omero_43_check_pg_advisory_lock();



set constraints all deferred;

--
-- #1176 : create our own nextval() functionality for more consistent
-- sequence operation in hibernate. This functionality was updated for
-- OMERO 4.2 (#2508) in order to prevent logging during triggers.
--

CREATE OR REPLACE FUNCTION ome_nextval(seq VARCHAR) RETURNS INT8 AS '
BEGIN
      RETURN ome_nextval(seq, 1);
END;' LANGUAGE plpgsql;

-- These renamings allow us to reuse the Hibernate-generated tables
-- for sequence generation. Eventually, a method might be found to
-- make Hibernate generate them for us.
CREATE SEQUENCE _lock_seq;
ALTER TABLE seq_table RENAME TO _lock_ids;
ALTER TABLE _lock_ids RENAME COLUMN sequence_name TO name;
ALTER TABLE _lock_ids DROP CONSTRAINT seq_table_pkey;
ALTER TABLE _lock_ids DROP COLUMN next_val;
ALTER TABLE _lock_ids ADD COLUMN id int PRIMARY KEY DEFAULT nextval('_lock_seq');
CREATE UNIQUE INDEX _lock_ids_name ON _lock_ids (name);

CREATE OR REPLACE FUNCTION ome_nextval(seq VARCHAR, increment int4) RETURNS INT8 AS '
DECLARE
      Lid  int4;
      nv   int8;
BEGIN
      SELECT id INTO Lid FROM _lock_ids WHERE name = seq;
      IF Lid IS NULL THEN
          SELECT INTO Lid nextval(''_lock_seq'');
          INSERT INTO _lock_ids (id, name) VALUES (Lid, seq);
      END IF;

      BEGIN
        PERFORM pg_advisory_lock(1, Lid);
      EXCEPTION
        WHEN undefined_function THEN
          RAISE DEBUG ''No function pg_advisory_lock'';
      END;
      PERFORM nextval(seq) FROM generate_series(1, increment);
      SELECT currval(seq) INTO nv;
      BEGIN
        PERFORM pg_advisory_unlock(1, Lid);
      EXCEPTION
        WHEN undefined_function THEN
          RAISE DEBUG ''No function pg_advisory_unlock'';
      END;

      RETURN nv;

END;' LANGUAGE plpgsql;

CREATE SEQUENCE seq_wellsampleannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_wellsampleannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_wellannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_wellannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_filtertype; INSERT INTO _lock_ids (name, id) SELECT 'seq_filtertype', nextval('_lock_seq');
CREATE SEQUENCE seq_dataset; INSERT INTO _lock_ids (name, id) SELECT 'seq_dataset', nextval('_lock_seq');
CREATE SEQUENCE seq_plate; INSERT INTO _lock_ids (name, id) SELECT 'seq_plate', nextval('_lock_seq');
CREATE SEQUENCE seq_thumbnail; INSERT INTO _lock_ids (name, id) SELECT 'seq_thumbnail', nextval('_lock_seq');
CREATE SEQUENCE seq_immersion; INSERT INTO _lock_ids (name, id) SELECT 'seq_immersion', nextval('_lock_seq');
CREATE SEQUENCE seq_channel; INSERT INTO _lock_ids (name, id) SELECT 'seq_channel', nextval('_lock_seq');
CREATE SEQUENCE seq_imageannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_imageannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_link; INSERT INTO _lock_ids (name, id) SELECT 'seq_link', nextval('_lock_seq');
CREATE SEQUENCE seq_lightpathemissionfilterlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_lightpathemissionfilterlink', nextval('_lock_seq');
CREATE SEQUENCE seq_arctype; INSERT INTO _lock_ids (name, id) SELECT 'seq_arctype', nextval('_lock_seq');
CREATE SEQUENCE seq_experimenttype; INSERT INTO _lock_ids (name, id) SELECT 'seq_experimenttype', nextval('_lock_seq');
CREATE SEQUENCE seq_filtersetemissionfilterlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_filtersetemissionfilterlink', nextval('_lock_seq');
CREATE SEQUENCE seq_filtersetexcitationfilterlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_filtersetexcitationfilterlink', nextval('_lock_seq');
CREATE SEQUENCE seq_microscope; INSERT INTO _lock_ids (name, id) SELECT 'seq_microscope', nextval('_lock_seq');
CREATE SEQUENCE seq_originalfileannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_originalfileannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_wellsample; INSERT INTO _lock_ids (name, id) SELECT 'seq_wellsample', nextval('_lock_seq');
CREATE SEQUENCE seq_planeinfo; INSERT INTO _lock_ids (name, id) SELECT 'seq_planeinfo', nextval('_lock_seq');
CREATE SEQUENCE seq_lightpathexcitationfilterlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_lightpathexcitationfilterlink', nextval('_lock_seq');
CREATE SEQUENCE seq_groupexperimentermap; INSERT INTO _lock_ids (name, id) SELECT 'seq_groupexperimentermap', nextval('_lock_seq');
CREATE SEQUENCE seq_planeinfoannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_planeinfoannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_transmittancerange; INSERT INTO _lock_ids (name, id) SELECT 'seq_transmittancerange', nextval('_lock_seq');
CREATE SEQUENCE seq_wellreagentlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_wellreagentlink', nextval('_lock_seq');
CREATE SEQUENCE seq_eventlog; INSERT INTO _lock_ids (name, id) SELECT 'seq_eventlog', nextval('_lock_seq');
CREATE SEQUENCE seq_quantumdef; INSERT INTO _lock_ids (name, id) SELECT 'seq_quantumdef', nextval('_lock_seq');
CREATE SEQUENCE seq_namespace; INSERT INTO _lock_ids (name, id) SELECT 'seq_namespace', nextval('_lock_seq');
CREATE SEQUENCE seq_image; INSERT INTO _lock_ids (name, id) SELECT 'seq_image', nextval('_lock_seq');
CREATE SEQUENCE seq_renderingmodel; INSERT INTO _lock_ids (name, id) SELECT 'seq_renderingmodel', nextval('_lock_seq');
CREATE SEQUENCE seq_microbeammanipulation; INSERT INTO _lock_ids (name, id) SELECT 'seq_microbeammanipulation', nextval('_lock_seq');
CREATE SEQUENCE seq_joboriginalfilelink; INSERT INTO _lock_ids (name, id) SELECT 'seq_joboriginalfilelink', nextval('_lock_seq');
CREATE SEQUENCE seq_experimentergroup; INSERT INTO _lock_ids (name, id) SELECT 'seq_experimentergroup', nextval('_lock_seq');
CREATE SEQUENCE seq_renderingdef; INSERT INTO _lock_ids (name, id) SELECT 'seq_renderingdef', nextval('_lock_seq');
CREATE SEQUENCE seq_datasetimagelink; INSERT INTO _lock_ids (name, id) SELECT 'seq_datasetimagelink', nextval('_lock_seq');
CREATE SEQUENCE seq_codomainmapcontext; INSERT INTO _lock_ids (name, id) SELECT 'seq_codomainmapcontext', nextval('_lock_seq');
CREATE SEQUENCE seq_eventtype; INSERT INTO _lock_ids (name, id) SELECT 'seq_eventtype', nextval('_lock_seq');
CREATE SEQUENCE seq_project; INSERT INTO _lock_ids (name, id) SELECT 'seq_project', nextval('_lock_seq');
CREATE SEQUENCE seq_microscopetype; INSERT INTO _lock_ids (name, id) SELECT 'seq_microscopetype', nextval('_lock_seq');
CREATE SEQUENCE seq_channelannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_channelannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_filamenttype; INSERT INTO _lock_ids (name, id) SELECT 'seq_filamenttype', nextval('_lock_seq');
CREATE SEQUENCE seq_stagelabel; INSERT INTO _lock_ids (name, id) SELECT 'seq_stagelabel', nextval('_lock_seq');
CREATE SEQUENCE seq_photometricinterpretation; INSERT INTO _lock_ids (name, id) SELECT 'seq_photometricinterpretation', nextval('_lock_seq');
CREATE SEQUENCE seq_experimentergroupannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_experimentergroupannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_pixels; INSERT INTO _lock_ids (name, id) SELECT 'seq_pixels', nextval('_lock_seq');
CREATE SEQUENCE seq_lightpath; INSERT INTO _lock_ids (name, id) SELECT 'seq_lightpath', nextval('_lock_seq');
CREATE SEQUENCE seq_roi; INSERT INTO _lock_ids (name, id) SELECT 'seq_roi', nextval('_lock_seq');
CREATE SEQUENCE seq_roiannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_roiannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_externalinfo; INSERT INTO _lock_ids (name, id) SELECT 'seq_externalinfo', nextval('_lock_seq');
CREATE SEQUENCE seq_annotationannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_annotationannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_objectivesettings; INSERT INTO _lock_ids (name, id) SELECT 'seq_objectivesettings', nextval('_lock_seq');
CREATE SEQUENCE seq_lasertype; INSERT INTO _lock_ids (name, id) SELECT 'seq_lasertype', nextval('_lock_seq');
CREATE SEQUENCE seq_nodeannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_nodeannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_dimensionorder; INSERT INTO _lock_ids (name, id) SELECT 'seq_dimensionorder', nextval('_lock_seq');
CREATE SEQUENCE seq_binning; INSERT INTO _lock_ids (name, id) SELECT 'seq_binning', nextval('_lock_seq');
CREATE SEQUENCE seq_instrument; INSERT INTO _lock_ids (name, id) SELECT 'seq_instrument', nextval('_lock_seq');
CREATE SEQUENCE seq_namespaceannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_namespaceannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_well; INSERT INTO _lock_ids (name, id) SELECT 'seq_well', nextval('_lock_seq');
CREATE SEQUENCE seq_family; INSERT INTO _lock_ids (name, id) SELECT 'seq_family', nextval('_lock_seq');
CREATE SEQUENCE seq_imagingenvironment; INSERT INTO _lock_ids (name, id) SELECT 'seq_imagingenvironment', nextval('_lock_seq');
CREATE SEQUENCE seq_illumination; INSERT INTO _lock_ids (name, id) SELECT 'seq_illumination', nextval('_lock_seq');
CREATE SEQUENCE seq_projectannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_projectannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_detectortype; INSERT INTO _lock_ids (name, id) SELECT 'seq_detectortype', nextval('_lock_seq');
CREATE SEQUENCE seq_reagent; INSERT INTO _lock_ids (name, id) SELECT 'seq_reagent', nextval('_lock_seq');
CREATE SEQUENCE seq_pulse; INSERT INTO _lock_ids (name, id) SELECT 'seq_pulse', nextval('_lock_seq');
CREATE SEQUENCE seq_detector; INSERT INTO _lock_ids (name, id) SELECT 'seq_detector', nextval('_lock_seq');
CREATE SEQUENCE seq_otf; INSERT INTO _lock_ids (name, id) SELECT 'seq_otf', nextval('_lock_seq');
CREATE SEQUENCE seq_reagentannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_reagentannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_lightsettings; INSERT INTO _lock_ids (name, id) SELECT 'seq_lightsettings', nextval('_lock_seq');
CREATE SEQUENCE seq_originalfile; INSERT INTO _lock_ids (name, id) SELECT 'seq_originalfile', nextval('_lock_seq');
CREATE SEQUENCE seq_lightsource; INSERT INTO _lock_ids (name, id) SELECT 'seq_lightsource', nextval('_lock_seq');
CREATE SEQUENCE seq_annotation; INSERT INTO _lock_ids (name, id) SELECT 'seq_annotation', nextval('_lock_seq');
CREATE SEQUENCE seq_job; INSERT INTO _lock_ids (name, id) SELECT 'seq_job', nextval('_lock_seq');
CREATE SEQUENCE seq_sharemember; INSERT INTO _lock_ids (name, id) SELECT 'seq_sharemember', nextval('_lock_seq');
CREATE SEQUENCE seq_dbpatch; INSERT INTO _lock_ids (name, id) SELECT 'seq_dbpatch', nextval('_lock_seq');
CREATE SEQUENCE seq_filterset; INSERT INTO _lock_ids (name, id) SELECT 'seq_filterset', nextval('_lock_seq');
CREATE SEQUENCE seq_projectdatasetlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_projectdatasetlink', nextval('_lock_seq');
CREATE SEQUENCE seq_experimenterannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_experimenterannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_plateannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_plateannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_channelbinding; INSERT INTO _lock_ids (name, id) SELECT 'seq_channelbinding', nextval('_lock_seq');
CREATE SEQUENCE seq_microbeammanipulationtype; INSERT INTO _lock_ids (name, id) SELECT 'seq_microbeammanipulationtype', nextval('_lock_seq');
CREATE SEQUENCE seq_medium; INSERT INTO _lock_ids (name, id) SELECT 'seq_medium', nextval('_lock_seq');
CREATE SEQUENCE seq_statsinfo; INSERT INTO _lock_ids (name, id) SELECT 'seq_statsinfo', nextval('_lock_seq');
CREATE SEQUENCE seq_lasermedium; INSERT INTO _lock_ids (name, id) SELECT 'seq_lasermedium', nextval('_lock_seq');
CREATE SEQUENCE seq_pixelstype; INSERT INTO _lock_ids (name, id) SELECT 'seq_pixelstype', nextval('_lock_seq');
CREATE SEQUENCE seq_screen; INSERT INTO _lock_ids (name, id) SELECT 'seq_screen', nextval('_lock_seq');
CREATE SEQUENCE seq_dichroic; INSERT INTO _lock_ids (name, id) SELECT 'seq_dichroic', nextval('_lock_seq');
CREATE SEQUENCE seq_session; INSERT INTO _lock_ids (name, id) SELECT 'seq_session', nextval('_lock_seq');
CREATE SEQUENCE seq_plateacquisition; INSERT INTO _lock_ids (name, id) SELECT 'seq_plateacquisition', nextval('_lock_seq');
CREATE SEQUENCE seq_screenannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_screenannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_format; INSERT INTO _lock_ids (name, id) SELECT 'seq_format', nextval('_lock_seq');
CREATE SEQUENCE seq_node; INSERT INTO _lock_ids (name, id) SELECT 'seq_node', nextval('_lock_seq');
CREATE SEQUENCE seq_pixelsannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_pixelsannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_objective; INSERT INTO _lock_ids (name, id) SELECT 'seq_objective', nextval('_lock_seq');
CREATE SEQUENCE seq_datasetannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_datasetannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_experiment; INSERT INTO _lock_ids (name, id) SELECT 'seq_experiment', nextval('_lock_seq');
CREATE SEQUENCE seq_detectorsettings; INSERT INTO _lock_ids (name, id) SELECT 'seq_detectorsettings', nextval('_lock_seq');
CREATE SEQUENCE seq_correction; INSERT INTO _lock_ids (name, id) SELECT 'seq_correction', nextval('_lock_seq');
CREATE SEQUENCE seq_filter; INSERT INTO _lock_ids (name, id) SELECT 'seq_filter', nextval('_lock_seq');
CREATE SEQUENCE seq_plateacquisitionannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_plateacquisitionannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_pixelsoriginalfilemap; INSERT INTO _lock_ids (name, id) SELECT 'seq_pixelsoriginalfilemap', nextval('_lock_seq');
CREATE SEQUENCE seq_logicalchannel; INSERT INTO _lock_ids (name, id) SELECT 'seq_logicalchannel', nextval('_lock_seq');
CREATE SEQUENCE seq_sessionannotationlink; INSERT INTO _lock_ids (name, id) SELECT 'seq_sessionannotationlink', nextval('_lock_seq');
CREATE SEQUENCE seq_screenplatelink; INSERT INTO _lock_ids (name, id) SELECT 'seq_screenplatelink', nextval('_lock_seq');
CREATE SEQUENCE seq_shape; INSERT INTO _lock_ids (name, id) SELECT 'seq_shape', nextval('_lock_seq');
CREATE SEQUENCE seq_experimenter; INSERT INTO _lock_ids (name, id) SELECT 'seq_experimenter', nextval('_lock_seq');
CREATE SEQUENCE seq_acquisitionmode; INSERT INTO _lock_ids (name, id) SELECT 'seq_acquisitionmode', nextval('_lock_seq');
CREATE SEQUENCE seq_event; INSERT INTO _lock_ids (name, id) SELECT 'seq_event', nextval('_lock_seq');
CREATE SEQUENCE seq_jobstatus; INSERT INTO _lock_ids (name, id) SELECT 'seq_jobstatus', nextval('_lock_seq');
CREATE SEQUENCE seq_contrastmethod; INSERT INTO _lock_ids (name, id) SELECT 'seq_contrastmethod', nextval('_lock_seq');


--
-- END #1176/#2508
--


--
-- #1390 : Triggering the addition of an "REINDEX" event on annotation events.
--

CREATE OR REPLACE FUNCTION _prepare_session(_event_id int8, _user_id int8, _group_id int8) RETURNS void
    AS '
    BEGIN

        IF NOT EXISTS(SELECT table_name FROM information_schema.tables where table_name = ''_current_session'') THEN
            CREATE TEMP TABLE _current_session ("event_id" int8, "user_id" int8, "group_id" int8) ON COMMIT DELETE ROWS;
            INSERT INTO _current_session VALUES (_event_id, _user_id, _group_id);
        ELSE
            DELETE FROM _current_session;
            INSERT INTO _current_session VALUES (_event_id, _user_id, _group_id);
        END IF;
    END;'
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION _current_event() RETURNS int8
    AS '
    DECLARE
        eid int8;
    BEGIN
        IF NOT EXISTS(SELECT table_name FROM information_schema.tables where table_name = ''_current_session'') THEN
            RETURN 0;
        END IF;
        SELECT INTO eid event_id FROM _current_session;
        RETURN eid;

    END;'
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION _current_or_new_event() RETURNS int8
    AS '
    DECLARE
        eid int8;
    BEGIN
        SELECT INTO eid _current_event();
        IF eid = 0 OR eid IS NULL THEN
            SELECT INTO eid ome_nextval(''seq_event'');
            INSERT INTO event (id, permissions, status, time, experimenter, experimentergroup, session, type)
                SELECT eid, -52, ''TRIGGERED'', clock_timestamp(), 0, 0, 0, 0;
        END IF;
        RETURN eid;
    END;'
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION annotation_update_event_trigger() RETURNS "trigger"
    AS '
    DECLARE
        rec RECORD;
        eid int8;
        cnt int8;
    BEGIN

        IF NOT EXISTS(SELECT table_name FROM information_schema.tables where table_name = ''_updated_annotations'') THEN
            CREATE TEMP TABLE _updated_annotations (entitytype varchar, entityid int8) ON COMMIT DELETE ROWS;
        END IF;


        FOR rec IN SELECT id, parent FROM datasetannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.containers.Dataset'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM plateannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.screen.Plate'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM channelannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.core.Channel'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM wellsampleannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.screen.WellSample'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM planeinfoannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.core.PlaneInfo'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM namespaceannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.meta.Namespace'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM imageannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.core.Image'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM experimentergroupannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.meta.ExperimenterGroup'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM projectannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.containers.Project'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM pixelsannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.core.Pixels'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM roiannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.roi.Roi'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM wellannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.screen.Well'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM reagentannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.screen.Reagent'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM originalfileannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.core.OriginalFile'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM annotationannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.annotations.Annotation'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM screenannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.screen.Screen'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM sessionannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.meta.Session'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM plateacquisitionannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.screen.PlateAcquisition'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM nodeannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.meta.Node'');
        END LOOP;

        FOR rec IN SELECT id, parent FROM experimenterannotationlink WHERE child = new.id LOOP
            INSERT INTO _updated_annotations (entityid, entitytype) values (rec.parent, ''ome.model.meta.Experimenter'');
        END LOOP;

        SELECT INTO cnt count(*) FROM _updated_annotations;
        IF cnt <> 0 THEN
            SELECT INTO eid _current_or_new_event();
            INSERT INTO eventlog (id, action, permissions, entityid, entitytype, event)
                 SELECT ome_nextval(''seq_eventlog''), ''REINDEX'', -52, entityid, entitytype, eid
                   FROM _updated_annotations;
        END IF;

        RETURN new;

    END;'
LANGUAGE plpgsql;

CREATE TRIGGER annotation_trigger
        AFTER UPDATE ON annotation
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_update_event_trigger();


CREATE OR REPLACE FUNCTION annotation_link_event_trigger() RETURNS "trigger"
    AS '
    DECLARE
        eid int8;
    BEGIN

        SELECT INTO eid _current_or_new_event();
        INSERT INTO eventlog (id, action, permissions, entityid, entitytype, event)
                SELECT ome_nextval(''seq_eventlog''), ''REINDEX'', -52, new.parent, TG_ARGV[0], eid;

        RETURN new;

    END;'
LANGUAGE plpgsql;

CREATE TRIGGER dataset_annotation_link_event_trigger
        AFTER UPDATE ON datasetannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.containers.Dataset');
CREATE TRIGGER plate_annotation_link_event_trigger
        AFTER UPDATE ON plateannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.screen.Plate');
CREATE TRIGGER channel_annotation_link_event_trigger
        AFTER UPDATE ON channelannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.core.Channel');
CREATE TRIGGER wellsample_annotation_link_event_trigger
        AFTER UPDATE ON wellsampleannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.screen.WellSample');
CREATE TRIGGER planeinfo_annotation_link_event_trigger
        AFTER UPDATE ON planeinfoannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.core.PlaneInfo');
CREATE TRIGGER namespace_annotation_link_event_trigger
        AFTER UPDATE ON namespaceannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.meta.Namespace');
CREATE TRIGGER image_annotation_link_event_trigger
        AFTER UPDATE ON imageannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.core.Image');
CREATE TRIGGER experimentergroup_annotation_link_event_trigger
        AFTER UPDATE ON experimentergroupannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.meta.ExperimenterGroup');
CREATE TRIGGER project_annotation_link_event_trigger
        AFTER UPDATE ON projectannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.containers.Project');
CREATE TRIGGER pixels_annotation_link_event_trigger
        AFTER UPDATE ON pixelsannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.core.Pixels');
CREATE TRIGGER roi_annotation_link_event_trigger
        AFTER UPDATE ON roiannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.roi.Roi');
CREATE TRIGGER well_annotation_link_event_trigger
        AFTER UPDATE ON wellannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.screen.Well');
CREATE TRIGGER reagent_annotation_link_event_trigger
        AFTER UPDATE ON reagentannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.screen.Reagent');
CREATE TRIGGER originalfile_annotation_link_event_trigger
        AFTER UPDATE ON originalfileannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.core.OriginalFile');
CREATE TRIGGER annotation_annotation_link_event_trigger
        AFTER UPDATE ON annotationannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.annotations.Annotation');
CREATE TRIGGER screen_annotation_link_event_trigger
        AFTER UPDATE ON screenannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.screen.Screen');
CREATE TRIGGER session_annotation_link_event_trigger
        AFTER UPDATE ON sessionannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.meta.Session');
CREATE TRIGGER plateacquisition_annotation_link_event_trigger
        AFTER UPDATE ON plateacquisitionannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.screen.PlateAcquisition');
CREATE TRIGGER node_annotation_link_event_trigger
        AFTER UPDATE ON nodeannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.meta.Node');
CREATE TRIGGER experimenter_annotation_link_event_trigger
        AFTER UPDATE ON experimenterannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_event_trigger('ome.model.meta.Experimenter');

-- Delete triggers to go with update triggers (See #9337)
CREATE OR REPLACE FUNCTION annotation_link_delete_trigger() RETURNS "trigger"
    AS '
    DECLARE
        eid int8;
    BEGIN

        SELECT INTO eid _current_or_new_event();
        INSERT INTO eventlog (id, action, permissions, entityid, entitytype, event)
                SELECT ome_nextval(''seq_eventlog''), ''REINDEX'', -52, old.parent, TG_ARGV[0], eid;

        RETURN old;

    END;'
LANGUAGE plpgsql;

CREATE TRIGGER annotation_annotation_link_delete_trigger
        BEFORE DELETE ON annotationannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.annotations.Annotation');
CREATE TRIGGER channel_annotation_link_delete_trigger
        BEFORE DELETE ON channelannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.core.Channel');
CREATE TRIGGER dataset_annotation_link_delete_trigger
        BEFORE DELETE ON datasetannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.containers.Dataset');
CREATE TRIGGER experimenter_annotation_link_delete_trigger
        BEFORE DELETE ON experimenterannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.meta.Experimenter');
CREATE TRIGGER experimentergroup_annotation_link_delete_trigger
        BEFORE DELETE ON experimentergroupannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.meta.ExperimenterGroup');
CREATE TRIGGER image_annotation_link_delete_trigger
        BEFORE DELETE ON imageannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.core.Image');
CREATE TRIGGER namespace_annotation_link_delete_trigger
        BEFORE DELETE ON namespaceannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.meta.Namespace');
CREATE TRIGGER node_annotation_link_delete_trigger
        BEFORE DELETE ON nodeannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.meta.Node');
CREATE TRIGGER originalfile_annotation_link_delete_trigger
        BEFORE DELETE ON originalfileannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.core.OriginalFile');
CREATE TRIGGER pixels_annotation_link_delete_trigger
        BEFORE DELETE ON pixelsannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.core.Pixels');
CREATE TRIGGER planeinfo_annotation_link_delete_trigger
        BEFORE DELETE ON planeinfoannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.core.PlaneInfo');
CREATE TRIGGER plate_annotation_link_delete_trigger
        BEFORE DELETE ON plateannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.screen.Plate');
CREATE TRIGGER plateacquisition_annotation_link_delete_trigger
        BEFORE DELETE ON plateacquisitionannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.screen.PlateAcquisition');
CREATE TRIGGER project_annotation_link_delete_trigger
        BEFORE DELETE ON projectannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.containers.Project');
CREATE TRIGGER reagent_annotation_link_delete_trigger
        BEFORE DELETE ON reagentannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.screen.Reagent');
CREATE TRIGGER roi_annotation_link_delete_trigger
        BEFORE DELETE ON roiannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.roi.Roi');
CREATE TRIGGER screen_annotation_link_delete_trigger
        BEFORE DELETE ON screenannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.screen.Screen');
CREATE TRIGGER session_annotation_link_delete_trigger
        BEFORE DELETE ON sessionannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.meta.Session');
CREATE TRIGGER well_annotation_link_delete_trigger
        BEFORE DELETE ON wellannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.screen.Well');
CREATE TRIGGER wellsample_annotation_link_delete_trigger
        BEFORE DELETE ON wellsampleannotationlink
        FOR EACH ROW
        EXECUTE PROCEDURE annotation_link_delete_trigger('ome.model.screen.WellSample');

--
-- END #1390
--




-- First, we install a unique constraint so that it is only possible
-- to go from versionA/patchA to versionB/patchB once.
--
alter table dbpatch add constraint unique_dbpatch unique (currentVersion, currentPatch, previousVersion, previousPatch);

--
-- Since this is a table that we will be using in DB-specific ways, we're also going
-- to make working with it a bit simpler.
--
alter table dbpatch alter id set default ome_nextval('seq_dbpatch');
alter table dbpatch alter permissions set default -52;
alter table dbpatch alter message set default 'Updating';

--
-- Then, we insert into the patch table the patch (initialization) which we are currently
-- running so that if anything goes wrong, we'll have some record.
--
insert into dbpatch (currentVersion, currentPatch, previousVersion, previousPatch, message)
             values ('OMERO4.4',  0,            'OMERO4.4',   0,             'Initializing');

--
-- Here we will create the root account and the necessary groups
--
insert into experimenter (id,permissions,version,omename,firstname,lastname)
        values (0,0,0,'root','root','root');
insert into experimenter (id,permissions,version,omename,firstname,lastname)
        values (ome_nextval('seq_experimenter'),0,0,'guest','Guest','Account');
insert into node
        (id,permissions,uuid,conn,up,down)
        select 0,-52,'000000000000000000000000000000000000','unknown',clock_timestamp(),clock_timestamp();
insert into session
        (id,permissions,timetoidle,timetolive,started,closed,defaulteventtype,uuid,owner,node)
        select 0,-52,0,0,clock_timestamp(),clock_timestamp(),'BOOTSTRAP',0000, 0,0;
insert into session
        (id,permissions,timetoidle,timetolive,started,closed,defaulteventtype,uuid,owner,node)
        select ome_nextval('seq_session'),-52, 0,0,clock_timestamp(),clock_timestamp(),'PREVIOUSITEMS','1111',0,0;
insert into event (id,permissions,time,status,experimenter,session) values (0,0,clock_timestamp(),'BOOTSTRAP',0,0);

--
-- Default group permissions (ticket:1783)
-- * "system" is private, so that administrators do not share by accident
-- * "user" is public by default since its purpose is to share objects (ticket:1794)
-- * "guest" is private by default so that it doesn't show up on any lists,
--    though nothing should be created there.
--
insert into experimentergroup (id,permissions,version,name)
        values (0,-120,0,'system');
insert into experimentergroup (id,permissions,version,name)
        values (ome_nextval('seq_experimentergroup'),-52,0,'user');
insert into experimentergroup (id,permissions,version,name)
        values (ome_nextval('seq_experimentergroup'),-120,0,'guest');

insert into eventtype (id,permissions,value) values
        (0,-52,'Bootstrap');
insert into groupexperimentermap
        (id,permissions,version, parent, child, child_index,owner)
        values
        (0,-52,0,0,0,0,true);
insert into groupexperimentermap
        (id,permissions,version, parent, child, child_index,owner)
        select ome_nextval('seq_groupexperimentermap'),-52,0,1,0,1,false;
insert into groupexperimentermap
        (id,permissions,version, parent, child, child_index,owner)
        select ome_nextval('seq_groupexperimentermap'),-52,0,2,1,0,false;

update event set type = 0;
update event set experimentergroup = 0;

alter table event alter column type set not null;
alter table event alter column experimentergroup set not null;


insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'LongPass';
insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'ShortPass';
insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'BandPass';
insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'MultiPass';
insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'Dichroic';
insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'NeutralDensity';
insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'Other';
insert into filtertype (id,permissions,value)
    select ome_nextval('seq_filtertype'),-52,'Unknown';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'Oil';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'Water';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'WaterDipping';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'Air';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'Multi';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'Glycerol';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'Other';
insert into immersion (id,permissions,value)
    select ome_nextval('seq_immersion'),-52,'Unknown';
insert into arctype (id,permissions,value)
    select ome_nextval('seq_arctype'),-52,'Hg';
insert into arctype (id,permissions,value)
    select ome_nextval('seq_arctype'),-52,'Xe';
insert into arctype (id,permissions,value)
    select ome_nextval('seq_arctype'),-52,'HgXe';
insert into arctype (id,permissions,value)
    select ome_nextval('seq_arctype'),-52,'Other';
insert into arctype (id,permissions,value)
    select ome_nextval('seq_arctype'),-52,'Unknown';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'FP';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'FRET';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'TimeLapse';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'FourDPlus';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Screen';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Immunocytochemistry';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Immunofluorescence';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'FISH';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Electrophysiology';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'IonImaging';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Colocalization';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'PGIDocumentation';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'FluorescenceLifetime';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'SpectralImaging';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Photobleaching';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Other';
insert into experimenttype (id,permissions,value)
    select ome_nextval('seq_experimenttype'),-52,'Unknown';
insert into renderingmodel (id,permissions,value)
    select ome_nextval('seq_renderingmodel'),-52,'rgb';
insert into renderingmodel (id,permissions,value)
    select ome_nextval('seq_renderingmodel'),-52,'greyscale';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'Import';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'Internal';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'Shoola';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'User';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'Task';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'Test';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'Processing';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'FullText';
insert into eventtype (id,permissions,value)
    select ome_nextval('seq_eventtype'),-52,'Sessions';
insert into microscopetype (id,permissions,value)
    select ome_nextval('seq_microscopetype'),-52,'Upright';
insert into microscopetype (id,permissions,value)
    select ome_nextval('seq_microscopetype'),-52,'Inverted';
insert into microscopetype (id,permissions,value)
    select ome_nextval('seq_microscopetype'),-52,'Dissection';
insert into microscopetype (id,permissions,value)
    select ome_nextval('seq_microscopetype'),-52,'Electrophysiology';
insert into microscopetype (id,permissions,value)
    select ome_nextval('seq_microscopetype'),-52,'Other';
insert into microscopetype (id,permissions,value)
    select ome_nextval('seq_microscopetype'),-52,'Unknown';
insert into filamenttype (id,permissions,value)
    select ome_nextval('seq_filamenttype'),-52,'Incandescent';
insert into filamenttype (id,permissions,value)
    select ome_nextval('seq_filamenttype'),-52,'Halogen';
insert into filamenttype (id,permissions,value)
    select ome_nextval('seq_filamenttype'),-52,'Other';
insert into filamenttype (id,permissions,value)
    select ome_nextval('seq_filamenttype'),-52,'Unknown';
insert into photometricinterpretation (id,permissions,value)
    select ome_nextval('seq_photometricinterpretation'),-52,'RGB';
insert into photometricinterpretation (id,permissions,value)
    select ome_nextval('seq_photometricinterpretation'),-52,'ARGB';
insert into photometricinterpretation (id,permissions,value)
    select ome_nextval('seq_photometricinterpretation'),-52,'CMYK';
insert into photometricinterpretation (id,permissions,value)
    select ome_nextval('seq_photometricinterpretation'),-52,'HSV';
insert into photometricinterpretation (id,permissions,value)
    select ome_nextval('seq_photometricinterpretation'),-52,'Monochrome';
insert into photometricinterpretation (id,permissions,value)
    select ome_nextval('seq_photometricinterpretation'),-52,'ColorMap';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'Excimer';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'Gas';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'MetalVapor';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'SolidState';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'Dye';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'Semiconductor';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'FreeElectron';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'Other';
insert into lasertype (id,permissions,value)
    select ome_nextval('seq_lasertype'),-52,'Unknown';
insert into dimensionorder (id,permissions,value)
    select ome_nextval('seq_dimensionorder'),-52,'XYZCT';
insert into dimensionorder (id,permissions,value)
    select ome_nextval('seq_dimensionorder'),-52,'XYZTC';
insert into dimensionorder (id,permissions,value)
    select ome_nextval('seq_dimensionorder'),-52,'XYCTZ';
insert into dimensionorder (id,permissions,value)
    select ome_nextval('seq_dimensionorder'),-52,'XYCZT';
insert into dimensionorder (id,permissions,value)
    select ome_nextval('seq_dimensionorder'),-52,'XYTCZ';
insert into dimensionorder (id,permissions,value)
    select ome_nextval('seq_dimensionorder'),-52,'XYTZC';
insert into binning (id,permissions,value)
    select ome_nextval('seq_binning'),-52,'1x1';
insert into binning (id,permissions,value)
    select ome_nextval('seq_binning'),-52,'2x2';
insert into binning (id,permissions,value)
    select ome_nextval('seq_binning'),-52,'4x4';
insert into binning (id,permissions,value)
    select ome_nextval('seq_binning'),-52,'8x8';
insert into family (id,permissions,value)
    select ome_nextval('seq_family'),-52,'linear';
insert into family (id,permissions,value)
    select ome_nextval('seq_family'),-52,'polynomial';
insert into family (id,permissions,value)
    select ome_nextval('seq_family'),-52,'exponential';
insert into family (id,permissions,value)
    select ome_nextval('seq_family'),-52,'logarithmic';
insert into illumination (id,permissions,value)
    select ome_nextval('seq_illumination'),-52,'Transmitted';
insert into illumination (id,permissions,value)
    select ome_nextval('seq_illumination'),-52,'Epifluorescence';
insert into illumination (id,permissions,value)
    select ome_nextval('seq_illumination'),-52,'Oblique';
insert into illumination (id,permissions,value)
    select ome_nextval('seq_illumination'),-52,'NonLinear';
insert into illumination (id,permissions,value)
    select ome_nextval('seq_illumination'),-52,'Other';
insert into illumination (id,permissions,value)
    select ome_nextval('seq_illumination'),-52,'Unknown';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'CCD';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'IntensifiedCCD';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'AnalogVideo';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'PMT';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'Photodiode';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'Spectroscopy';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'LifetimeImaging';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'CorrelationSpectroscopy';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'FTIR';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'EM-CCD';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'APD';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'CMOS';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'EBCCD';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'Other';
insert into detectortype (id,permissions,value)
    select ome_nextval('seq_detectortype'),-52,'Unknown';
insert into pulse (id,permissions,value)
    select ome_nextval('seq_pulse'),-52,'CW';
insert into pulse (id,permissions,value)
    select ome_nextval('seq_pulse'),-52,'Single';
insert into pulse (id,permissions,value)
    select ome_nextval('seq_pulse'),-52,'QSwitched';
insert into pulse (id,permissions,value)
    select ome_nextval('seq_pulse'),-52,'Repetitive';
insert into pulse (id,permissions,value)
    select ome_nextval('seq_pulse'),-52,'ModeLocked';
insert into pulse (id,permissions,value)
    select ome_nextval('seq_pulse'),-52,'Other';
insert into pulse (id,permissions,value)
    select ome_nextval('seq_pulse'),-52,'Unknown';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'FRAP';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'Photoablation';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'Photoactivation';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'Uncaging';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'OpticalTrapping';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'FLIP';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'InverseFRAP';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'Other';
insert into microbeammanipulationtype (id,permissions,value)
    select ome_nextval('seq_microbeammanipulationtype'),-52,'Unknown';
insert into medium (id,permissions,value)
    select ome_nextval('seq_medium'),-52,'Air';
insert into medium (id,permissions,value)
    select ome_nextval('seq_medium'),-52,'Oil';
insert into medium (id,permissions,value)
    select ome_nextval('seq_medium'),-52,'Water';
insert into medium (id,permissions,value)
    select ome_nextval('seq_medium'),-52,'Glycerol';
insert into medium (id,permissions,value)
    select ome_nextval('seq_medium'),-52,'Other';
insert into medium (id,permissions,value)
    select ome_nextval('seq_medium'),-52,'Unknown';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Rhodamine6G';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'CoumarinC30';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'ArFl';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'ArCl';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'KrFl';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'KrCl';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'XeFl';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'XeCl';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'XeBr';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'GaAs';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'GaAlAs';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'EMinus';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Cu';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Ag';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'N';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Ar';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Kr';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Xe';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'HeNe';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'HeCd';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'CO';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'CO2';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'H2O';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'HFl';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'NdGlass';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'NdYAG';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'ErGlass';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'ErYAG';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'HoYLF';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'HoYAG';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Ruby';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'TiSapphire';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Alexandrite';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Other';
insert into lasermedium (id,permissions,value)
    select ome_nextval('seq_lasermedium'),-52,'Unknown';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'bit';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'int8';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'int16';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'int32';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'uint8';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'uint16';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'uint32';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'float';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'double';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'complex';
insert into pixelstype (id,permissions,value)
    select ome_nextval('seq_pixelstype'),-52,'double-complex';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'PNG';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/PNG';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'JPEG';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/JPEG';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'PGM';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/PGM';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Fits';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Fits';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'GIF';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/GIF';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'BMP';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/BMP';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Dicom';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Dicom';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'BioRad';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/BioRad';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'IPLab';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/IPLab';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Deltavision';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Deltavision';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'MRC';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/MRC';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Gatan';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Gatan';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Imaris';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Imaris';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'OpenlabRaw';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/OpenlabRaw';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'OMEXML';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/OMEXML';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'LIF';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/LIF';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'AVI';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/AVI';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'QT';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/QT';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Pict';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Pict';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'SDT';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/SDT';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'EPS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/EPS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Slidebook';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Slidebook';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Alicona';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Alicona';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'MNG';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/MNG';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'NRRD';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/NRRD';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Khoros';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Khoros';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Visitech';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Visitech';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'LIM';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/LIM';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'PSD';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/PSD';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'InCell';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/InCell';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'ICS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/ICS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'PerkinElmer';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/PerkinElmer';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'TCS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/TCS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'FV1000';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/FV1000';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'ZeissZVI';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/ZeissZVI';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'IPW';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/IPW';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'LegacyND2';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/LegacyND2';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'ND2';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/ND2';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'PCI';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/PCI';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'ImarisHDF';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/ImarisHDF';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Metamorph';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Metamorph';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'ZeissLSM';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/ZeissLSM';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'SEQ';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/SEQ';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Gel';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Gel';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'ImarisTiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/ImarisTiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Flex';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Flex';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'SVS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/SVS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Leica';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Leica';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Nikon';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Nikon';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Fluoview';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Fluoview';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Prairie';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Prairie';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Micromanager';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Micromanager';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'ImprovisionTiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/ImprovisionTiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'OMETiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/OMETiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'MetamorphTiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/MetamorphTiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Tiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Tiff';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Openlab';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/Openlab';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'MIAS';
insert into format (id,permissions,value)
    select ome_nextval('seq_format'),-52,'Companion/MIAS';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'UV';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'PlanApo';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'PlanFluor';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'SuperFluor';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'VioletCorrected';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Achro';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Achromat';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Fluor';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Fl';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Fluar';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Neofluar';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Fluotar';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Apo';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Other';
insert into correction (id,permissions,value)
    select ome_nextval('seq_correction'),-52,'Unknown';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'WideField';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'LaserScanningConfocalMicroscopy';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'SpinningDiskConfocal';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'SlitScanConfocal';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'MultiPhotonMicroscopy';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'StructuredIllumination';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'SingleMoleculeImaging';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'TotalInternalReflection';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'FluorescenceLifetime';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'SpectralImaging';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'FluorescenceCorrelationSpectroscopy';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'NearFieldScanningOpticalMicroscopy';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'SecondHarmonicGenerationImaging';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'PALM';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'STORM';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'STED';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'TIRF';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'FSM';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'LCM';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'Other';
insert into acquisitionmode (id,permissions,value)
    select ome_nextval('seq_acquisitionmode'),-52,'Unknown';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Submitted';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Resubmitted';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Queued';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Requeued';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Running';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Error';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Waiting';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Finished';
insert into jobstatus (id,permissions,value)
    select ome_nextval('seq_jobstatus'),-52,'Cancelled';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'Brightfield';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'Phase';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'DIC';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'HoffmanModulation';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'ObliqueIllumination';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'PolarizedLight';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'Darkfield';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'Fluorescence';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'Other';
insert into contrastmethod (id,permissions,value)
    select ome_nextval('seq_contrastmethod'),-52,'Unknown';

-- Adding bit depth to pixelstype (#2724)
update pixelstype set bitsize = 1 where value = 'bit';
update pixelstype set bitsize = 8 where value = 'int8';
update pixelstype set bitsize = 8 where value = 'uint8';
update pixelstype set bitsize = 16 where value = 'int16';
update pixelstype set bitsize = 16 where value = 'uint16';
update pixelstype set bitsize = 32 where value = 'int32';
update pixelstype set bitsize = 32 where value = 'uint16';
update pixelstype set bitsize = 32 where value = 'uint32';
update pixelstype set bitsize = 32 where value = 'float';
update pixelstype set bitsize = 64 where value = 'double';
update pixelstype set bitsize = 64 where value = 'complex';
update pixelstype set bitsize = 128 where value = 'double-complex';
alter table pixelstype alter column bitsize set not null;

--
-- Cryptographic functions for specifying UUID
--

create or replace function uuid() returns character(36)
as '
    select substring(x.my_rand from 1 for 8)||''-''||
           substring(x.my_rand from 9 for 4)||''-4''||
           substring(x.my_rand from 13 for 3)||''-''||x.clock_1||
           substring(x.my_rand from 16 for 3)||''-''||
           substring(x.my_rand from 19 for 12)
from
(select md5(clock_timestamp()::text||random()) as my_rand, to_hex(8+(3*random())::int) as clock_1) as x;'
language sql;

--
-- Configuration table including a UUID uniquely identifying this database.
--
create table configuration ( name varchar(255) primary key, value text );
insert into configuration values ('omero.db.uuid',uuid());

--
-- ticket:2201 - creating repository data structures
--
alter  table pixels add column path text;
alter  table pixels add column name text;
alter  table pixels add column repo varchar(36);
alter  table pixels add column params text[2][];
create index pixels_repo_index on pixels (repo);
-- No unique index on (path, repo, name) since it depends on params

alter  table originalfile alter column mimetype set default 'application/octet-stream';
alter  table originalfile add column repo varchar(36);
alter  table originalfile add column params text[2][];
create index originalfile_mime_index on originalfile (mimetype);
create index originalfile_repo_index on originalfile (repo);
create unique index originalfile_repo_path_index on originalfile (repo, path, name) where repo is not null;

--
-- end ticket:2201
--

-- Indices. See #1640, #2573, etc.
create unique index namespace_name on namespace (name);
create unique index well_col_row on well (plate, "column", "row");
create index eventlog_entitytype on eventlog(entitytype);
create index eventlog_entityid on eventlog(entityid);
create index eventlog_action on eventlog(action);

create table password ( experimenter_id bigint primary key REFERENCES experimenter (id), hash char(24), dn text );
insert into password values (0,'LSjpGNDDKH/7iZyIwB8OTA==');
insert into password values (1,'');
-- root can now login with omero.rootpass property value
-- and guest can login with any value

-- Here we have finished initializing this database.
update dbpatch set message = 'Database ready.', finished = clock_timestamp()
  where currentVersion = 'OMERO4.4' and
        currentPatch = 0 and
        previousVersion = 'OMERO4.4' and
        previousPatch = 0;

COMMIT;

