$(document).ready(function() {
  $(document).on('page:change',function() {

    $(".image_div").hover(function(){
        var $description = $(".description_content")
        $(this).find($description).stop().css({opacity: 0, visibility: "visible"}).animate({opacity: 1.0}, 400)
    }, function(){
        var $description = $(".description_content")
        $(this).find($description).stop().animate({opacity: 0}, 400);
    });

    $(".image_div_featured").hover(function(){
        var $description = $(".description_content_featured")
        $(this).find($description).stop().css({opacity: 0, visibility: "visible"}).animate({opacity: 1.0}, 400)
    }, function(){
        var $description = $(".description_content_featured")
        $(this).find($description).stop().animate({opacity: 0}, 400);
    });

  });
});