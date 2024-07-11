const myinfoContainer = document.getElementsByClassName('myinfoContainer');
const myInfo = () => {
    // 첫 번째 요소의 클래스 리스트에 'active' 클래스가 이미 존재한다면 제거하고, 없다면 추가
    myinfoContainer[0].classList.toggle('active');
}