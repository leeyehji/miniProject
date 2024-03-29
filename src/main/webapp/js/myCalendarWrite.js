const startCalendar = document.getElementById('startCalendar');
const startDate = document.getElementById('startDate');

startCalendar.addEventListener('click', function() {
    const picker = datepicker(startDate, {
        // 달력 설정 옵션
        onSelect: (instance, date) => {
            // 날짜 선택 시 실행할 동작
            startDate.value = date.toISOString().split('T')[0]; // YYYY-MM-DD 형식으로 날짜 설정
        }
    });
});
