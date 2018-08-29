function imagesSlides() {
  document.addEventListener("DOMContentLoaded", function(event) {
    $(".slickContainer").slick({
      slide: 'div',
      prevArrow: '<div class="slick-prev"><i class="fa fa-chevron-left"></i></div>',
      nextArrow: '<div class="slick-next"><i class="fa fa-chevron-right"></i></div>',
      dots: true,
      infinite: true,
      speed: 300,
      slidesToShow: 1,
    });
  });
}

export { imagesSlides };

