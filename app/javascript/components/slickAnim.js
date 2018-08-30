import "slick-carousel";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

function imagesSlides() {
  $(document).ready(function(){
    $(".slickContainer").slick({
      dots: true,
    });

    // Pour chaque modal, à son affichage, le carousel affiche la slide 0 qui n'existe pas, donc on le force
    // a afficher la slide 1

    $(".slickContainer").each(function() {
      const modalId = $(this).closest(".modal").attr('id');

      $(`#${modalId}`).on('show.bs.modal', function (e) {
        $(".slickContainer").slick("slickGoTo", 0);
      });
    });
  });
}

export { imagesSlides };
