==========
Assignment
==========

Your task is to filter the first two columns from the ``/etc/services`` file
in a way that yields a sorted list of services **and** their corresponding
port/transport delimited only by the ``:`` character. The list is going to be
sorted numerically by the port number in the ascending order.

Note that some of the services in ``/etc/services`` are commented out,
like e.g.:

::

    #compressnet    3/tcp     # Compression Process

In such cases, make sure to remove the comment character ``#`` in order to
include **all** services that are listed in the file.

To give you an idea what the desired output should look like, look at the
following code snippet: ::

    $ head reference_file.txt
    spr-itunes:0/tcp
    rtmp:1/ddp
    tcpmux:1/tcp
    tcpmux:1/udp
    compressnet:2/tcp
    compressnet:2/udp
    nbp:2/ddp
    compressnet:3/tcp
    compressnet:3/udp
    echo:4/ddp

The full reference file can be downloaded
`here <https://raw.githubusercontent.com/ENGETO-Academy/Linux-public/4268f64d8049967edd264b36dd2382257b64bbab/exercises/lesson_02/reference_file.txt>`_

