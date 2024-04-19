$(function(){
    $.ajax({
      type : "POST",
      url : "/review/getReviewUpdate",
      data : {"no":$('#B_NO').val()},
        dataType:"JSON",
        success : function(data){
            console.log(data)
            $('#title').val(data.B_TITLE);
            $('#summernote').summernote('code', data.B_CONTENT);
        },
        error:function(e){
          console.log(e);
        }

    })
})
$('#reviewResetBtn').click(function(){
    location.reload();
})
