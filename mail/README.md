# Dockerfile for running a fake SMTP server

This Dockerfile downloads and runs a
https://nilhcem.github.io/FakeSMTP/ server on port 2525.

## Usage

 * Start a background mail server:
```
 $ docker run -d -p 2525 --name mail openmicroscopy/mail
```

 * (OSX/Windows) Configure port-forwarding for boot2docker
```
 $ VBoxManage modifyvm "boot2docker-vm" --natpf1 "FakeSMTP,tcp,,2525,,2525"
```

 * Verify that an email can be sent
```
 $ python test.py
 $ docker logs mail
 $ docker exec -i -t  mail bash
 omero@af4a0accc0dd:~$ ls -ltra
 total 1804
 -rw-r--r-- 1 omero omero     675 Apr  3  2012 .profile
 -rw-r--r-- 1 omero omero    3486 Apr  3  2012 .bashrc
 -rw-r--r-- 1 omero omero     220 Apr  3  2012 .bash_logout
 drwxrwxr-x 8 omero omero    4096 Nov 20 08:09 venv
 -rw-r--r-- 1 omero omero 1816410 Dec 31 12:39 fakeSMTP-1.13.jar
 drwxr-xr-x 2 omero omero    4096 Feb 26 08:35 received-emails
 drwxr-xr-x 7 root  root     4096 Feb 26 08:35 ..
 drwxr-xr-x 5 omero omero    4096 Feb 26 08:35 .
 omero@af4a0accc0dd:~$ ls received-emails/
 260215083559169.eml
 omero@af4a0accc0dd:~$ cat received-emails/260215083559169.eml
 Subject: test
 firstline
 ```

  * Configure your server to use localhost:2525 for sending mail.
