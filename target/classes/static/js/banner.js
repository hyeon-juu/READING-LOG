const slides = [];
let currentIndex = 0;

function changeSlide() {
    if (slides.length > 0) {
        currentIndex = (currentIndex + 1) % slides.length;
        document.getElementById('banner__img').src = slides[currentIndex].bannerImg;
        document.getElementById('banner__text').innerText = slides[currentIndex].bannerTitle;
    }
}

function fetchSlides() {
    $.ajax({
        url: 'banners',
        method: 'GET',
        success: function(data) {
            data.forEach(banner => {
                slides.push({
                    bannerImg: banner.bannerImg,
                    bannerTitle: banner.bannerTitle
                });
            });
            changeSlide(); 
            setInterval(changeSlide, 3000);
        },
        error: function(error) {
            console.error('Error fetching slides:', error);
        }
    });
}





//modal
 function showModal() {
    document.getElementById("modal").style.display = "block";
  }
  
  
//popup

        // 쿠키 설정 함수
        function setCookie(name, value, days) {
            const date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            const expires = "expires=" + date.toUTCString();
            document.cookie = name + "=" + value + ";" + expires + ";path=/";
        }

        // 쿠키 가져오기 함수
        function getCookie(name) {
            const nameEQ = name + "=";
            const ca = document.cookie.split(';');
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }

        // 팝업 닫기 함수
        function closePopup() {
            document.getElementById("myPopup").style.display = "none";
        }

        // 팝업 하루 동안 안 보기 함수
        function hidePopupForToday() {
            setCookie("hidePopup", "true", 1);
            closePopup();
        }

        // 팝업 표시/숨김 함수
        function handlePopup() {
            const hidePopup = getCookie("hidePopup");
            if (hidePopup !== "true") {
                document.getElementById("myPopup").style.display = "block";
                }
        }

        // 페이지 로드 시 실행되는 함수
        window.onload = function() {
            fetchSlides();
            showModal();
            handlePopup();
        };