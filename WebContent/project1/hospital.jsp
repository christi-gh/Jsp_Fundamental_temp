<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,shrink-to-fit=no">
<title>코로나선별진료소 검색_CoronaSpot</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Font Awesome CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<script type="text/javascript" src="jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c50f6c0f91e761205f077b489f5b2c52"></script>


<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c50f6c0f91e761205f077b489f5b2c52&libraries=services,clusterer,drawing"></script>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous">
	
</script>




<script type="text/javascript">
	var xhr;
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	} else {
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xhr == null) {
		alert("Error create xhr object");
	}

	//전체 출력
	$(function() {
		/*
		$('#searchAll').click(
			  
			  
		     function() {
		     	
		     	$("#content2").empty();
		     	let message = "";
		     	
		        let url = '../Team_Project/hospital.json';
		        xhr.open('GET', url, true);
		        xhr.send(null);
		        xhr.onreadystatechange = function() {
		           if (xhr.readyState == 4 && xhr.status == 200) {
		         	 
		           	
		         	
		           	message +="<div class='table-responsive-md col text-center'>";
		           	
		           	message +="<table class='table table-bordered table-striped'>";
		           	
		           	message +="<thead>";
		           	message +="<tr>";
		           	message +="<th style="+"width:8%"+">번호</th>";
		           	message +="<th style="+"width:30%"+">이름</th>";
		           	message +="<th style="+"width:47%"+">주소</th>";
		           	message +="<th style="+"width:15%"+">전화번호</th>";
						
		           	message +="</tr>";
		           	message +="</thead>";
		           	message +="<tbody>";
						var indexList = 1;
						
		              //console.log(xhr.responseText);
		              //console.log(typeof xhr.responseText);
		              const obj = JSON.parse(xhr.responseText);
		              const listArray = obj.hospital1;
		              
		              for (let i = 0; i < listArray.length; i++) {
		             	 
		             	 
		                 const listObj = listArray[i];
		                  let 기준일시 = listObj.기준일시;
		                 let 검체채취 = listObj.검체채취;
		                 let 시도 = listObj.시도;
		                 let 시군구 = listObj.시군구; 
		                 let 의료기관명 = listObj.의료기관명;
		                  let 주소 = listObj.주소;
		                 let 전화번호 = listObj.대표전화번호; 
		                 
		                  message +="<td>"+indexList+"</td>";
		                 message += "<td><a href='https://map.kakao.com/link/search/" + 의료기관명 + "' target='_blank'>"+ 의료기관명+"</a></td>";
		                 message +="<td>"+주소+"</td>";
		                 message +="<td>"+전화번호+"</td>";
		                 message += "</tr>";
							indexList +=1; 
		                 
		                  message += "<li>" + "의료기관명:<td><a href='https://map.kakao.com/link/search/" + 의료기관명 + "' target='_blank'>"+ 의료기관명+"</a></td><br>"
		                 +" 주소:" + 주소 + "</li><br>"; 
		              }
		              
		              message += "";
		              message +="</tbody>"; 
		              message +="</table>";
		              message +="</div>"; 
					$('#content2').append(message);
		              
		           }
		        }
		     });*/
		//검색출력
		$('#search')
				.click(
						function() {
							$("#content2").empty();
							let url = 'hospital.json';
							xhr.open('GET', url, true);
							xhr.send(null);
							xhr.onreadystatechange = function() {

								if (xhr.readyState == 4 && xhr.status == 200) {
									let message = "";

									message += "<div class='table-responsive-md col text-center'>";
									message += "<table class='table table-bordered table-striped'>";
									message += "<thead>";
									message += "<tr>";
									message += "<th style=" + "width:8%"
											+ ">번호</th>";
									message += "<th style=" + "width:30%"
											+ " align=" + "center" + ">이름</th>";
									message += "<th style=" + "width:47%"
											+ ">주소</th>";
									message += "<th style=" + "width:15%"
											+ ">전화번호</th>";

									message += "</tr>";
									message += "</thead>";
									message += "<tbody>";
									var indexList = 1;
									/* 		for(var i in json.stores){
												msg += "<tr>";
												
												var name = json.people1[i].거주지;
												
												console.log(name);
												
												msg +="<td>"+index+"</td>";
												msg +="<td>" +name +"</td>";
											msg += "</tr>";
												index +=1;
											} */

									//console.log(xhr.responseText);
									//console.log(typeof xhr.responseText);
									const obj = JSON.parse(xhr.responseText);
									const listArray = obj.hospital1;
									//console.log($("#searchbar").val()); searchbar값 가지고옴
									let input = document
											.getElementById('searchbar').value
									//var input = "강남구";
									console.log(input);
									var listEl = new Array();
									var index = 0;

									for (let i = 0; i < listArray.length; i++) {
										const listObj = listArray[i];
										let 시군구 = listObj.시군구;
										let 주소 = listObj.주소;
										//console.log(listObj);
										if (주소.indexOf(input) != -1) {
											listEl[index++] = listObj;
										}
									}
									for (let j = 0; j < listEl.length; j++) {

										const listObj1 = listEl[j];
										let 시군구1 = listObj1.시군구;
										let 의료기관명1 = listObj1.의료기관명;
										let 주소1 = listObj1.주소;
										let 전화번호1 = listObj1.대표전화번호;
										//console.log("j" + j);
										console.log(listObj1);
										console.log("-------------");

										message += "<td>" + indexList + "</td>";
										message += "<td><a href='https://map.kakao.com/link/search/" + 의료기관명1 + "' target='_blank'>"
												+ 의료기관명1 + "</a></td>";
										message += "<td>" + 주소1 + "</td>";
										message += "<td>" + 전화번호1 + "</td>";
										message += "</tr>";
										indexList += 1;

										/* message += "의료기관명:" + 의료기관명1 + "<br>"; */
										if (j == (listEl.length) - 1) {
											//message += "의료기관명:" + 의료기관명1 + "<br>";

										}
									}
									message += "";
									message += "</tbody>";
									message += "</table>";
									message += "</div>";
									$('#content2').append(message);

									console.log("out" + listEl.length);
								}
							}
						});
		$('#searchbar').keypress(function(e) {
			if (e.which == 13) {//Enter key pressed
				$('#search').click();//Trigger search button click event
			}
		});
	});
</script>
</head>

<body>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-12">
				<h5 class="card-title">
					<strong>코로나 선별 진료소 검색</strong>
				</h5>
				<div class="form-row d-flex align-items-center">
					<div class="form-group col-md-10">
						<input type="text" id="searchbar" name="address"
							class="form-control" placeholder="예)서울특별시 강남구 역삼동" />
					</div>
					<div class="form-group col-md-2">
						<!--  
                  <button id="searchAll" class="btn btn-info btn-lg btn-block">
                     <i class="fa fa-search" aria-hidden="true"></i>전체검색
                  </button>-->
						<button id="search" class="btn btn-info btn-lg btn-block">
							<i class="fa fa-search" aria-hidden="true"></i> 검색
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12" id="content2"></div>
		</div>
	</div>

</body>

</html>