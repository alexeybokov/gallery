# README

Application: a simple gallery displaying images of different subjects combined categories.

Categories- displays the 5 most popular categories. Popular categories are those with the most images, likes and comments.
Images - All images, sorted by likes descending, average size preview.
All comments sorted by creation date.

Emails are sent when a user + is registered, + subscribes to a category and + when a new image is added to a signed category.

User can:
Register and login.
Recover forgotten password.
Create new categories.
Upload new images.
Delete your categories. (When deleting an image, all its images and image comments will be deleted)
Like the pictures (one picture - one like, displayed next to each picture). Like the image again will like the back.
Leave comments to pictures (one picture - many comments, displayed next to each picture)
Edit your data: password, name, email.
Delete your account.
Subscribe and unsubscribe to / from category.

User may NOT:
Edit and delete your comments.
Edit and delete your images.
Upload images larger than 50Mb.
Upload video files, text files and so on. Only .jpg, .jpeg, .png files are available for download.

Admin Panel.The main page (dashboard) displays:

5 most recently created categories
5 recent comments
10 last uploaded images
All users action

Admin can:
Create, edit, delete all application resources. (Categories, images, comments, etc.)
Create and delete new administrators.
View actions for each user, divided by type of action with the ability to filter by user. Possible types of user actions:
user navigation (which pages you clicked)

Used by:
ruby 2.3 +, rails 5 +, postgresql, github, heroku

gems
UI framework Bootstrap (https://github.com/twbs/bootstrap-sass)
template haml (https://github.com/indirect/haml-rails)
Carrierwave downloads (https://github.com/carrierwaveuploader/carrierwave)
Devise authentication (https://github.com/plataformatec/devise)
Admin panel ActiveAdmin (https://github.com/activeadmin/activeadmin)
Kaminari pagination (https://github.com/kaminari/kaminari)
Rspec test framework (https://github.com/rspec/rspec-rails)
gem resque - send emails.
i18n - ability to switch language
