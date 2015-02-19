# IT Infrastructure Lab 3 Instructions #
**Overview** 

In this lab, you will get a very simple introduction to the concept of "infrastructure as code" using shell scripting on your virtual machine in conjunction with Git and Github

**Prerequisites**

You must have run the Linux tutorial (or be comfortable otherwise with Linux command-line tools). 

You must have successfully created your own virtual machine (VM) using Vagrant. 

You will do the exercises on your new Vagrant VM. 

## Part 1: Command line operations ##

Using the skills you learned in the previous lab,  perform the following steps:

**Configure a directory structure**
   
* Directory A should contain directories B, C and D

* Directory C should contain directories E and F

* Directory D should contain directories G, H and I

* Directory H should contain directories J and K


Every directory should have a file in it, with the letter of the directory doubled in lower case. E.g., directory A should have aa, F would have ff, etc. 

**Install and use tree**

Install tree 

    vagrant@precise64~: sudo apt-get install tree

Use it to inspect your directory structure. It should look like:

````
vagrant@precise64:~$ tree

|-- A
|   |-- aa
|   |-- B
|   |   `-- bb
|   |-- C
|   |   `-- cc
|   `-- D
|       `-- dd
|-- C
|   |-- cc
|   |-- E
|   |   `-- ee
|   `-- F
|       `-- ff
|-- D
|   |-- dd
|   |-- G
|   |   `-- gg
|   |-- H
|   |   |-- hh
|   |   |-- J
|   |   |   `-- jj
|   |   `-- K
|   |       `-- kk
|   `-- I
|       `-- ii
````

Now, output the tree to a file. How? 

    vagrant@precise64:~$tree > tree.txt


Why did I make the directory structure so detailed? This is typical of setting up infrastructure as code - you need to be able to maintain focus and successfully set up instructions that are both complicated and yet repetitive. 

Exit and destroy your VM. 

````
vagrant@precise64:~$exit
teststud@seis660:~/vagrant$ vagrant destroy -f
==> default: Forcing shutdown of VM...
==> default: Destroying VM and associated drives...
````

The next section is done on the main server, not in your VM. 

## Part 2: Working with git

**Set up Github.com & fork this lab**

Go to http://github.com and set up a user account. 

Skim https://help.github.com/articles/fork-a-repo/ (it's OK if you don't understand it all immediately - just keep following the steps here)

Go to https://github.com/StThomas-SEIS660/Lab-03 and fork the repo. Press the Fork button at top right:

![fork](resources/fork.jpg)

Now, go to your home account on Github and find the URL for the forked repository. 

Important: you should NOT be copying this:

    https://github.com/StThomas-SEIS660/Lab-03

Instead, it should look like this:

    https://github.com/your_Github_name/Lab-03

Clone the Github repository you forked as Lab-03 to your home directory /home/student/YourID/. Go into it and verify the contents look as below. Notice the username YourID; **this must be replaced with your Github user name**. 

````
teststud@seis660:~$ git clone https://github.com/CharlesTBetz/Lab-03.git
Cloning into 'Lab-03'...
remote: Counting objects: 78, done.
remote: Compressing objects: 100% (60/60), done.
remote: Total 78 (delta 31), reused 58 (delta 11)
Unpacking objects: 100% (78/78), done.
Checking connectivity... done.
teststud@seis660:~$ cd Lab-03/
teststud@seis660:~/Lab-03$ ls
Lab-03-Instructions.md	LICENSE  README.md  resources  starter.sh  Vagrantfile
````

**Try git out**

Be sure you are in the new Lab-03 directory that git created:

    vagrant@precise64:~$ cd ~/Lab-03/

Create a file called myStudentID-testfile, e.g. stud0001-testfile.md.

    teststud@seis660:~/Lab-03$ nano teststud-testfile.md 
    
Put some Markdown content in it, starting with  the phrase "Hello World." ([What's Markdown?](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)).

Exit nano (ctrl-X, saving as prompted).

Add your file to your git repository


    teststud@seis660:~/Lab-03$ git add teststud-testfile.md 
    teststud@seis660:~/Lab-03$ git commit -m "my first commit"
    
You will get:

````
[master 312919f] my first commit
 Committer: test <teststud@seis660.gps.stthomas.edu>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 2 insertions(+)
 create mode 100644 teststud-testfile.md
````

Disregard the issue with your user name and email for now.

Now, edit the file again. 

    teststud@seis660:~/Lab-03$ nano teststud-testfile.md

Add "Hello Again" as a second line and exit nano in the usual way. 

You have now made a change, relative to what you committed. You can see that change through issuing the command 'git diff':

````
teststud@seis660:~/Lab-03$ git diff
diff --git a/teststud-testfile.md b/teststud-testfile.md
index 9801343..fcb9459 100644
--- a/teststud-testfile.md
+++ b/teststud-testfile.md
@@ -1,2 +1,3 @@
 Hello World
+Hello Again

````

We will be covering git in more detail as we go, but this clearly shows that Hello Again has been added. 

Commit it again (you only need to add it once): 

````
teststud@seis660:~/Lab-03$ git commit teststud-testfile.md -m "second commit"
[master becf9ae] second commit
 Committer: test <teststud@seis660.gps.stthomas.edu>
[ ... email error message ... ]

 1 file changed, 1 insertion(+)
````

Go back into nano and replace "World" with "Mars." Exit nano. 

Run git diff again:

````
teststud@seis660:~/Lab-03$ git diff
diff --git a/teststud-testfile.md b/teststud-testfile.md
index fcb9459..dcc7a8e 100644
--- a/teststud-testfile.md
+++ b/teststud-testfile.md
@@ -1,3 +1,3 @@
-Hello World
+Hello Mars
 Hello Again
 
````

Commit it again:
 
````
teststud@seis660:~/Lab-03$ git commit teststud-testfile.md -m "third commit"
[master d9b8c5d] third commit
 Committer: test <teststud@seis660.gps.stthomas.edu>
[... email error message ...]
 1 file changed, 1 insertion(+)
````

Now, let's look at our commit history:

````
commit d9b8c5d55c99279f6280c4ffb439c448f0097880
Author: test <teststud@seis660.gps.stthomas.edu>
Date:   Wed Feb 18 19:29:00 2015 -0600

    third commit

diff --git a/teststud-testfile.md b/teststud-testfile.md
index fcb9459..dcc7a8e 100644
--- a/teststud-testfile.md
+++ b/teststud-testfile.md
@@ -1,3 +1,3 @@
-Hello World
+Hello Mars
 Hello Again
 

commit becf9ae31a722d852c4680f3839f42a628d32162
Author: test <teststud@seis660.gps.stthomas.edu>
Date:   Wed Feb 18 19:27:22 2015 -0600

    second commit

diff --git a/teststud-testfile.md b/teststud-testfile.md
index 9801343..fcb9459 100644
--- a/teststud-testfile.md
+++ b/teststud-testfile.md
@@ -1,2 +1,3 @@
 Hello World
+Hello Again
 

commit 312919f65be24cb9b3ec32f5e17082f3a5bc63e1
Author: test <teststud@seis660.gps.stthomas.edu>
Date:   Wed Feb 18 19:23:15 2015 -0600

    my first commit

diff --git a/teststud-testfile.md b/teststud-testfile.md
new file mode 100644
index 0000000..9801343
--- /dev/null
+++ b/teststud-testfile.md
@@ -0,0 +1,2 @@
+Hello World
+

````

Hit "q" to exit the commit review. (You can keep going back, but then you are getting into earlier commits on the cloned repository that I did while setting it up. More on that later.)

All of these changes have been locally committed to your git instance on your Vagrant virtual machine. Let's send them back up to your fork at Github. You will need to authenticate (we could set up ssh to github, but not right now):

````
teststud@seis660:~/Lab-03$ git push origin master
Username for 'https://github.com': CharlesTBetz
Password for 'https://CharlesTBetz@github.com': 
Counting objects: 9, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (9/9), 749 bytes | 0 bytes/s, done.
Total 9 (delta 3), reused 0 (delta 0)
To https://github.com/CharlesTBetz/Lab-03.git
   88af368..d9b8c5d  master -> master
````

At this point you have pushed your file up to your LOCAL fork of the Lab-03 repository. I cannot see it unless I navigate to your Github site. 

Go back to your browser and issue a pull request:

![pull](resources/pull.jpg)

If your work is acceptable, I will allow it to be merged back into mainline.

[Instructor's note to self: Need to create a branch representing the semester as distinct from mainline.] 

There is much to learn about git and this lab is not intended to be a full tutorial, but rather means to an end, and a quick flavor of the techniques. We will cover further aspects as necessary. 

##Part 3: Automated provisioning

This section will bring together your VM work with git, as you develop a script to automate your activities and commit it to source control. 

**Vagrant up from the lab directory**
We will not vagrant up from your ~/vagrant directory. Instead, we will vagrant up from your ~/Lab-03 directory. 



**Script your work**

Write a shell script that automates the directory creation and tree installation and use. You can base it on starter.sh but you need to rename it. Review your Unix commands as necessary. 

  * Use Nano. Notice the shebang (#!/bin/bash) at the top of starter.sh. 

  * Name it YourID-Lab03.sh

  * You will need to change (chmod) the permissions correctly to run it. 
  
So:

    vagrant@precise64:~$ cd Lab-03/
    vagrant@precise64:~/Lab-03$ nano starter.sh 
    
Create your script. Use "tree" to see your results and "rm -rf A C D" to delete the directories if you need to run the script several times to perfect it 

````
vagrant@precise64:~/Lab-03$ ls -l  
total 40
drwxrwxr-x 5 vagrant vagrant 4096 Feb 18 22:33 A
drwxrwxr-x 4 vagrant vagrant 4096 Feb 18 22:33 C
drwxrwxr-x 5 vagrant vagrant 4096 Feb 18 22:33 D
-rw-rw-r-- 1 vagrant vagrant 3470 Feb 18 22:24 Lab-03-Instructions.md
-rw-rw-r-- 1 vagrant vagrant 1084 Feb 18 22:24 LICENSE
-rw-rw-r-- 1 vagrant vagrant   33 Feb 18 22:24 README.md
drwxrwxr-x 2 vagrant vagrant 4096 Feb 18 22:24 resources
-rw-rw-r-- 1 vagrant vagrant  152 Feb 18 22:24 starter.sh
-rw-rw-r-- 1 vagrant vagrant  356 Feb 18 22:38 teststud-Lab03.sh
-rw-rw-r-- 1 vagrant vagrant   24 Feb 18 22:24 teststud-testfile.md
vagrant@precise64:~/Lab-03$ chmod 755 teststud-Lab03.sh 
````

Run it & confirm it works. 

    vagrant@precise64:~/Lab-03$./YourID-Lab03.sh  <- notice the "./"
    
Oops, something seems to be wrong:

````
vagrant@precise64:~/Lab-03$ ./teststud-Lab03.sh 
E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)
E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?
E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)
E: Unable to lock the administration directory (/var/lib/dpkg/), are you root? 
````

Because the script has installations in it, you need to run it as superuser:

````    
vagrant@precise64:~/Lab-03$ sudo ./teststud-Lab03.sh 
Reading package lists...
Building dependency tree...
Reading state information...
git is already the newest version.
0 upgraded, 0 newly installed, 0 to remove and 66 not upgraded.
Reading package lists...
Building dependency tree...
Reading state information...
tree is already the newest version.
0 upgraded, 0 newly installed, 0 to remove and 66 not upgraded.
````

What did it do?

First, it did NOT install git or tree, since those are already there. That's ok. 
Second, it DID create your directories and files:

````
vagrant@precise64:~/Lab-03$ tree
.
|-- A
|   |-- aa
|   |-- B
|   |   `-- bb
|   |-- C
|   |   `-- cc
|   `-- D
|       `-- dd
|-- C
|   |-- cc
|   |-- E
|   |   `-- ee
|   `-- F
|       `-- ff
|-- D
|   |-- dd
|   |-- G
|   |   `-- gg
|   |-- H
|   |   |-- hh
|   |   |-- J
|   |   |   `-- jj
|   |   `-- K
|   |       `-- kk
|   `-- I
|       `-- ii
|-- Lab-03-Instructions.md
|-- LICENSE
|-- README.md
|-- resources
|   `-- fork.jpg
|-- starter.sh
|-- teststud-Lab03.sh
`-- teststud-testfile.md

14 directories, 20 files
````

Add and commit locally:

````
vagrant@precise64:~/Lab-03$ git add teststud-Lab03.sh
vagrant@precise64:~/Lab-03$ git commit teststud-Lab03.sh -m "script commit"
[master b5f0950] script commit
 Committer: vagrant <vagrant@precise64.(none)>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 10 insertions(+)
 create mode 100755 teststud-Lab03.sh
 ````

Change it so that it no longer creates the E subdirectory under C. 

Run it & confirm it works

Review differences and check in. 

*You are now doing "infrastructure as code."* 

When you are satisfied, push it back into your github remote account and issue a pull request so that I review it. Commit it to your github fork (on your remote account). NOTE: IF YOU DO NOT DO PUSH IT BACK TO GITHUB YOU WILL LOSE YOUR SCRIPT WHEN YOU DESTROY YOUR VM!

 ````
vagrant@precise64:~/Lab-03$ git push origin master
Username for 'https://github.com': CharlesTBetz
Password for 'https://CharlesTBetz@github.com': 
To https://github.com/CharlesTBetz/Lab-03.git
   8057ec2..b5f0950  master -> master
````

Vagrant destroy your vm:

    vagrant@precise64:~/Lab-03$cd ..
    vagrant@precise64:~$ vagrant destroy

**Automate provisioning with Vagrant**

Clear all the comments out of your Vagrantfile. 

Edit your Vagrantfile so that it calls your *-Lab03.sh script when you provision the machine. 

Vagrant up your machine and ssh into it, verify that your script has been run. Including installing tree. 

**Using Chef instead of shell**

Write a Chef recipe that is run by Vagrant to do the same thing. You cannot just call your previous script.

Run, check in to Github when succeeds, and alter it so it also installs curl

Check in and observe differences.

