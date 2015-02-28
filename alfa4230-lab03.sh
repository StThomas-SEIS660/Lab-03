#!/bin/bash
# Starter shell script
# Put commands below
# To run, type ./starter.sh (you need the "./")
# It must have permissions starting with a "7"  
mkdir -p A/{B,C,D}
mkdir -p C/{E,F}
mkdir -p D/{G,H/{J,K},I}
touch A/{aa,B/bb,C/cc,D/dd}
touch C/{cc,E/ee,F/ff}
touch D/{dd,G/gg,H/{hh,J/jj,K/kk},I/ii}
sudo apt-get -y install tree
sudo apt-get -y install git
