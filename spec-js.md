# Rails JQUERY JSON API Portfolio project checklist
# Specifications for the Rails with jQuery Assessment

Specs:
- [x](#) Use jQuery for implementing new requirements
- [ x](#) Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
	- I have Active Model Serializations for Show and Act.  shows#show is rendered via jQuery and AMS.
- [x ](#) Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
	- I have Active Model Serializations for Show and Act. shows#index is rendered via jQuery and AMS.
- [ x](#) Include at least one has many relationship in information rendered via JSON and appended to the DOM.
	- a Show has many Acts
- [ x](#) Use your Rails API and a form to create a resource and render the response without a page refresh.
	- There are forms for creating new shows and new acts.  Both are submitted and rendered without a page refresh.
- [ x](#) Translate JSON responses into js model objects.
	- I have the class Show, which is created every time a new show form is submitted.
- [ x](#) At least one of the js model objects must have at least one method added by your code to the prototype.
	- the Show class has two methods - renderShowButton() and viewShow()
Confirm
- [x ](#) You have a large number of small Git commits
- [ x](#) Your commit messages are meaningful
- [ x](#) You made the changes in a commit that relate to the commit message
- [ x](#) You don't include changes in a commit that aren't related to the commit message
