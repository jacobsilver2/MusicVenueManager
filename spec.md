# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
  User has_many shows
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Show belongs_to user
  ActShow belongs_to user
  ActShow belongs_to act
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Act has_many :shows, :through => :act_shows  
  Show has_many :acts, :through => :act_shows
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  ActShow#headliner
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Act
    validates :name,
            :presence => {:message => "Name can't be blank."},
            :uniqueness => {:message => "Name already exists."}

  validates :contact_name, :presence => {:message => "Please enter a contact name" }
  validates :contact_email, :presence =>  {:message => "Please enter a contact email"}

  Show
    validates_uniqueness_of :date, :message => "That date is already taken.  Please choose another."
    validates_presence_of :start_time, :message => "Please enter a valid start time"
    validates_presence_of :date, :message => "Please enter a valid date"
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  shows/today
  shows/this_week
- [x] Include signup (how e.g. Devise)
  devise
- [x] Include login (how e.g. Devise)
  devise
- [x] Include logout (how e.g. Devise)
  devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  devise/omniauth/facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  shows/:id/acts
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  users/:id/show/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  @act.errors.any? ... views/shows/_form
  @show.errors.any? ... views/acts/_form
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
  acts_controller#create has more logic than any other controller method, but does use a private method to do a bunch of heavy lifting.
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate