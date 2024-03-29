# [King's Banking App](https://kingsbanking.herokuapp.com/)

![img](https://github.com/zaini/SEG_SGP/blob/main/app/assets/images/logos/logo_h.png?raw=true)

### By Team Topi: Ali Zaini, Jian Tey, Bowen Yang, Quan Zhou (and Siyuan Zhang)
### Important Information.
We were assigned 5 members but Zhang Siyuan never showed up. This limited the scope of our project but we believe we have still successfully implemented the vast majority of the functionality and hope that our peer review assessments will be taken into consideration when marking.

## A fake banking service to faciliate scam-baiting

Application has been deployed on Heroku and can be found [here](https://kingsbanking.herokuapp.com/).

To login as an admin, visit https://kingsbanking.herokuapp.com/admin/login and login with username ```admin``` and password ```password123```. All the admin features require you to be logged in as an admin and to then access the URL [directly](https://kingsbanking.herokuapp.com/admin) or from the footer, where it is hidden.

This admin has two users. You can login as one of the those users by logging out of the admin account and clicking login and using email ```john.smith@email.com``` or ```jonelle@hotmail.com``` and password ```password123```. The default password for all randomly generated users is ```password123```. 

We are declaring that we have used the [LinkedIn Learning course](https://www.linkedin.com/learning/ruby-on-rails-6-essential-training) and 5CCS2SEG lecture material to support us as well as general learning from other online resources. The footer was heavily inspired by [mdbootstrap](https://mdbootstrap.com/docs/jquery/navigation/footer/). The random behavior was supported by [faker](https://github.com/faker-ruby/faker).

We have also submitted all our source code, a specification of the code, a report and a PDF document containing the ER diagram for our final database design.

This README contains other userful information about our development process.

# Features

* The site is made to look like a real bank, with multiple fake pages such as a contact page and loans etc.
* You can access the admin panel by going to /admin or by clicking the link hidden in the footer of the site
* You can create and log into your admin account
* Admin's can access an admin panel where they can manage (CRUD) their users, the users bank accounts and the bank account transactions
* Admins can click a button to populate their account with multiple users, bank accounts and transactions
* You can log into your user account like a real bank account to manage your bank accounts and transactions
* You can view the bank statement of any bank account
* You can transfer money between your bank accounts
* You can make payments from your bank account which will be deduced from your account
* You can easily create currencies for the application from the command line, by running the rails console and just doing something like ```Currency.create(code: "GBP", symbol: "£", rate_to_gbp: 1)```
* There is validation and checks for the user being logged in throughout the application

Admins can create and manage everything about Users. Users will can have multiple bank accounts, which in turn have many transactions. These transactions can have money going in and out.
All the transactions are technically stored in GBP and the converted to whatever currency is set for the User who owns that account.

There are many more nifty features throughout the application which we encourage your to try out. Please keep in mind we had to limit the scope of this project due to a missing member and that you should really consider our peer assessments when evaluating thsi project.

# Installation

You must have Ruby, Ruby on Rails and PostgreSQL installed. You can use use [this](https://gorails.com/setup/ubuntu/20.10) guide to set them up, just follow the recomendations. This project uses Ruby version 2.7.2 and Rails version 6.0.3.4.

# Running Application

To begin running the application, you can just run ```rails server``` from the command line and open up ```http://localhost:3000/```

# Database Instructions

Make sure your PostgreSQL server is running and you have a user called ```kingsbankingapp```. You can create such a user with this command: ```sudo -u postgres createuser kingsbankingapp -s```

You should be able to run the migrations by simply running ```rails db:migrate```, however if you have conflicts when attempting this, consider running ```rails db:reset``` which will **delete your current database** entirely and creating from new and also run the new migrations.

# Testing

```test``` folder can be found in the root of the project directory and contains all the files needed to conducting testing. Most testing will revolve arround the controllers and models which can be easily accessed from there. I suggest you look at the existing tests and follow from those, but also consider going through these guides:

* https://guides.rubyonrails.org/v3.2/testing.html
* https://youtu.be/jQvB0QWe5Bs
* https://guides.rubyonrails.org/testing.html

To run your tests you'll need to load the test database by running ```rake db:test:load```

You can run all the tests by simplying running ```rails test```

You can then run all your tests in a file like this: ```ruby -Itest test/unit/post_test.rb``` or run a specific test method like this: ```ruby -Itest test/unit/post_test.rb -n test_the_truth```

# Deployment

You can follow these guides for deploying to Heroku:

* https://devcenter.heroku.com/articles/git

* https://devcenter.heroku.com/articles/github-integration

When deploying this application, you may need to also run the following commands:

* ```rails db:migrate``` / ```rails db:migrate``` / ```rake db:reset``` 

* ```bundle install```

* ```yarn install --check-files```

You can access the Ruby on Rails console by running ```rails c``` and then use that to create currencies as described in the features section above.

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
