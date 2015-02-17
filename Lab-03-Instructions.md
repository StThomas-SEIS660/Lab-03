# IT Infrastructure Lab 3 Instructions #
**Overview** 

In this lab, you will get a very simple introduction to the concept of "infrastructure as code" using shell scripting on your virtual machine in conjunction with Git and Github

**Prerequisites**

You must have run the Linux tutorial (or be comfortable otherwise with Linux command-line tools). 

You must have successfully created your own virtual machine (VM) using Vagrant. 

You will do the exercises on your new Vagrant VM. 

## Part 1 ##
Create your Vagrant VM and log into it. 

Clone the Github repository to your VM, in your home directory **on the VM**.
Create a file <your email>-testfile.md, e.g. stud0001-testfile.md. 
Optionally, put some Markdown content in it. ([What's Markdown?](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet))
Push your change back to Github. 

## Part 2

Using the skills you learned in the previous lab,  perform the following steps:

**Configure a directory structure**
   
* Directory A should contain B, C and D

* Directory C should contain E and F

* Directory D should contain G, H and I

Every directory should have a file in it, with the letter of the directory doubled in lower case. E.g., directory A should have aa, F would have ff, etc. 
    

**Install and use tree**

Install tree (sudo apt-get install tree)

Use it to inspect your directory structure

Copy and paste the output of tree to ... 

Wipe the VM & reload

##Part 3

* Write a shell script that automates the directory creation and tree installation. 

  * Use Nano. Don't forget the shebang (#!/bin/bash) at the top. 

   * Name it <your email>-Lab03.sh

You will need to change (chmod) the permissions correctly to run it. 

Run it & confirm it works

Check it into github

Change it so that it touches a file “x” at the lowest directory. 

Run it & confirm it works

Check into github and observe differences

Wipe VM  & reload

Write a Chef recipe that is run by Vagrant to do the same thing. You cannot call your previous script.

Run, check in to Github when succeeds, alter it so it also installs curl

Check in and observe differences.

