# LeapUp
A Software Engineering Project - Activity Forum

Please make a new branch for your work off master so we don't lose any progress!

git checkout -b 'branchname'

^^ use this to checkout out a new branch replacing 'branchname' with some text, no "" necessary!

I find the git bash is most useful for this since we're not on macs -_-

Make sure to have the WAMP server installed and place the files under the www directory.

Helpful commands:

git pull --use this to update your branch, so if two people are working on same branch and one does a commit the other needs to do a pull to get the new changes.

git status --checks what files you've modified, deleted, added

git branch --gives you a list of branches you've downloaded

git checkout 'branchname' --use this to checkout someone elses branch, replacing 'branchname' entirely with the branch you want, as well as to switch branches. to create a new branch use this option: -b ( git checkout -b "the_name_of_the_branch_you_want" ) NO SPACES or you'll want to die

git add 'filename' --use this after running at git status to add one file at a time to be commited. use: git add -A, to add all files at once

git commit -m "your message" --use this after adding all the files you want committed. This just commits to your local machine. Make sure to run the command below to push to our github repo!. Here the "" are needed. Please provide a brief meaningful message of what you updated.

git push origin head --use this after commiting to push all your changes to the repo!
