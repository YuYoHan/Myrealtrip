$(function() {
  $('input[name="dateFilter"]').daterangepicker({
    opens: 'left'
  }, function(start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
})

$(function () {
  $('button[class="btn_arrDepChange"]')
})