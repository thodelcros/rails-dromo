function listenForPointsClicks() {
  const steps = document.querySelectorAll(".js-point");

  steps.forEach((step) => {
    step.addEventListener('click', (event) => {
      let stepId = step.dataset.stepId
      let editForm = document.querySelector(`.edit-step-form-main-container[data-step-id='${stepId}']`);

      const editForms = document.querySelectorAll('.edit-step-form-main-container');

      editForms.forEach((form) => {
        form.classList.add('hidden');
      });

      editForm.classList.remove('hidden');
    });
  });
}

export { listenForPointsClicks };



// tag[attribute='value'] valid css selector
