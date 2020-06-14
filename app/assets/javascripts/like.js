// $(function() {
//   $('.like-btn').on('click', function(e) {
//     // e.preventDefault();
//   })
// })

$(function() {
  $(document).on('click', ".like-btn", function(e) {
    if ($('#' + e.detail[0]).hasClass('.like-icon-off')) {
      $('#' + e.detail[0]).removeClass('.like-icon-off').addClass('like-icon-on');
    } else {
  $('#' + e.detail[0]).removeClass('.like-icon-on').addClass('like-icon-off');
    }
  })
})