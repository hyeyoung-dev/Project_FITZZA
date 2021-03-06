<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/css/review.css">
<script>
 $(function(){
	 $("#reviewFrm").submit(function(){
		 if($("#title").val()==''){
			 alert("제목을 입력해주세요");
			 $("#reviewFrm").focus();
			 return false;
		 }
		 
		 if($("#content").val()==''){
			 alert("본문을 입력해주세요");
			 $("#content").focus();
			 return false;
		 }
		 
		 if($("#upload_file01").val()==''){
			alert("이미지를 1개 이상 첨부하세요");
			$("#upload_file01").focus();
			return false;
		}
	});
});
</script>

</head>
<body>
<div id="review-wrapper"><!--  전체 틀  -->
<a href="/board/review/reviewList"><h1 style="text-align: center;">구매 후기</h1></a>
	<form method="post" action="/board/review/reviewEditOk" id="reviewFrm" enctype="multipart/form-data">
  	  	<input type="hidden" name="board_num" value="${vo.board_num}"/>
  	  	<ul>
			<li><input type="hidden" name="type_num" value="4"/></li> <!-- 게시판 타입num -->
			<li><input type="text" name="title" id="title" class="input01" placeholder="제목을 입력해주세요" value='${vo.title}'/></li>
			<li><div class="img1">
                    대표이미지<br/>
                        <div>
                            <img style="width: 500px;" id="img_section" src="/upload/${vo.file1}"><br/>
                            <input type="text" id="file_route01"  disabled="disabled" value="${vo.file1}" >
                            <label for="upload_file01">업로드</label>
                            <input type="file" id="upload_file01" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        </div>
                </div>
            </li>
            <li>상품 종류 &emsp;  
            	<select id="gender_type" name="gender_type">
					<option value="W" name="W" <c:if test="${gender_type} == 'W'">selected</c:if>>여성의류</option>
					<option value="M" name="M" <c:if test="${gender_type} == 'M'">selected</c:if>>남성의류</option>
					<option value="U" name="U" <c:if test="${gender_type} == 'U'">selected</c:if>>남여공용</option>
				</select>
			</li>
			<li><textarea name="content" id="content" rows="30" cols="100" placeholder="본문입력하세요">${vo.content}</textarea> </li>
			<li><div class="img2">
                      상세이미지<br/>
                        <div class="img2_up">
                            <c:if test="${vo.file2!=null && vo.file2 !=''}">
	                            <img id="img_section2" src="/upload/${vo.file2}"><br/>
	                            <input type="text" id="file_route02"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file02">업로드</label>
	                            <input type="file" id="upload_file02" value="${vo.file2}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                            <c:if test="${vo.file2==null || vo.file2 ==''}">
	                            <img id="img_section2" src="/img/이미지 없음.png"><br/>
	                            <input type="text" id="file_route02"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file02">업로드</label>
	                            <input type="file" id="upload_file02" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                        </div>
                        <div class="img2_up">
                        	<c:if test="${vo.file3!=null && vo.file3!=''}">
	                            <img id="img_section3" src="/upload/${vo.file3}"><br/>
	                            <input type="text" id="file_route03"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file03">업로드</label>
	                            <input type="file" id="upload_file03" value="${vo.file3}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                            <c:if test="${vo.file3==null || vo.file3 ==''}">
	                            <img id="img_section3" src="/img/이미지 없음.png"><br/>  
	                            <input type="text" id="file_route03"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file03">업로드</label>
	                            <input type="file" id="upload_file03" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        	</c:if>
                        </div>
                        <div class="img2_up">
	                        <c:if test="${vo.file4!=null && vo.file4 !=''}">
	                            <img id="img_section4" src="/upload/${vo.file4}"><br/>
	                            <input type="text" id="file_route04"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file04">업로드</label>
	                            <input type="file" id="upload_file04" value="${vo.file4}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
	                        </c:if>
                            <c:if test="${vo.file4==null || vo.file4 ==''}">
	                            <img id="img_section4" src="/img/이미지 없음.png"><br/>
	                            <input type="text" id="file_route04"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file04">업로드</label>
                            	<input type="file" id="upload_file04" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                        </div>
                        <div class="img2_up">
	                        <c:if test="${vo.file5!=null && vo.file5 !=''}">
	                            <img id="img_section5" src="/upload/${vo.file5}"><br/>
	                            <input type="text" id="file_route05"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file05">업로드</label>
	                            <input type="file" id="upload_file05" value="${vo.file5}" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                            </c:if>
                            <c:if test="${vo.file5==null || vo.file5 ==''}">
	                            <img id="img_section5" src="/img/이미지 없음.png"><br/>			
	                            <input type="text" id="file_route05"  disabled="disabled" value="파일 선택" >
	                            <label for="upload_file05">업로드</label>
	                            <input type="file" id="upload_file05" name="filename" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);"><br/>
                        	</c:if>
                        </div>
				</div></li>
				<li style="height:200px;"><input type='submit' value='등록' id="reviewsubmit" class="button01"/></li>
		</ul>
	</form>
</div>
<script>
	const reader = new FileReader();
	reader.onload = (readerEvent) => {
		document.querySelector("#img_section").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file01").addEventListener("change", (changeEvent) => {
		const imgFile = changeEvent.target.files[0];
		reader.readAsDataURL(imgFile);
		const fileName = document.getElementById("file_route01");
		fileName.value = imgFile.name;
	});
	
	const reader2 = new FileReader();
	reader2.onload = (readerEvent) => {
		document.querySelector("#img_section2").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file02").addEventListener("change", (changeEvent) => {
		const imgFile2 = changeEvent.target.files[0];
		reader2.readAsDataURL(imgFile2);
		const fileName2 = document.getElementById("file_route02");
		fileName2.value = imgFile2.name;
	});
	
	const reader3 = new FileReader();
	reader3.onload = (readerEvent) => {
		document.querySelector("#img_section3").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file03").addEventListener("change", (changeEvent) => {
		const imgFile3 = changeEvent.target.files[0];
		reader3.readAsDataURL(imgFile3);
		const fileName3 = document.getElementById("file_route03");
		fileName3.value = imgFile3.name;
	});
	
	const reader4 = new FileReader();
	reader4.onload = (readerEvent) => {
		document.querySelector("#img_section4").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file04").addEventListener("change", (changeEvent) => {
		const imgFile4 = changeEvent.target.files[0];
		reader4.readAsDataURL(imgFile4);
		const fileName4 = document.getElementById("file_route04");
		fileName4.value = imgFile4.name;
	});
	
	const reader5 = new FileReader();
	reader5.onload = (readerEvent) => {
		document.querySelector("#img_section5").setAttribute("src", readerEvent.target.result);
	};
	document.querySelector("#upload_file05").addEventListener("change", (changeEvent) => {
		const imgFile5 = changeEvent.target.files[0];
		reader5.readAsDataURL(imgFile5);
		const fileName5 = document.getElementById("file_route05");
		fileName5.value = imgFile5.name;
	});
</script>
		<!-- particles.js container -->
    <div id="particles-js"></div>
            
    <!-- scripts -->
    <script src="/js/particles.js"></script>
    <script>
    particlesJS('particles-js',
    		  
    		  {
    		    "particles": {
    		      "number": {
    		        "value": 100,
    		        "density": {
    		          "enable": true,
    		          "value_area": 1000
    		        }
    		      },
    		      "color": {
    		        "value": "#276968"
    		      },
    		      "shape": {
    		        "type": "star",
    		        "stroke": {
    		          "width": 0,
    		          "color": "#000000"
    		        },
    		        "polygon": {
    		          "nb_sides": 5
    		        },
    		        "image": {
    		          "src": "img/github.svg",
    		          "width": 50,
    		          "height": 50
    		        }
    		      },
    		      "opacity": {
    		        "value": 0.5,
    		        "random": false,
    		        "anim": {
    		          "enable": false,
    		          "speed": 3,
    		          "opacity_min": 0.1,
    		          "sync": false
    		        }
    		      },
    		      "size": {
    		        "value": 4,
    		        "random": true,
    		        "anim": {
    		          "enable": false,
    		          "speed": 2,
    		          "size_min": 0.1,
    		          "sync": false
    		        }
    		      },
    		      "line_linked": {
    		        "enable": true,
    		        "distance": 150,
    		        "color": "#54bab9",
    		        "opacity": 0.4,
    		        "width": 1
    		      },
    		      "move": {
    		        "enable": true,
    		        "speed": 1,
    		        "direction": "none",
    		        "random": false,
    		        "straight": false,
    		        "out_mode": "out",
    		        "attract": {
    		          "enable": false,
    		          "rotateX": 600,
    		          "rotateY": 1200
    		        }
    		      }
    		    },
    		    "interactivity": {
    		      "detect_on": "canvas",
    		      "events": {
    		        "onhover": {
    		          "enable": true,
    		          "mode": "repulse"
    		        },
    		        "onclick": {
    		          "enable": true,
    		          "mode": "push"
    		        },
    		        "resize": true
    		      },
    		      "modes": {
    		        "grab": {
    		          "distance": 400,
    		          "line_linked": {
    		            "opacity": 1
    		          }
    		        },
    		        "bubble": {
    		          "distance": 400,
    		          "size": 40,
    		          "duration": 3,
    		          "opacity": 8,
    		          "speed": 3
    		        },
    		        "repulse": {
    		          "distance": 200
    		        },
    		        "push": {
    		          "particles_nb": 4
    		        },
    		        "remove": {
    		          "particles_nb": 2
    		        }
    		      }
    		    },
    		    "retina_detect": true,
    		    "config_demo": {
    		      "hide_card": false,
    		      "background_color": "#b61924",
    		      "background_image": "",
    		      "background_position": "50% 50%",
    		      "background_repeat": "no-repeat",
    		      "background_size": "cover"
    		    }
    		  }

    		);
    </script>
</body>							