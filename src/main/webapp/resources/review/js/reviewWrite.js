//reviewWrite

//reviewContent  summernote start
$(document).ready(function () {
    $('#summernote').summernote({
        placeholder: '내용을 작성하세요',
        height: 1000,
        maxheight: 1000,
        minheight: 1000,
        lang: "ko-KR",
        toolbar: [
            ['style', ['style']], // 글자 스타일 설정 옵션
            ['fontsize', ['fontsize']], // 글꼴 크기 설정 옵션
            ['font', ['bold', 'underline', 'clear']], // 글자 굵게, 밑줄, 포맷 제거 옵션
            ['color', ['color']], // 글자 색상 설정 옵션
            ['para', ['ul', 'ol', 'paragraph']], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
            ['insert', ['picture']], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
            ['view', ['fullscreen', 'help']], // 코드 보기, 전체 화면, 도움말 옵션
        ],

        fontSizes: [
            '8', '9', '10', '11', '12', '14', '16', '18',
            '20', '22', '24', '28', '30', '36', '50', '72',
        ], // 글꼴 크기 옵션

        styleTags: [
            'p',  // 일반 문단 스타일 옵션
            {
                title: 'Blockquote',
                tag: 'blockquote',
                className: 'blockquote',
                value: 'blockquote',
            },  // 인용구 스타일 옵션
            'pre',  // 코드 단락 스타일 옵션
            {
                title: 'code_light',
                tag: 'pre',
                className: 'code_light',
                value: 'pre',
            },  // 밝은 코드 스타일 옵션
            {
                title: 'code_dark',
                tag: 'pre',
                className: 'code_dark',
                value: 'pre',
            },  // 어두운 코드 스타일 옵션
            'h1', 'h2', 'h3', 'h4', 'h5', 'h6'  // 제목 스타일 옵션
        ]
        ,callbacks : {
            onImageUpload : function(files, editor, welEditable) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i],
                        this);
                }

            }
        }
    });
});
//-End summernote config


function uploadSummernoteImageFile(file, el) {
    var data = new FormData();
    data.append("file", file);

    $.ajax({
        data : data,
        type : "POST",
        url : "uploadSummernoteImageFile",
        contentType : false,
        enctype : 'multipart/form-data',
        processData : false,
        success : function(data) {
            const url = "https://kr.object.ncloudstorage.com/miniproject/"+data;
            $(el).summernote('insertImage',url);
        }
    });
}




$('#reviewWriteBtn').click(function(){

    var title = $('#title').val();
    var content = $('#summernote').val();


    if(title === ""){
        alert("제목을 입력하세요");
        $('#title').focus();

    }else if(content === ""){
        alert("내용을 입력하세요");
        $('#content').focus();
    }else{

        const imgElement = document.querySelectorAll('.note-editor .note-editable img');
        const imgArray = Array.from(imgElement).map(img => img.src);

        $.ajax({
            type:'POST',
            url : 'reviewImageUpload',
            data : {
                "imgArray" : JSON.stringify(imgArray)
            },
            dataType:'text',
            success : function(data){
                alert("이미지 저장 성공");
                $("#thumbNail").val(data);
                console.log(data);

                $.ajax({
                    type:'POST',
                    url : 'reviewWrite',
                    data : $('#reviewWriteForm').serialize(),
                    dataType:'text',
                    success : function(data){

                        alert(data);

                        // location.href='reviewList?pg=1';

                    },
                    error:function(e){
                        console.log(e);
                    }
                })
            },
            error:function(e){
                console.log(e);
            }
        });




    }
})