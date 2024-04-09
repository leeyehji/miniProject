function createItem(b_THUMBNAIL,mem_NO,b_NO,b_TITLE,b_CREATETIME,b_VIEW,b_like,b_COMMENTCOUNT) {
    var reviewListItem = $('<div></div>');
    reviewListItem.addClass('reviewListItem');

    var table = $('<table></table>');

    var tr1 = `<tr>
                            <td colSpan="4">
                                <span id="reviewListImg">
                                    <img src="`
                                    +b_THUMBNAIL
                                    +`"/>
                                </span>
                            </td>
                      </tr>`;

    var tr2=
                      `<tr>
                         <td colspan="4">
                         <hr>
                         <a href='reviewView?no=`
                         +b_NO+
                        `' id="title">`
                         +b_TITLE+
                         `</a>
                         <input type="hidden" name="reviewSeq" id="reviewSeq" value="reviewSeq"/>
                         </td>
                       </tr>`


    var tr3 =`<tr>
                         <td>작성자</td>
                         <td colSpan="3" id="userId">`
                         +mem_NO+
                          `</td>
                     </tr>`;

    var tr4 =`<tr>
                         <td>조회수</td>
                         <td id="view">`
                         +b_VIEW+
                        `</td>
                         <td><img src="/review/icon/comment.png"/><span id="commentCount">`
                         +b_COMMENTCOUNT+
                         `</span></td>
                         <td><img src="/review/icon/like.png"/><span id="like">`
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
        dataType : 'JSON',
        success : function(data) {
            $.each(data, function (idx, item){
                console.log(JSON.stringify(item))
                createItem(item.b_THUMBNAIL,item.mem_NO,item.b_NO,item.b_TITLE,item.b_CREATETIME,item.b_VIEW,item.b_like,item.b_COMMENTCOUNT)
            })

        },
        error : function(e){
            console.log(e);
        }

    })


})

