function clickToInput() {
  const button = document.getElementById("orange");

  if (button) {
    button.addEventListener('click', (event) => {
      const input = document.getElementById("search-input");
      input.classList.toggle("search-input-display");
      input.focus();
      button.classList.toggle("colors-inversed")
    });
  }
}

export { clickToInput };
