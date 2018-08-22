function clickToInput() {
  const button = document.getElementById("orange");

  button.addEventListener('click', (event) => {
    console.log("coucou");
  });
}

export { clickToInput };
