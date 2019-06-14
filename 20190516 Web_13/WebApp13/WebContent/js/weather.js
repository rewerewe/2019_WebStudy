const weather = document.querySelector(".js-weather");
const img = (document.querySelector(".weather")).querySelector(".w-img");
const w_temp = (document.querySelector(".weather")).querySelector(".w-temp");
const w_city = (document.querySelector(".weather")).querySelector(".w-city");



const API_Key = "6da9213aaa80dc8912c5a23bb29e8388";
const COORDS = 'coords';

function getWeather(lat, lng) {
  //fetch : 네트워크로부터 리소스를 가져오는 동작을 간결하게 표
  // promise 는 비동기 처리에 활용하는 객체이기때문에 then을 이용해 작업완료 후 처리되는 것을 기재
  fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${API_Key}&units=metric`)
    .then(function(response) {
      //response에 담겨있는 json을 json형태로 다시 반납
      //  console.log(response);}
      return response.json();
    }).then(function(json) {
      // console.log(json);
      const temperature = json.main.temp;
      const place = json.name;
      const icon = json.weather[0].icon;
      const status = json.weather[0].description;
      const icon_url = `http://openweathermap.org/img/w/${icon}.png`;
      //  alert(temperature);
      // weather.innerText = `${temperature} @ ${place}`;
      w_temp.innerText = `${temperature}°C ${status}`;
      w_city.innerText = `${place}`;
      img.innerHTML = "<img src=\"" + `${icon_url}` + "\">";
      (document.querySelector(".weather")).querySelector(".w-title").innerHTML = "오늘의 날씨";

    }).catch(function(err) {
      // 에러발생시 에러메세지
      alert(err);
    });
}

function saveCoords(coordsObj) {
  //Object를 String으로 바꿔주기 위해 json.stringify 사용
  // json.stringify : 자바스크립트의 값을 json문자열로 변환
  // json : 브라우저와 서버사이에 오고가는 데이터의 형식

  localStorage.setItem(COORDS, JSON.stringify(coordsObj));
  //localStorage에 저장
}

function handleGeoSucess(position) {
  // coords.latitude  : 고도
  // coords.longitude  : 경도

  const latitude = position.coords.latitude;
  const longitude = position.coords.longitude;

  //객체(object) 생성
  const coordsObj = {
    latitude: latitude,
    longitude: longitude
  };
  saveCoords(coordsObj);
  getWeather(latitude, longitude);
}

function handleGeoError() {
  console.log('Cant access');
}

function askForCoords() {
  // geolocation
  // 위치기반 애플리케이션에서 지도와 길찾기 또는 사용자의 현재위치와 관련된 정보 표시
  navigator.geolocation.getCurrentPosition(handleGeoSucess, handleGeoError);
  // navigator.geolocation.getCurrentPosition(success(), error()): 현재위치를 요청
  // success() : 성공시 호출하는 함수
  // error() : 에러시 호출하는 함수
}

function loadCoords() {
  // localStorage : html5 에서 web에 local저장소에 값을 저장할 수 있는 기능
	se
  const loadedCoordes = localStorage.getItem(COORDS);
  if (loadedCoordes == null) {
    askForCoords();
  } else {
    //getWeather
    const parseCoords = JSON.parse(loadedCoordes);
    //  console.log(parseCoords);
    getWeather(parseCoords.latitude, parseCoords.longitude);

  }
}

function init() {
  loadCoords();
}

init();
