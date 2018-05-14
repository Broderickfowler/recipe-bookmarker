# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  - I used the corneal gem to build this app
- [x] Use ActiveRecord for storing information in a database
  - ActiveRecord is required in my Gemfile and my models inherit from this gem.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  - User, Recipe, UserRecipe
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
  - User has_many user_recipes and recipes through user_recipes
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
  - UserRecipe belongs to a user and a recipe

- [x] Include user accounts
  - User accounts are unable to be duplicated, indicated in the User class. username must be unique.
  - User is able to log in and log out.
- [x] Ensure that users can't modify content created by other users
  -https://unorientedobject.wordpress.com/2016/09/14/aliasing-and-options-in-rails-activerecord-associations/
  - Buttons and links on Recipe Show pages only reveal "Edit" option if the user.id == creator.id of the recipe

- [ ] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  


- [x] Include user input validations
  - Models ensure a user account must include username and password

- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)


- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
