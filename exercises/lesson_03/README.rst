==========
Assignment
==========

In this assignment, you're going to practice locating files in your system as
well as compression methods.

1) Find all manual pages in your system which contain the string ``et`` in
   their name (Note: manual pages are files located somewhere in your system).
2) Copy the manual pages found in the previous step into
   ``/home/student/mans_with_et_in_name`` directory. Collect the names of these
   manual pages, sort them alphabetically and write the resulting list to
   ``/home/student/mans_with_et_in_name.txt`` file. The file contents should be
   similar to this:

   ::

         $ head mans_with_et_in_name.txt
         agetty.8.gz
         charsets.7.gz
         cpuset.7.gz
         dmsetup.8.gz
         dnssec-settime.8.gz
         ethtool.8.gz
         getcap.8.gz
         getenforce.8.gz
         getpcaps.8.gz

3) Take the manual pages and decompress them.

4) Once decompressed, look for files which contain any occurrence of the word
   ``group`` (Note: look for whole words, not substrings). Take files which
   returned a match on the search and copy them to
   ``/home/student/mans_containing_word_group`` directory. Similarly to step 2.
   create a sorted list of these files and save it in
   ``/home/student/mans_containing_word_group.txt`` using the following format:

   ::

         $ head -n3 mans_containing_word_group.txt
         cpuset.7
         dmsetup.8
         getsebool.8

5) Take the files from the ``mans_containing_word_group`` directory and create
   a single compressed GZIP file
   ``/home/student/mans_containing_word_group.gz``. If everything goes well,
   you'll be able to read the file as a single manual page using the following
   command:

   ::

        $ man -l mans_containing_word_group.gz

6) Lastly, take the ``mans_with_et_in_name.txt``,
   ``mans_containing_word_group.txt``, and ``mans_containing_word_group.gz``
   files and put them into an XZ compressed TAR archive
   ``/home/student/mans.tar.xz``. The resulting archive should look like this
   (including file sizes):

   ::

        $ tar -tvf mans.tar.xz
        -rw-rw-r-- student/student 934 2021-04-03 16:59 mans_with_et_in_name.txt
        -rw-rw-r-- student/student  85 2021-04-03 16:49 mans_containing_word_group.txt
        -rw-rw-r-- student/student 59150 2021-04-03 16:52 mans_containing_word_group.gz

Notes:
    - it doesn't matter how exactly you get to the final result, but bear in
      mind that this assignment is supposed to exercise the ``find`` command so
      DO try to practice its power!
