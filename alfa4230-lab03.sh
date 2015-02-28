#!/bin/bash
# Starter shell script
# Put commands below
# To run, type ./starter.sh (you need the "./")
# It must have permissions starting with a "7"  
#mkdir -p A/{B,C,D}
#mkdir -p C/{E,F}
#mkdir -p D/{G,H/{J,K},I}
#touch A/{aa,B/bb,C/cc,D/dd}
#touch C/{cc,E/ee,F/ff}
#touch D/{dd,G/gg,H/{hh,J/jj,K/kk},I/ii}
mkdir -p main/{A/{B,C,D},E/{F,G},H/{I,J/{K,L},M}}
touch main/{A/{aa,B/bb,C/cc,D/dd},E/{ee,F/ff,G/gg},H/{hh,I/ii,J/{jj,K/kk,L/ll},M/mm}}
sudo apt-get -y install tree
sudo apt-get -y install git
