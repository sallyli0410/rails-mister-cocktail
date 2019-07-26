import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Martini Monday", "Tequilla Tuesday", "Whisky Wednesday", "Tanqueray Thursday", "Fireball Friday", "Screwdriver Saturday", "Sex On The Beach Sunday"],
    typeSpeed: 75,
    loop: true
  });
}

export { loadDynamicBannerText };
