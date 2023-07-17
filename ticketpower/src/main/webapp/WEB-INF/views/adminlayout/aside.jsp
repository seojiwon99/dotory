<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="adminMainPage.do" class="brand-link">
      <img src="images/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
        style="opacity: .8">
      <span class="brand-text font-weight-light">AdminPage</span>
    </a>


    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="images/user2.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">관리자</a>
        </div>

      </div>



      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

          <li class="nav-item">
            <a href="adminMemberPage.do" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>회원관리<i class="fas fa-angle-left right"></i></p>
            </a>
          </li>
          <li class="nav-item">
            <a href="adminMoviePage.do" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                영화관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="adminboardList.do" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                게시판관리
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
          </li>
        </ul>
      </nav>

    </div>

  </aside>