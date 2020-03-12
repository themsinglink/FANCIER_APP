const toggleNav = () => {
  const toggler = document.querySelector(".nav-toggle")
  if (toggler) {
    toggler.addEventListener("click", () => {
      const menu = document.querySelector(".nav")
      // check if menu is hidden
      if (menu.classList.contains("nav-hidden")) {
        // show menu
        menu.classList.remove("nav-hidden")
        // disable scroll on the page
        document.body.style.overflow =  "hidden"
      } else {
        // hide menu
        menu.classList.add("nav-hidden")
        // enable scroll
        document.body.style.overflow =  "scroll"
      }
    })
  }
}
export default toggleNav
