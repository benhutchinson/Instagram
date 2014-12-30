Instagram
=========

The challenge issued involves building Instagram using Ruby on Rails. Users must be able to post pictures, write comments on pictures and like a picture.  The design should mirror or improve upon Instagram and as a bonus, users could be able to apply filters to the images they upload.

####List Of Core Models For The App
- User
- Post
- Comment/Description
- Likes

####Things To Improve
- Responsive
- AWS for hosting static files
- Creating a bespoke sprite and deleting unused icons from sprite

####New Things Learned From This Project
- Adding a fonts folder to the asset path so that fonts can be embedded in the app and referenced via CSS
```ruby
config.assets.paths << Rails.root.join("app", "assets", "fonts")
```
- Calling in browser tab icons & the rails favicon helper
```<link rel="shortcut icon" href="icon.ico">```
vs Rails helper
```<%= favicon_link_tag 'browser_icon.ico' %>```

- Calling in icons via a sprite

- Chaining in filters in CSS
```
-webkit-filter: grayscale(100%) brightness(10) drop-shadow(1px 1px 1px rgba(4,40,71,.8));
```

- Added Devise username functionality and edited Devise views

- that Rails comes with jQuery out of the box

- the timeago jQuery plug-in for displaying abbreviated "fuzzy" timestamps that describe the time since a post (http://timeago.yarp.com)

``` html
<abbr id="time-since-post" class="timeago" title="<%= post.created_at.getutc.iso8601 %>"><%= post.created_at.to_s %></abbr>
```

```javascript
$(document).ready(function() {
  $("abbr.timeago").timeago();
});
```