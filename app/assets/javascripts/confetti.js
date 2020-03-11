var confettiShower = [];
var numConfettis = 400;
var container = document.getElementById('confetti-container');
var colors = [
  "#00FF73  ",
  "#6C4AE2",
  "#FDDA00 ",
  "#DB27DB ",
  "#FA405A ",
  "#51EFFC ",
  "#EB640A "
];

class Confetti {
  constructor(x, y, w, h, c) {
    this.w = Math.floor(Math.random() * 15 + 5);
    this.h = this.w*1.2;
    this.x = Math.floor(Math.random() * 100);
    this.y = Math.floor(Math.random() * 100);
    this.c = colors[Math.floor(Math.random() * colors.length)];
  }
  create() {
      var newConfetti = '<div class="confetti" style="bottom:' + this.y +'%; left:' + this.x +'%;width:' +
        this.w +'px; height:' + this.h +'px;"><div class="rotate"><div class="askew" style="background-color:' + this.c + '"></div></div></div>';
      container.innerHTML+= newConfetti;
      }
  };

function animateConfetti() {
  for (var i = 1; i <= numConfettis; i++) {
    var confetti = new Confetti();
    confetti.create();
  }
  var confettis = document.querySelectorAll('.confetti');
  for (var i = 0; i < confettis.length; i++) {
    var opacity = Math.random() + 0.1;
    var animated = confettis[i].animate([
      { transform: 'translate3d(0,0,0)', opacity: opacity },
      { transform: 'translate3d(20vw,100vh,0)', opacity: 1 }
    ], {
      duration: Math.random() * 3000 + 3000,
      iterations: Infinity,
      delay: -(Math.random() * 5000)
    });
   confettiShower.push(animated);
  }
}
animateConfetti();
