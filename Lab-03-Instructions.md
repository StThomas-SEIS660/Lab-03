# IT Infrastructure Lab 3 Instructions #
**Overview** 

In this lab, you will get a very simple introduction to the concept of "infrastructure as code" using shell scripting on your virtual machine in conjunction with Git and Github

**Prerequisites**

You must have run the Linux tutorial (or be comfortable otherwise with Linux command-line tools). 

You must have successfully created your own virtual machine (VM) using Vagrant. 

You will do the exercises on your new Vagrant VM. 

## Part 1 ##

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


## Part 2

**Set up Github.com & fork this lab**

Go to http://github.com and set up a user account. 

Review https://help.github.com/articles/fork-a-repo/

Go to https://github.com/StThomas-SEIS660/Lab-03 and fork the repo. Press the Fork button at top right:

![fork](resources/fork.jpg)

Now, go to your home account on Github and find the URL for the forked repository. 

Important: you should NOT be copying this:

https://github.com/StThomas-SEIS660/Lab-03

Instead, it should look like this:

https://github.com/your_Github_name/Lab-03


**Install git**

    sudo apt-get install git
    
Change to the /vagrant directory. 

    cd /vagrant

This is the same as your /home/student/\<studentID>/vagrant directory. Anything you put there on the VM side will be available after you destroy the machine, on the host side.

[consider drawing a picture] 

Clone the Github repository you forked as Lesson 03 to your VM, in your /vagrant directory **on the VM**. 

````
vagrant@precise64:/vagrant$ git clone https://github.com/CharlesTBetz/Lab-03.git
Cloning into 'Lab-03'...
remote: Counting objects: 31, done.
remote: Compressing objects: 100% (20/20), done.
remote: Total 31 (delta 7), reused 31 (delta 7), pack-reused 0
Unpacking objects: 100% (31/31), done.
vagrant@precise64:/vagrant$ 
````

Notice I used the username CharlesTBetz; **this must be replaced with your Github user name**. 

**Try git out**

CD to the new Lab-03 directory that git created:

    vagrant@precise64:/vagrant$ cd Lab-03/

Create a file called myStudentID-testfile, e.g. stud0001-testfile.md.

    nano MyStudentID-testfile.md 
    

Put some Markdown content in it, starting with  the phrase "Hello World." ([What's Markdown?](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)).

Exit nano.

Add your file to your git repository

    git add myStudentID-testfile.md
    git commit "my first commit"
    
You will get:

````
vagrant@precise64:/vagrant/Lab-03$ git commit -m "my first commit"
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
vagrant@precise64:/vagrant/Lab-03$ git diff
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
vagrant@precise64:/vagrant/Lab-03$ git commit teststud-testfile.md -m "second commit"
[master b61fe73] second commit
 Committer: vagrant <vagrant@precise64.(none)>
[ ... email error message ... ]

 1 file changed, 1 insertion(+)
````

Go back into nano and replace "World" with "Mars." 

Run git diff again:

````
vagrant@precise64:/vagrant/Lab-03$ git diff
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
vagrant@precise64:/vagrant/Lab-03$ git commit -m "3rd commit"
[master a077b45] 3rd commit
[... email error message ...]
 1 file changed, 1 insertion(+)
````

Now, let's look at our commit history:

````
vagrant@precise64:/vagrant/Lab-03$ git log -p teststud-testfile.md
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
vagrant@precise64:/vagrant/Lab-03$ git push origin master
Username for 'https://github.com': CharlesTBetz
Password for 'https://CharlesTBetz@github.com': 
To https://github.com/CharlesTBetz/Lab-03.git
   99bd033..8057ec2  master -> master
vagrant@precise64:/vagrant/Lab-03$ 
````

Finally, go back to your browser and issue a pull request:

![pull](./resources/pulllreq.jpg)


There is much to learn about git and this lab is not intended to be a full tutorial. We will cover further aspects as necessary. 

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

