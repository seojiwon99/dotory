<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/board.css">
<section id="s_content">
    <div class="s_area">
	    <div class="s_tit aos-init aos-animate" data-aos="fade-down">
	        <h3 class="big">좋아요 목록</h3>
	    </div>
    <div id="bo_list" style="width:100%">
            <form id="frm" name="frm" action="" method="post">
                <div class="tbl_head01 tbl_wrap">
                    <table>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col" class="rep">글쓴이</th>
                                <th scope="col" class="rep">날짜</th>
                                <th scope="col">조회수</th>
                            </tr>
                        </thead>
                        <tbody>                            
                        <c:set var="num" value="${page.total - ((page.curPage-1) * 10) }"/> 

                        
                        <c:forEach items="${good}" var="b" varStatus="status">
                            <tr class=" even">  
                                <td class="td_num2">${num}</td>
                                <td class="td_subject" style="padding-left:0px">
                                    <div class="bo_tit">
                                        <a href="boardDetail.do?boardId=${b.boardId}">
                                            ${b.boardTitle}
                                        </a>
                                        <span style="color:red;">[${b.boardReply}]</span>
                                    </div>
                                    <div class="rep_info">
                                        <span class="name"><span class="sv_member">${b.memberId}</span></span>
                                        <span class="date">${b.boardDate}</span>
                                    </div>
                                </td>
                                <td class="td_name sv_use rep"><span class="sv_member">${b.memberId}</span></td>                               
                                <td class="td_datetime rep">${b.boardDate}</td>
                                <td class="td_num2">${b.boardCnt}</td>
                            </tr>
                            <c:set var="num" value="${num-1 }"></c:set>
                           </c:forEach>
                           
                        </tbody>
                    </table>
                </div>
                <nav class="pg_wrap">
                    <c:if test="${page.prev}">
                            <a href="boardList.do?page=${ page.startPage-1 }">
                                <span class="pg"><span class="sound_only">열린</span>
                            </a>
                        </c:if>
                        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                            <c:choose>
                                <c:when test="${i == page.curPage}">
                                    <a href="boardList.do?page=${i}" >
                                        <strong class="pg_current"><c:out value="${i}"></c:out></strong><span class="sound_only"></span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="boardList.do?page=${i}" class="pg_page"><c:out value="${i}"></c:out><span class="sound_only">페이지</span></a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                         <c:if test="${page.next}">
                            <a href="boardList.do?page=${ page.endPage + 1 }" class="pg_page pg_end">맨끝</a>
                        </c:if>
                    </span>
                </nav>
            </form>
            <fieldset class="bo_sch">
                <h3>검색</h3>
                <form id="frm" name="frm" action="" method="post">
                    <input type="hidden" name="bo_table" value="sub6_1">
                    <input type="hidden" name="sca" value="">
                    <input type="hidden" name="sop" value="and">
                    <label for="sfl" class="sound_only">검색대상</label>
                    <select name="key" id="key">
                        <option value="all">전체</option>
                        <option value="userId">아이디</option>
                        <option value="title">제목</option>
                    </select>
                    <div class="sch_bar">
                        <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                        <input type="text" name="val" value="" required="" id="val" class="sch_input" size="25"
                            maxlength="20" placeholder=" 검색어를 입력해주세요">
                        <button type="submit" value="검색" class="sch_btn">
                            <i class="fa fa-search" aria-hidden="true"></i><span class="sound_only">검색</span>
                        </button>
                    </div>
                </form>
            </fieldset>
        </div>
    </div>
</section>

<script type="text/javascript">
    $('form[name="frm"]').on('submit',boardSearch);

    function boardSearch(e){
        e.preventDefault();
        let key = $('#key').val();
        let val = $('#val').val();
        console.log(key, val);
        if(val == null || val == ''){
            alert("검색어를 입력해주세요")
        }else{
            $.ajax({
                url:"boardSearch.do?key=" + key +"&val=" + val,
                method:"POST",
                // dataType:JSON,
                headers:{
                    'Content-type' : 'application/x-www-form-urlencoded'
                },
                success:function(result){
                    $('tbody').children().remove();
                    JSON.parse(result).forEach(item =>{
                        console.log(item.boardId);
                        let str = `
                            <tr>
                                <td>\${item.boardId}</td>
                                <td><a href="boardDetail.do?boardId=\${item.boardId}" style="color: black; text-decoration: none;">\${item.boardTitle}</a><span
                                        style="color:red;">[\${item.boardReply}]</span></td>
                                <td>\${item.memberId}</td>
                                <td>\${item.boardDate}</td>
                                <td>\${item.boardCnt}</td>
                            </tr>
                        `;

                        $('tbody').append(str);
                        
                    })
                    
                },
                error:function(err){
                    alert("검색실패");
                    console.log(err);
                }
            })
        }
    }
    
</script>