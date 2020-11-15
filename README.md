# King's Banking App

## A fake banking service to faciliate scam-baiting by Team Topi

# Installation

You must have Ruby, Ruby on Rails and PostgreSQL installed. You can use use [this](https://gorails.com/setup/ubuntu/20.10) guide to set them up, just follow the recomendations. This project uses Ruby version 2.7.2 and Rails version 6.0.3.4.

# Running Application

To begin running the application, you can just run ```rails server``` from the command line and open up ```http://localhost:3000/```

# Database Instructions

Make sure your PostgreSQL server is running and you have a user called ```kingsbankingapp```. You can create such a user with this command: ```sudo -u postgres createuser kingsbankingapp -s```

TODO: need instructions on migrating the databases so everyone can work on the same version

# Testing

TODO: add instructions on how to write and run tests

# Deployment

Instructions on how to deploy (to Heroku) and view the current deployment will be added here.

# How To Contribute

1. Find a feature that is not being worked on from the Trello board. Make it clear you're working on that feature by assigning yourself as a member on that feature and moving it to the "Doing" section of the board.

2. Pull the most recent version of the project from GitHub and create a new branch, with an appropriate name for your feature.

3. Work on that branch to implement the feature, including it's testing.

4. Once the feature is complete, you can quickly showcase it to rest of the group and then take any suggestions.

5. Once you're happy with the feature and consider it completed, make a pull request on GitHub.

6. The request will be reviewed by other team members, some suggestions for the code may be given and then it will be merged with the main branch of the project.

7. Once a feature is fully implemented, move it to the "Done" section of the Trello board.

8. Use GitHub Issues/the Trello board to report any bugs, todos, feature requests and more.

## How do I use branches?

Create a branch with an appropriate name: ```git branch issue10```

Switch to a particular branch: ```git checkout issue10```

When you run that command, any work you commit is going towards that branch.

If you want to go back to the main/master branch, do ```git checkout master```

Keep in mind that when you go back to the master branch, the work in your other branch won't show up here and you'll have to go back.

To merge your new branch to the master branch, first go to the master branch with ```git checkout master``` and then merge using ```git merge issue10```

You can delete branches when you're done with them, but we don't do that here. If you do need to delete a branch (PLEASE DONT DO THIS IF YOU DONT NEED TO), you can do ```git branch -d issue10```

You can push your branch by using ```git push origin issue10```

There might be some issues when merging branches, which can be fixed by having a look at [this](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging#_basic_merge_conflicts) guide or asking the team.

## Standards

* Make frequent, small commits

* Pull the project often

* Make sure you're in the right branch when working

* If you're every stuck, even if it's something that seems minor, JUST ASK. The team will help. If you don't think you can finish work in time, just say!

* A consistent coding style and format is required. If you're using VSCode, run the formatting for your code before committing and also use other useful extensions such as Ruby, Bracket Pair Colorizer etc.

# Other

This project has a Trello board which can be viewed here: https://trello.com/b/oUJMwcPn/segsgp

We have a OneDrive with additional folders here: https://emckclac-my.sharepoint.com/:f:/r/personal/k1925171_kcl_ac_uk/Documents/CS%20G401/Year%202/Term%201/Software%20Engineering%20Group%20Project/SEG%20Small%20Group%20Project?csf=1&web=1&e=l6RIfm