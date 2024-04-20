function createItem(b_THUMBNAIL,mem_NO,b_NO,b_TITLE,b_CREATETIME,b_VIEW,b_like,b_COMMENTCOUNT) {
    var reviewListItem = $('<div></div>');
    reviewListItem.addClass('reviewListItem');

    var table = $('<table></table>');

    var tr1 = `<tr>
                            <td colSpan="4" >
                                <span id="reviewListImg">
               
                                <a href='reviewView?no=`+b_NO+`'><img src="`
        +b_THUMBNAIL
        +`"/></a>
                                </span>
                            </td>
                      </tr>`;

    var tr2=
        `<tr>
                         <td colspan="4">
                         
                         <a href='reviewView?no=`
        +b_NO+
        `' id="title">`
        +b_TITLE+
        `</a>
                         <input type="hidden" name="reviewSeq" id="reviewSeq" value="reviewSeq"/>
                         </td>
                       </tr>`


    var tr3 =`<tr>
                         <td width="60px">작성자</td>
                         <td colSpan="3" id="userId">`
        +mem_NO+
        `</td>
                     </tr>`;

    var tr4 =`<tr>
                         <td width="60px">조회수</td>
                         <td id="view">`
        +b_VIEW+
        `</td>
                         <td class="commentCount"><span id="commentCount"><img src="/review/icon/comment.png"/>`
        +b_COMMENTCOUNT+
        `</span></td>
                         <td class="like"><span id="like"><img src="/review/icon/like.png"/>`
        +b_like+
        `</span></td>
                     </tr>`
    var tr5 = `<tr>
                          <td id="date" colspan="4">`
        +b_CREATETIME+
        `</td>
                      </tr>`

    table.append(tr1).append(tr2).append(tr3).append(tr4).append(tr5);
    reviewListItem.append(table);
    $('#reviewListMain').append(reviewListItem);
}

$(function(){

    $.ajax({
        type : 'POST',
        url : 'getReviewList',
        data : { "pg" : $('#pg').val() },
        dataType : 'JSON',
        success : function(data) {
            $.each(data.list, function (idx, item){
                let thumbNailCheck =item.b_THUMBNAIL
                if(thumbNailCheck.includes("https")){

                }else{
                    thumbNailCheck = "https://kr.object.ncloudstorage.com/miniproject/"+thumbNailCheck;
                }
                createItem(thumbNailCheck,item.mem_ID,item.b_NO,item.b_TITLE,item.b_CREATETIME,item.b_VIEW,item.b_LIKE,item.b_COMMENTCOUNT)

            })

            if(data.isLogin === "true"){
                $('#reviewListWriteBtn').show();
            }else $('#reviewListWriteBtn').hide();

            $('#reviewListPage').html(data.reviewPaging.pagingHTML);


        },
        error : function(e){
            console.log(e);
        }

    })


})

function reviewPaging(pg){
    location.href="reviewList?pg="+pg;
}