const bigInt = require('big-integer');
const QRCode = require('qrcode');
const n = bigInt(window.n);
const n2 = bigInt(window.n2);
const g = bigInt(window.g);
const b = bigInt(window.b);
const urlBase = window.urlBase;

window.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll("[name='vote']").forEach(function(el) {
    el.addEventListener("click", function() {
      const v = bigInt(this.value);
      let m;
      if (v.equals(0)) {
        m = bigInt(0);
      } else {
        m = b.modPow(v.minus(1), n2);
      }
      const gm = g.modPow(m, n2);
      let r;
      while (true) {
        r = bigInt.randBetween(2, n.minus(1));
        if (bigInt.gcd(r, n).equals(1)) {
          break;
        }
      }
      const rn = r.modPow(n, n2);
      const c = gm.multiply(rn).mod(n2);
      // console.log(c.toString());
      const url = `${urlBase}?c=${c}`;
      // console.log(url);
      const canvas = document.getElementById('ballot-canvas')
      QRCode.toCanvas(canvas, url, function (error) {
        if (error) console.error(error)
        // console.log('success!');
      });
      document.getElementById('m').innerHTML = `m: ${m}`;
      document.getElementById('c').innerHTML = `c: ${c}`;
      document.getElementById('r').innerHTML = `r: ${r}`;
    });
  });
});
