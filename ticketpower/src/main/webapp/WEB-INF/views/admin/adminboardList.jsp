<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/board.css">
<!-- <header class="masthead">
    <div class="container px-4 px-lg-5 h-100" style="background-color:white;">
        <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">
            <div class="content" style="padding: 50px;">
             	<form id="frm" name="frm" action="" method="post">
                        <select id="key" name="key">
                            <option value="all">전체</option>
                            <option value="userId">아이디</option>
                            <option value="title">제목</option>
                        </select>
                        <input name="val" id="val" type="text" placeholder="검색어를 입력해주세요">
                        <button type="submit">검색하기</button>
                </form>

                <table class="table">
                    <thead>
                        <tr>
                            <th>글 번호</th>
                            <th>글 제목</th>
                            <th>글쓴이</th>
                            <th>작성시간</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:set var="num" value="${page.total - ((page.curPage-1) * 10) }"/>
                        <c:forEach items="${board}" var="b" varStatus="status">
                            <tr>
                                <td>${num}</td>
                                <td><a href="boardDetail.do?boardId=${b.boardId}" style="color: black; text-decoration: none;">${b.boardTitle}</a><span
                                        style="color:red;">[${b.boardReply}]</span></td>
                                <td>${b.memberId}</td>
                                <td>${b.boardDate}</td>
                                <td>${b.boardCnt}</td>
                            </tr>
                             <c:set var="num" value="${num-1 }"></c:set>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5"><a href="boardForm.do">글쓰기</a></td>
                        </tr>
                        
                    </tfoot>
                </table>
                <div class="center" align="center">
                    <div class="pagination">
                        <c:if test="${page.prev}">
                            <a href="boardList.do?page=${ page.startPage-1 }">prev</a>
                        </c:if>
                        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                            <c:choose>
                                <c:when test="${i == page.curPage}">
                                    <a href="boardList.do?page=${i}" class="active">
                                        <c:out value="${i}"></c:out>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="boardList.do?page=${i}">
                                        <c:out value="${i}"></c:out>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${page.next}">
                            <a href="boardList.do?page=${ page.endPage + 1 }">next</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header> -->
<section id="s_content">
    <div class="s_area">
    
    	<c:choose>
    		<c:when test="${author == 'ADMIN'}">
	    		<div class="s_tit aos-init aos-animate" data-aos="fade-down">
	                <h3 class="big">게시판관리자모드 </h3>
	            </div>
    		</c:when>
    		<c:otherwise>
    			<div class="s_tit aos-init aos-animate" data-aos="fade-down">
                    <h3 class="big">게시판 </h3>
                </div>
    		</c:otherwise>
    	</c:choose>
    	<!-- <div class="s_tit aos-init aos-animate" data-aos="fade-down">
                    <h3 class="big">게시판 </h3>
                </div> -->
        <div id="bo_list" style="width:100%">
            <form id="frm" name="frm" action="" method="post">
                <div class="tbl_head01 tbl_wrap">
                    <table>
                        <caption>게시판</caption>
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
                            <!-- <tr class="bo_notice even">
                                <td class="td_num2">
                                    <strong class="notice_icon">공지</strong>
                                </td>

                                <td class="td_subject" style="padding-left:0px">
                                    <div class="bo_tit">
                                        <a
                                            href="https://www.kcgu.ac.kr/bbs/board.php?bo_table=sub6_1&amp;wr_id=158">
                                            2023학년도 후기 2차 신입생 모집요강 </a>
                                        <i class="fa fa-download" aria-hidden="true"></i>
                                    </div>
                                    <div class="rep_info">
                                        <span class="name"><span class="sv_member">최고관리자</span></span>
                                        <span class="date">2023-06-13</span>
                                    </div>
                                </td>
                                <td class="td_name sv_use rep"><span class="sv_member">최고관리자</span></td>
                                <td class="td_datetime rep">2023-06-13</td>
                            </tr> -->
                        <c:set var="num" value="${page.total - ((page.curPage-1) * 10) }"/>
                        <c:forEach items="${board}" var="b" varStatus="status">
                            <tr class=" even">
                                <td class="td_num2">${num}</td>
                                <td class="td_subject" style="padding-left:0px">
                                    <div class="bo_tit">
                                        <a href="adminboardDetail.do?boardId=${b.boardId}">
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
                                <!--            <td class="td_num">214</td>-->
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