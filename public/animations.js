$(document).ready(function(){
  $("nav").find("li").children("a").each(function () {
    if ($(this).attr("href") === window.location.pathname) {
      $(this).parent().addClass("active");
    } else {
      $(this).parent().removeClass("active");
    }
  });
});
