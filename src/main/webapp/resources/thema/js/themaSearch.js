$(document).ready(function() {
    let keyword = $('#searchTop span').text();
    let isLoading = false;
    let pg = 1;
    function themaSearchAjax() {
        $.ajax({
            type: 'POST',
            url: 'searchResult',
            data: {
                "keyword": keyword,
                "pg": pg
            },
            dataType: 'JSON',
            success: function (data) {
                const totalListSize = Object.keys(data).length;
                if(totalListSize === 0){
                    $('#observer').text("검색 결과가 더 이상 없습니다.")
                }
                $.each(data, function (index, item) {

                    divForm(item.t_THUMB_IMAGE,
                        item.t_CONTENTNAME,
                        item.t_INFORMATION,
                        item.t_ADDRESS,
                        item.t_SIDO,
                        item.t_CAT1,
                        item.t_CAT2,
                        item.t_CAT3,
                        item.t_CONTENTNO,
                        item.t_CONTENTTYPEID);

                    isLoading = false;
                    pg += 1; // 페이지 번호 증가
                });
            },
            error: function (e) {
                console.log(e)
                isLoading = false;
            }

        })
    }


const observer = new IntersectionObserver(function(entries) {
    // 타겟이 화면에 보일 때 fetchData 호출
    if (entries[0].isIntersecting) {
        themaSearchAjax();
    }
});

observer.observe(document.getElementById('observer')); // 타겟 요소 관찰 시작
})
function divForm(imageUrl,title,text,address,sido,cat1,cat2,cat3,contentNo,contentTypeId){
    let boxContent = $('<div></div>').addClass("boxContent");

    let titleA = $('<a></a>').attr("href","/thema/themaDetailPage?contentNo="+contentNo+"&typeId="+contentTypeId);

    let themaBoard = $('<div></div>').addClass("themaBoard");

    let themaBoardImg = $('<div></div>').addClass("themaBoardImg");
    let img = $('<img/>').attr("src",imageUrl);
    themaBoardImg.append(img);

    let verticalContainer = $('<div></div>').addClass("vertical-container");

    let themaTitle = $('<div></div>').addClass("themaTitle");
    themaTitle.html(title);

    let themaText = $('<div></div>').addClass("themaText");
    themaText.html(text);

    let themaAddress = $('<div></div>').addClass("themaAddress");
    themaAddress.text(address);

    let themaHashTag = $('<div></div>').attr("id" ,"themaHashTags");

    const hashArr = [sido,cat1,cat2,cat3];

    $.getJSON('/thema/json/data.json', function(data) {
        const hashArr = [sido,cat1,cat2,cat3];

        for(let i=0; i<4 ; i++){
            let nameValue = "";
            data.contentTypeId.forEach(function(type) {
                type.cat1.forEach(function(cat1) {
                    if(cat1.code === hashArr[i]) {
                        nameValue = cat1.name;
                    }
                    cat1.cat2.forEach(function(cat2) {
                        if(cat2.code === hashArr[i]) {
                            nameValue = cat2.name;
                        }
                        cat2.cat3.forEach(function(cat3) {
                            if(cat3.code === hashArr[i]) {
                                nameValue = cat3.name;
                            }
                        });
                    });
                });
            });

            const hashTagSpan = $('<button></button>').addClass("themaHashTag");
            hashTagSpan.text("#"+ (nameValue || hashArr[i]));
            themaHashTag.append(hashTagSpan);
        }
    });

    verticalContainer.append(themaTitle).append(`<br>`)
        .append(themaText).append(`<br>`)
        .append(themaAddress).append(`<br>`)
        .append(themaHashTag);

    themaBoard.append(themaBoardImg).append(verticalContainer);

    titleA.append(themaBoard);

    boxContent.append(titleA);

    $('#themaBoardContent').append(boxContent);
}
// function addHashTag(sido,cat1,cat2,cat3){
//
// }