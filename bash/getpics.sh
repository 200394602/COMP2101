#!/bin/bash
#
# this script puts some picture files into a Pictures directory in our home directory
# it only runs commands if they need to be run and only shows necessary output
# it summarizes the Pictures directory when it is done
#

echo "Report 1 : ZIP file"
echo ""

# make a Pictures directory if we don't have one - assumes we have a home directory
echo "Testing if we have a Pictures directory, and creating one if we don't"
echo ""
test -d ~/Pictures || mkdir ~/Pictures

# download a zipfile of pictures to our Pictures directory if it isn't already there - assumes you are online
echo "Downloading a zip file of pictures to our Pictures directory if it isn't already there"
echo ""
test -f ~/Pictures/pics.zip || wget -q -O ~/Pictures/pics.zip http://zonzorp.net/pics.zip

# unpack the downloaded zipfile if it is there, then delete the local copy of the zipfile
echo "Unpacking the downloaded zip file and then deleting the local copy of the zip file"
echo ""
test -f ~/Pictures/pics.zip && unzip -d ~/Pictures -o -q ~/Pictures/pics.zip && rm ~/Pictures/pics.zip

# Make a report on what we have in the Pictures directory
echo "Report on what we have in the Pictures directory :"
echo ""
test -d ~/Pictures && cat <<EOF
Found $(find ~/Pictures -type f|wc -l) files in the Pictures directory.
The Pictures directory uses $(du -sh ~/Pictures|awk '{print $1}') space on the disk.
EOF

echo ""

# Improve this script to also retrieve and install the files kept in the https://zonzorp.net/pics.tgz tarfile
#   - use the same kind of testing to make sure commands work and delete the local copy of the tarfile when you are done with it


echo "Report 2 : TGZ file"

# make a Pictures directory if we don't have one - assumes we have a home directory
echo "Testing if we have a Pictures directory, and creating one if we don't"
echo ""
test -d ~/Pictures || mkdir ~/Pictures

# download a zipfile of pictures to our Pictures directory if it isn't already there - assumes you are online
echo "Downloading a zip file of pictures to our Pictures directory if it isn't already there"
echo ""
test -f ~/Pictures/pics.tgz || wget -q -O ~/Pictures/pics.tgz https://zonzorp.net/pics.tgz

# unpack the downloaded echo "Unpacking the downloaded zip file and then deleting the local copy of the zipfile"zipfile if it is there, then delete the local copy of the zipfile
echo "Unpacking the downloaded zip file and then deleting the local copy of the zip file"
echo ""
test -f ~/Pictures/pics.tgz && tar xzf ~/Pictures/pics.tgz -C ~/Pictures && rm ~/Pictures/pics.tgz

# Make a report on what we have in the Pictures directory
echo "Report on what we have in the Pictures directory :"
echo ""
test -d ~/Pictures && cat <<EOF
Found $(find ~/Pictures -type f|wc -l) files in the Pictures directory.
The Pictures directory uses $(du -sh ~/Pictures|awk '{print $1}') space on the disk.
EOF

exit
