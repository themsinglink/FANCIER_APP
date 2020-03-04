const toggleNav = () => {
  const toggler = document.querySelector(".nav-toggle")
  if (toggler) {
    toggler.addEventListener("click", () => {
      const menu = document.querySelector(".nav")
      menu.classList.toggle("nav-hidden")
    })
  }
}

export default toggleNav
