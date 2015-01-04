Instagram
=========

This challenge involves building Instagram using Ruby on Rails. Users must be able to post pictures, write comments on pictures, and like a picture.  The design should mirror or improve upon Instagram. The challenge draws on experience from a previous project building a clone of Yelp.  I chose to learn a little about SVG and use this to style the key registration and sign-in pages.  The app is [hosted on Heroku.](https://beninst.herokuapp.com/)

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
<%= favicon_link_tag 'favicon.ico' %>
```

- How to load icons from a sprite file

- The advantage and control rgba() values give you over background opacity vs applying opacity to the whole container element
```css
   background: rgba(0,0,0,0.7);
```

- How to chain filters in CSS

```css
-webkit-filter: grayscale(100%) brightness(10) drop-shadow(1px 1px 1px rgba(4,40,71,.8));
```

- How to extend Devise to offer a more intuitive username-based log-in rather than just email and add an avatar image to a username

- How to use jQuery to allow a user to submit from a textarea element by simply pressing enter rather than clicking a traditional submit button.  

```javascript
$('#comment-box').keypress(function(e){
  if(e.which == 13){
     $('#comment-form').submit();
   }
});
```
 
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

- The benefits of SVG graphics with [Walkway.js for the front-page sign-in screen](http://www.connoratherton.com/walkway)

- How to mirror an SVG file along its x-axis

- That Rails comes with jQuery out of the box....

- That jQuery performance can be influenced via 'turbolinks' so ```gem 'jquery-turbolinks'``` can be useful to ensure a more consistent user experience

- How to reset a Heroku PostgreSQL database...

- How to rollback database migrations

####Things To Improve Project
- Responsive Design.  I need to learn more about this and positioning.
- Mobile Design
- A bespoke sprite could be created, and unused icons deleted
- Offer users ability to modify their profile
- Perhaps restrict the number of comments/likes individual users can make
- Spend more time researching styling of f.file_field, checkboxes, browser autocomplete
- Vertically-centre the sign-in elements?
- Revisit overall design consistency
- Integrate Devise Error Messages Neatly Into Design
- Refactor CSS Into Multiple Files
- TDD could have been followed more closely during the development process
- More validations & associated unit tests : e.g. a photo must be attached to a post
- Deeper look at ImageMagick compression, crop settings