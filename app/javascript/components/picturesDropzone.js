import Dropzone from "dropzone";
import "dropzone/dist/dropzone.css";

Dropzone.autoDiscover = false;


function initDropzones() {
  let csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  let forms = document.querySelectorAll('.simple_form.dropzone');

  forms.forEach((form) => {
    let selector = "#" + form.id;

    new Dropzone(selector,
      {
        paramName: "picture",
        addRemoveLinks: true,
        init: function() {
          this.on("removedfile", function(file) {
            let response  = JSON.parse(file.xhr.response);
            let deletionUrl   = response.deletionUrl;

            fetch(deletionUrl, {
              method: "DELETE",
              headers: {
                "Accept":       "application/json",
                "Content-Type": "application/json",
                'X-CSRF-Token': csrfToken
              },
              credentials: 'same-origin'
            })
          });
        }
      }
    );
  });


  // var dropzone = new Dropzone(".dropzone-upload",
  //   {
  //     paramName: "picture",
  //     addRemoveLinks: true,
  //     init: function() {
  //       this.on("removedfile", function(file) {
  //         let response  = JSON.parse(file.xhr.response);
  //         let deletionUrl   = response.deletionUrl;

  //         fetch(deletionUrl, {
  //           method: "DELETE",
  //           headers: {
  //             "Accept":       "application/json",
  //             "Content-Type": "application/json",
  //             'X-CSRF-Token': csrfToken
  //           },
  //           credentials: 'same-origin'
  //         })
  //       });
  //     }
  //   }
  // );
}

export { initDropzones };
