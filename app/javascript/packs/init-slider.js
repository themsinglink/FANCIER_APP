import rangeSlider from "rangeslider-js"

const initSlider = () => {
  const slider = document.querySelector("#money-slider")
  if (slider) {

  slider.addEventListener("change", (e) => {
    const output = document.querySelector("#q_price_money_lteq")
    output.value = e.target.value
  })
  }
}

export default initSlider
