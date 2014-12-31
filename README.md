Instagram
=========

This challenge involves building Instagram using Ruby on Rails. Users must be able to post pictures, write comments on pictures, and like a picture.  The design should mirror or improve upon Instagram and as a bonus, users could be able to apply filters to the images they upload. The challenge draws on experience from a previous project building a clone of Yelp.

####List Of Core Models For The App
- User
- Post
- Comments
- Likes

####New Things I Learned In This Project
- How to add a fonts folder to the asset path so that fonts can be embedded in an app and referenced via CSS: 

```ruby 
config.assets.paths << Rails.root.join("app", "assets", "fonts")
```

- How to call in browser tab icons via the rails favicon helper:
```ruby
<%= favicon_link_tag 'favicon.ico' %>```

- How to load icons from a sprite file

- How to chain filters in CSS
```css
-webkit-filter: grayscale(100%) brightness(10) drop-shadow(1px 1px 1px rgba(4,40,71,.8));
```

- How to extend Devise to offer a more intuitive username-based log-in rather than just email

- How to use jQuery to allow a user to submit from a textarea element by simply pressing enter rather than clicking a traditional submit button.  

```javascript
$('#comment-box').keypress(function(e){
  if(e.which == 13){
     $('#comment-form').submit();
   }
});
 
- That the ["timeago" jQuery](http://timeago.yarp.com) plug-in makes displaying abbreviated timestamps in a user-friendly format very easy. 

``` html
<abbr id="time-since-post" class="timeago" title="<%= post.created_at.getutc.iso8601 %>"><%= post.created_at.to_s %></abbr>
```

```javascript
$(document).ready(function() {
  $("abbr.timeago").timeago();
});
```

- How to edit Devise views

- That Rails comes with jQuery out of the box....


####Things To Improve
- Responsive Design
- Mobile Design
- AWS for hosting static files
- A bespoke sprite could be created, and unused icons deleted