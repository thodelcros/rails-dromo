function addPhotos() {
  console.log("AddPhotos js ON");

  const AddPhotoInDomAndAddInputFile = (event) => {
    let photosContainer = document.querySelector(".edit-step-form-photos-content .row");
    let photoInput = event.currentTarget;
    console.log(photoInput);

    let photoFileList = photoInput.files;
    let photoFile     = photoFileList[0];

    let reader = new FileReader();
    reader.onloadend = function() {
      let photoDiv = "<div class=\"col-xs-6\">" +
        `<img src=\"${reader.result}\">` +
        "</div>";
      photosContainer.insertAdjacentHTML('beforeend', photoDiv);

      let emptyFileInput = document.createElement("input");
      emptyFileInput.setAttribute("class", "form-control-file file optional photos_picture");
      emptyFileInput.setAttribute("name", "photos[][picture]");
      emptyFileInput.setAttribute("type", "file");

      let simpleFieldPhoto = document.querySelector(".step_photos_picture");

      simpleFieldPhoto.appendChild(emptyFileInput);

      emptyFileInput.addEventListener("change", AddPhotoInDomAndAddInputFile);
    }

    if (photoFile) {
      reader.readAsDataURL(photoFile);
      photoInput.classList.add("hidden");
    }
  };

  let photoInput = document.querySelector(".photos_picture_input_file");
  photoInput.addEventListener("change", AddPhotoInDomAndAddInputFile);
}

export { addPhotos }
