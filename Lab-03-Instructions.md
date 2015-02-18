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

Wipe the VM & reload
Create your Vagrant VM and log into it. 

Why did I make the directory structure so detailed? This is typical of setting up infrastructure as code - you need to be able to maintain focus and successfully set up instructions that are both complicated and yet repetitive. 


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


**Install git**

Let's install git on the virtual machine. Be sure you are in 
your home directory. 

    vagrant@precise64:~$cd 
    vagrant@precise64:~$sudo apt-get install git
    

Notice you can sudo (run administrative commands) here. It's your machine!

Clone the Github repository you forked as Lesson 03 to your VM, in your home directory **on the VM**. 

````
vagrant@precise64:~$ git clone https://github.com/CharlesTBetz/Lab-03.git
Cloning into 'Lab-03'...
remote: Counting objects: 31, done.
remote: Compressing objects: 100% (20/20), done.
remote: Total 31 (delta 7), reused 31 (delta 7), pack-reused 0
Unpacking objects: 100% (31/31), done.
vagrant@precise64:~$ 
````

Notice I used the username CharlesTBetz; **this must be replaced with your Github user name**. 

**Try git out**

CD to the new Lab-03 directory that git created:

    vagrant@precise64:~$ cd Lab-03/

Create a file called myStudentID-testfile, e.g. stud0001-testfile.md.

    nano MyStudentID-testfile.md 
    
Put some Markdown content in it, starting with  the phrase "Hello World." ([What's Markdown?](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)).

Exit nano.

Add your file to your git repository

    git add myStudentID-testfile.md
    git commit "my first commit"
    
You will get:

````
vagrant@precise64:~/Lab-03$ git commit -m "my first commit"
[master 5c9b944] my first commit
 Committer: vagrant <vagrant@precise64.(none)>
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

Now, edit the file again. Add "Hello Again" as a second line. You have now made a change, relative to what you committed. You can see that change through issuing the command 'git diff':

````
vagrant@precise64:~/Lab-03$ git diff
diff --git a/teststud-testfile.md b/teststud-testfile.md
index 557db03..fcb9459 100644
--- a/teststud-testfile.md
+++ b/teststud-testfile.md
@@ -1 +1,3 @@
 Hello World
+Hello Again
+
````

We will be covering git in more detail as we go, but this clearly shows that Hello Again has been added. 

Commit it again (you only need to add it once): 

````
vagrant@precise64:~/Lab-03$ git commit teststud-testfile.md -m "second commit"
[master b61fe73] second commit
 Committer: vagrant <vagrant@precise64.(none)>
[ ... email error message ... ]

 1 file changed, 1 insertion(+)
````

Go back into nano and replace "World" with "Mars." 

Run git diff again:

````
vagrant@precise64:~/Lab-03$ git diff
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
vagrant@precise64:~/Lab-03$ git commit -m "3rd commit"
[master a077b45] 3rd commit
[... email error message ...]
 1 file changed, 1 insertion(+)
````

Now, let's look at our commit history:

````
vagrant@precise64:~/Lab-03$ git log -p teststud-testfile.md
commit 8057ec263df1830de0099907be08ecc44bd509ff
Author: vagrant <vagrant@precise64.(none)>
Date:   Wed Feb 18 00:32:49 2015 +0000

    third commit

diff --git a/teststud-testfile.md b/teststud-testfile.md
index fcb9459..dcc7a8e 100644
--- a/teststud-testfile.md
+++ b/teststud-testfile.md
@@ -1,3 +1,3 @@
-Hello World
+Hello Mars
 Hello Again
 

commit b61fe735241bd17493e4e0e8222bc9dbd38ca879
Author: vagrant <vagrant@precise64.(none)>
Date:   Wed Feb 18 00:30:43 2015 +0000

    second commit

diff --git a/teststud-testfile.md b/teststud-testfile.md
index 9801343..fcb9459 100644
--- a/teststud-testfile.md
+++ b/teststud-testfile.md
@@ -1,2 +1,3 @@
 Hello World
+Hello Again
 

commit 2d7f98a139ffcef0ea1ceaf47b7ee7ec4e4fefd6
Author: vagrant <vagrant@precise64.(none)>
Date:   Wed Feb 18 00:29:59 2015 +0000

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

All of these changes have been locally committed to your git instance on your Vagrant virtual machine. Let's send them back up to your fork at Github:

````
vagrant@precise64:~/Lab-03$ git push origin master
Username for 'https://github.com': CharlesTBetz
Password for 'https://CharlesTBetz@github.com': 
To https://github.com/CharlesTBetz/Lab-03.git
   99bd033..8057ec2  master -> master
vagrant@precise64:~/Lab-03$ 
````

Go back to your browser and issue a pull request:

![pull](resources/pull.jpg)

If your work is acceptable, I will allow it to be merged back into mainline. 

Finally, destroy your VM. 

There is much to learn about git and this lab is not intended to be a full tutorial. We will cover further aspects as necessary. 

##Part 3: Automated provisioning

**Script your work**

Write a shell script that automates the git installation, directory creation and tree installation and use. You can base it on starter.sh but you need to rename it. Review your Unix commands as necessary. 

  * Use Nano. Notice the shebang (#!/bin/bash) at the top. 

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

Commit it to your github fork. NOTE: IF YOU DO NOT DO THIS YOU WILL LOSE YOUR SCRIPT WHEN YOU DESTROY YOUR VM:

 ````
vagrant@precise64:~/Lab-03$ git push origin master
Username for 'https://github.com': CharlesTBetz
Password for 'https://CharlesTBetz@github.com': 
To https://github.com/CharlesTBetz/Lab-03.git
   8057ec2..b5f0950  master -> master
````

*You are now doing "infrastructure as code."* 

When you are satisfied, check it back into your github remote account and issue a pull request so that I review it. 

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

