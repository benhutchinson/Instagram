Instagram
=========

The challenge issued involves building Instagram using Ruby on Rails. Users must be able to post pictures, write comments on pictures and like a picture.  The design should mirror or improve upon Instagram and as a bonus, users could be able to apply filters to the images they upload.

####List Of Core Models For The App
- User
- Post
- Comment/Description
- Likes


####New Things Learned From This Project
- Adding a fonts folder to the asset path so that fonts can be embedded in the app and referenced via CSS
```ruby
config.assets.paths << Rails.root.join("app", "assets", "fonts")
```