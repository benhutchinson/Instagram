$(document).ready(function() {

  $('.like-button').on('click', function(event){
      event.preventDefault();

      var likeCount = $('.likes_count');

      $.post(this.href, function(response){
        if(response.new_like_count == 1){
          likeCount.text(response.new_like_count + ' like');
        } else {
          likeCount.text(response.new_like_count + ' likes');
        };
    })
  })
})