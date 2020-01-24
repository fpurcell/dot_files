disable mds (spotlight)
=====
sudo mdutil -a -i off

mount writable ntfs drive
================================
1. brew cask install osxfuse
1. brew install ntfs-3g
1. diskutil list
1. in the list above, look for device name for external drive
1. sudo umount /dev/disk2s1
1. diskutil list # device still there, but...
1. sudo mkdir /Volumes/NTFS
1. sudo /usr/local/bin/ntfs-3g /dev/disk2s1 /Volumes/NTFS -olocal -oallow_other
1. ls /Volumes/NTFS
1. cat > /Volumes/NTFS/test.txt
