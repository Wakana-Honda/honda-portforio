const CLASSNAME = "-visible";
const TIMEOUT = 1500;
const DELAY = 100;
const $target1 = $(".title");
const $target2 = $(".sentence");

setInterval(() => {
  $target1.addClass(CLASSNAME);
  setTimeout(() => {
    $target2.addClass(CLASSNAME);
  }, DELAY);

  setTimeout(() => {
    $target1.removeClass(CLASSNAME);
    setTimeout(() => {
      $target2.removeClass(CLASSNAME);
    }, DELAY);
  }, TIMEOUT);
}, TIMEOUT * 2);