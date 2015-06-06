davmail-docker
==============

Small [Davmail](http://davmail.sourceforge.net/) container running inside [docker](http://docker.io).
This image is only ~130 MBytes since it is based on alpine linux.


Usage
=====

Create your davmail config file, you can find a sample on the
[davmail site](http://davmail.sourceforge.net/serversetup.html).

Save it to ~/.davmail/davmail.properties

Edit run.sh if you not only need imap and smtp.

To use the container:

    $ ./build.sh
    $ ./run.sh
