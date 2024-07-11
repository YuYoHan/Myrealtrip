const searchContainer = document.getElementById('searchContainer');
const searchInput = document.getElementById('searchInput');
// 검색 입력창이 포커스를 받으면(focus 이벤트 발생 시) readyInput() 함수가 호출됩니다.
searchInput.onfocus = () => {
    readyInput();
}
// 포커스를 잃으면 동작
searchInput.onblur = () => {
    unReadyInput();
}
// searchInput 요소의 클래스를 조작하여 스타일을 변경하고, placeholder를 제거합니다.
// 이로써 입력창이 준비 상태로 변경
const readyInput = () => {
    searchInput.classList.remove('searchInput');
    searchContainer.classList.add('focusContainer');
    searchInput.classList.add('focusInput');
    searchInput.removeAttribute("placeholder");
}
// searchInput 요소의 클래스를 원래대로 복원하고, 다시 placeholder를 설정
const unReadyInput = () => {
    searchInput.classList.remove('focusInput');
    searchContainer.classList.remove('focusContainer');
    searchInput.classList.add('searchInput');
    searchInput.setAttribute("placeholder", "도시나 상품을 검색해보세요");
}