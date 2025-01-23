document.addEventListener('DOMContentLoaded', function() {
    var resultsContainer = document.getElementById('searchResults');
    var storedResults = localStorage.getItem('searchResults');
    var searchName = localStorage.getItem('searchName');

    if (storedResults) {
        var books = JSON.parse(storedResults);
        var count = books.length;
        
        var infoDiv = document.createElement('div');
        infoDiv.innerHTML = `<p class="result__searchName"><span>'${searchName}'</span>에 대한 ${count}개의 검색 결과</p>`;
        resultsContainer.appendChild(infoDiv);

        books.forEach(function(book) {
            var dateObj = new Date(book.datetime);
            var year = dateObj.getFullYear();
            var month = String(dateObj.getMonth() + 1).padStart(2, '0');  // 월은 0부터 시작하므로 +1
            var day = String(dateObj.getDate()).padStart(2, '0');

            var div = document.createElement('div');
            div.innerHTML = `
            <div class="result__detail">
            <img src="${book.thumbnail}"/>
            <div class="result__text">
            <h3 class="result__text__title">제목 : ${book.title}</h3>
            <p class="result__text__author">저자 : ${book.authors.join(", ")}</p>
            <p class="result__text__com">출판사 : ${book.publisher}</p>
            <p class="result__text__date">출간일 : ${year}-${month}-${day}</p>  <!-- 년, 월, 일만 표시 -->
            <p class="result__text__content"> ${book.contents}</p>
            <p class="result__text__price">판매 가격 : ${book.sale_price}원</p>
            </div>
            </div>
            `;
            resultsContainer.appendChild(div);
        });
    } else {
        resultsContainer.innerHTML = '<p>검색 결과가 없습니다.</p>';
    }
});

