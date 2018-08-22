function clickToInput() {
  const button = document.getElementById("orange");

  button.addEventListener('click', (event) => {
    const input = document.getElementById("search-input");
    input.classList.toggle("search-input-display")
    button.classList.toggle("colors-inversed")
  });
}

export { clickToInput };
