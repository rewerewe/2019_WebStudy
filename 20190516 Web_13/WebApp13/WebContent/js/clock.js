// css선택자를 사용하여 요소를 찾는 문구 => querySelector
const clockContainer = document.querySelector(".js-clock");
const clockTitle = clockContainer.querySelector("h1");

function getTime() {
  const date = new Date();
  const minutes = date.getMinutes();

  const hours = String(date.getHours());
  const seconds = String(date.getSeconds());
  clockTitle.innerText = `${
    hours < 10 ? `0${hours}` : hours} : ${
    minutes <10 ? `0${minutes}` : minutes} : ${
    seconds < 10 ? `0${seconds}` :seconds }`;


}


function init() {

  getTime();

  //setInterval(실행할 함수 , 주기)
  setInterval(getTime,1000);

}

init();
