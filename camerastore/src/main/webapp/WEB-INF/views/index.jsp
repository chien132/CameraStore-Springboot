<%@ page pageEncoding="utf-8"%> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <!-- <title>Đăng nhập</title> -->
  <link rel="stylesheet" type="text/css" href="resources/semantic/semantic.min.css" />
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"
    integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
  <script src="resources/semantic/semantic.min.js"></script>
  <style>
    .bg_rgba {
      background-color: rgba(150, 150, 150, 0.2);
      background-blend-mode: lighten;
      /* width: 200px; */
      /* height: 200px; */
      /* border: 1px solid black; */
    }
  </style>
</head>

<body id="homelogin">
  <jsp:include page="header.jsp" />
  <div class="spacer"></div>

  <div class="spacer"></div>

  <!-- header -->
  <div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
      <div class="ui horizontal divider">
        <h2 style="color: white;">Monthly Specials</h2>
      </div>
    </div>
  </div>

  <div class="spacer"></div>

  <!-- cards -->
  <jsp:include page="filter.jsp" />
  <div class="ui container bg_rgba">
    <div class="ui four column grid">
      <!-- <div class="row"> -->
      <div class="column">
        <div class="ui card">
          <div class="image">
            <a class="ui red right ribbon label">-10%</a>
            <img src="resources\images\product\p1\p1.jpg" />
          </div>
          <div class="content">
            <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
            <div class="description">
              Ước gì có một em
            </div>
          </div>
          <div class="extra content">
            <a class="ui teal tag label">26.000.000đ</a>
          </div>
        </div>
      </div>
      <div class="column">
        <div class="ui card">
          <div class="image">
            <a class="ui red right ribbon label">-10%</a>
            <img src="resources\images\product\p1\p1.jpg" />
          </div>
          <div class="content">
            <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
            <div class="description">
              Ước gì có một em
            </div>
          </div>
          <div class="extra content">
            <a class="ui teal tag label">21.000.000đ</a>
          </div>
        </div>
      </div>
      <div class="column">
        <div class="ui card">
          <div class="image">
            <a class="ui red right ribbon label">-10%</a>
            <img src="resources\images\product\p1\p1.jpg" />
          </div>
          <div class="content">
            <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
            <div class="description">
              Ước gì có một em
            </div>
          </div>
          <div class="extra content">
            <a class="ui teal tag label">21.000.000đ</a>
          </div>
        </div>
      </div>
      <div class="column">
        <div class="ui card">
          <div class="image">
            <a class="ui red right ribbon label">-10%</a>
            <img src="resources\images\product\p1\p1.jpg" />
          </div>
          <div class="content">
            <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
            <div class="description">
              Ước gì có một em
            </div>
          </div>
          <div class="extra content">
            <a class="ui teal tag label">21.000.000đ</a>
          </div>
        </div>
      </div>
      <div class="column">
        <div class="ui card">
          <div class="image">
            <a class="ui red right ribbon label">-10%</a>
            <img src="resources\images\product\p1\p1.jpg" />
          </div>
          <div class="content">
            <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
            <div class="description">
              Ước gì có một em
            </div>
          </div>
          <div class="extra content">
            <a class="ui teal tag label">21.000.000đ</a>
          </div>
        </div>
      </div>
      <div class="column">
        <div class="ui card">
          <div class="image">
            <a class="ui red right ribbon label">-10%</a>
            <img src="resources\images\product\p1\p1.jpg" />
          </div>
          <div class="content">
            <a class="header">Fujifilm X-T3 + 18-55mm f2.8-4</a>
            <div class="description">
              Ước gì có một em
            </div>
          </div>
          <div class="extra content">
            <a class="ui teal tag label">21.000.000đ</a>
          </div>
        </div>
      </div>
      <!-- </div> -->

    </div>
  </div>

  <div class="spacer"></div>

  <p>images from Mrprice.com website</p>
</body>

</html>