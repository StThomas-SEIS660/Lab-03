#!/bin/bash
# Starter shell script
# Rename as YourID-Lab03.sh
# Put commands below
# To run, type ./YourID-Lab03.sh (you need the "./")
# It must have permissions starting with a "7"  

mkdir -p A/{B,C,D} C/{E,F} D/{G,H/{J,K},I}
touch A/{aa,B/bb,C/cc,D/dd} C/{cc,E/ee,F/ff} D/{dd,G/gg,H/{hh,J/jj,K/kk},I/ii}
apt-get install tree

