function searchBooks() {
    var searchInput = document.getElementById('searchInput').value;
    localStorage.setItem('searchName', searchInput);
    $.ajax({
        method: 'GET',
        url: 'https://dapi.kakao.com/v3/search/book',
        data: { query: searchInput },
        headers: { Authorization: "KakaoAK 70a954b5d0391230abe4035812acf644" }
    })
    .done(function (response) {
        localStorage.setItem('searchResults', JSON.stringify(response.documents));
        window.location.href = 'search';  // 결과 페이지
    })
    .fail(function (error) {
        console.error('책 검색에 실패했습니다:', error);
    });
}

function handleSearch(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        searchBooks();
    }
}
