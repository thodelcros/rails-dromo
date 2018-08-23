import { TweenMax, Power0, Power1, Back } from "gsap/TweenMax";


TweenMax.fromTo(
  '.sun-light',
  2.5,
  {
    scale: 0.9,
    transformOrigin: 'center center',
  },
  {
    scale: 1.1,
    repeat: -1,
    yoyo: true,
    ease: Power1.easeInOut,
  }
);

const zeppelinAnimationTime = 4.47;
TweenMax.to(
  '#zeppelin',
  zeppelinAnimationTime,
  {
    yPercent: 20,
    repeat: -1,
    yoyo: true,
    ease: Back.easeInOut.config(5),
  }
);
TweenMax.to(
  '#tracks',
  zeppelinAnimationTime,
  {
    y: -5,
    repeat: -1,
    yoyo: true,
    ease: Back.easeInOut.config(3),
  }
);
[...document.querySelectorAll('.track')].map((track, i) => {
  const trackLength = track.getTotalLength();

  TweenMax.set(track, {
    'stroke-dasharray': trackLength,
  });
  TweenMax.fromTo(
    track,
    zeppelinAnimationTime / 5,
    {
      'stroke-dashoffset': trackLength * .7,
    },
    {
      'stroke-dashoffset': 0,
      delay: i * zeppelinAnimationTime / 8,
      repeat: -1,
      yoyo: true,
      ease: Power1.easeInOut,
    }
  );
});


const frontClouds = document.getElementById('clouds-front');
const frontCloudsWidth = 9106;

TweenMax.fromTo(
  frontClouds,
  11.98,
  {
    x: -frontCloudsWidth / 2
  },
  {
    x: 0,
    repeat: -1,
    ease: Power0.easeNone,
  }
)

const backClouds = document.getElementById('clouds-back')
const backCloudsWidth = 3716; // from sketch app

TweenMax.fromTo(
  backClouds,
  17.43,
  {
    x: -backCloudsWidth / 2,
  },
  {
    x: 0,
    repeat: -1,
    ease: Power0.easeNone,
  },
)
