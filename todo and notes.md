TODO


[x] SOMETHING IS GOING TO HAVE TO GET REFACTORED TO SUPPORT A HAS MANY  THROUGH RELATIONSHIP !!!
[x] Refactor new/edit form partial(s) to use Luisa's technique and only use one form.
[x] Show show page should list the set order based on the join model
[] Add an authentication method for Facebook.  CHANGE TO GITHUB.  IT'S EASIER!
[] Times are reporting incorrect values.





QUESTIONS FOR LUISA

[x] Advice on refactoring to support a has many through?
  [x] create a join model called act_show, that is used in a has many through relationship
  [x] act order 
    for this project (at least to start), the set order will be in order of when they were created, without the ability to edit set order.


[x] How can I clean up my Act create method to allow either an act to get added from a collection or create a new act?  Right now it feels a bit crude
[x] How can I bring back my Act validations and still allow the collection of already existing Acts (because hitting submit after choosing from the collection sends a params hash full of empty values which mostly all fail validations)

[] A show can't have the same act twice.  How do I make a validation for that?
look at rails guide for associations - uniqueness with scope option

[x] Why is my connection not secure?

[x] Is there a better solution with the form partials for new/edit act?  I had to use two because I didn't want the option of selecting a new act while in the edit page.
  if @act.new_record ...

[x] No go so far on Facebook integration with Devise.






