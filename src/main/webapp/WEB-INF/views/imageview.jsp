<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang='en'>
<head>
  <meta charset="UTF-8">
  <title>파일업로드</title>
  <%--인쇄 스크립트--%>
  <script>
    var initBodyHtml;  //변수선언

    function printPage(){  //인쇄메소드
      window.print();
    }
    function  beforePrint(){  //인쇄전에 처리할 메소드
      initBodyHtml = document.body.innerHTML;   //본문내용
      document.body.innerHTML = document.getElementById("print").innerHTML;
      //id가 print인 영역을 본문으로 재지정
    }
    function afterPrint(){  //인쇄후에 처리할 메소드
      document.body.innerHTML = initBodyHtml;  //원래 본문내용으로 다시 본문을 재지정
    }
    window.onbeforeprint = beforePrint;  //프린트 전 설정
    window.onafterprint = afterPrint;    //프린트 후 설정
  </script>
</head>
<body>
직접적으로 이미지를 지정하고, 변경 불가능, 회사로고 등 웹상에서 변경없는 이미지 사용 시<br>
<div id="print">  <%--실질적으로 인쇄될 영역--%>
  <img src="/images/a.jpg" width="300" height="300" alt="이미지가 없습니다."/><br>
</div>
<img src="/images/b.jpg" width="300" height="300"/><br>
상품 등 데이터별로 이미지를 변경해서 사용할 경우<br>
<img src="/images/${file}" width="300" height="300" alt="파일이 없습니다."/><br>
<button type="button" onclick="printPage()">인쇄</button>
</body>
</html>