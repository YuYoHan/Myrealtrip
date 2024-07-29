function enterkey() {
    if (window.event.keyCode == 13) {
        console.log("엔터!");

        // 검색 키워드를 가져옴
        let keyword = document.getElementById("searchInput").value.trim();

        if (keyword !== "") {
            // 검색 결과 페이지로 리디렉션
            window.location.href = "/search/result.sc?word=" + encodeURIComponent(keyword);
        }
    }
}