omero-ssh systemd
=================

Docker image for testing installation via ansible on CentOS 7 with systemd.

1. Build:

        docker build -t devansible .

2. To run on Linux see https://github.com/ome/ome-docker/tree/master/omero-ssh-systemd

3. To run on Mac OS X:

        docker run --privileged -ti --rm 2222:22 --name devansible devansible

4. SSH:

        ssh -p 2222 omero@$(docker-machine ip dev)

5. Install via ansible:

    - OMERO dependences installed via ansible, for more details see https://github.com/openmicroscopy/infrastructure

    - hosts:

            [docker-local]
            192.168.99.100 ansible_port=2222 ansible_user=omero ansible_password=secret

    - example-playbook.yml:
    
            - hosts: docker-local
              user: omero
              sudo: yes
              roles:
                - role: python-devel

    - test:
            $ ansible-playbook -i hosts example-playbook.yml
            PLAY ***************************************************************************

            TASK [setup] *******************************************************************
            ok: [192.168.99.100]

            TASK [python-devel : install python-devel] *************************************
            changed: [192.168.99.100] => (item=[u'python-devel', u'gcc'])

            PLAY RECAP *********************************************************************
            192.168.99.100             : ok=2    changed=1    unreachable=0    failed=0   


NOTE:

    Runing docker container result in a different key in ‘known_hosts’, this will result
    in an error message until corrected. To avoid that clean up ~/.ssh/known_hosts or
    alternatively disable Host Key Checking http://docs.ansible.com/ansible/intro_getting_started.html#host-key-checking


The Dockerfile starts creates the `omero` user, password `omero`, with full `sudo` rights.
