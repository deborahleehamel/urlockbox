# URLockbox

[Heroku](https://possessed-asylum-98254.herokuapp.com/)

URLockbox is a small application for tossing various forms of inspiration forlater review. It's not unlike [Delicious](https://delicious.com) or [Pinboard](http://pinboard.com).

We build out a rails application that allows an authenticated user to:
  * sign up
  * log in and log out
  * submit and view links
  * update link status with options to "Mark as Read" and "Mark as Unread" without reloading the page
  * edit links after they have added some to my URLockbox when viewing links index
  * mark a link as read or unread without reloading page
  * filter list of link by search term as I type
  * click buttons/links to filter list by status("read" and "unread")
  * sort the list alphabetically

  Supporting features

  ## Installation
  * `git clone https://github.com/deborahleehamel/urlockbox.git`
  *  cd urlockbox
  * `bundle`
  * `rake db:create db:migrate`

  ## To run in Development
  * `rails s`
  * Go to [http://localhost:3000](http://localhost:3000) in your browser.

  ## LIVE in production at [Heroku](https://possessed-asylum-98254.herokuapp.com/)

  ## Testing
  * rspec
