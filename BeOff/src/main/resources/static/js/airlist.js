$(function() {
	const departregion = $("input[name='departregion']").val().trim();
	const arriveregion = $("input[name='arriveregion']").val().trim();
	let time = $("select[name='time_sel']").val().trim();
	const num_person = $("input[name='num_person']").val().trim();
	const date = $("input[name='departdate']").val().trim();
	
	loadAirList(departregion, arriveregion, time, num_person, date);
	
	
	$("select[name='time_sel']").change(function(){
		time = $("select[name='time_sel']").val().trim();
		loadAirList(departregion, arriveregion, time, num_person, date);
	})
})

// 특정 글(write_id)의 댓글 목록 읽어오기
function loadAirList(departregion, arriveregion, time, num_person, date) {
	$("input[name='time']").val(time);
	const data = {
		"departregion":departregion,
		"arriveregion":arriveregion,
		"time":time,
		"num_person":num_person,
		"date":date,
	};
	$.ajax({
		url: conPath + "airplane/list",
		type: "POST",
		data: data,
		cache: false,
		success: function(data, status, xhr) {
			if (status == "success") {
				// 서버측 에러 메시지 있는 경우
				if (data.status != "OK") {
					alert(data.status);
					return;
				}
				buildAirList(data); // 비행편 목록 렌더링
			}
		},
	});	
}

function buildAirList(result) {
	$("#air_cnt").text(result.count);
	
	const out = [];
	
	result.data.forEach(airplane => {
		let id = airplane.id;
		let depart = airplane.depart.region;
		let arrive = airplane.arrive.region;
		let time = airplane.time.time;
		let date = airplane.date;
		let name = airplane.name.name;
		let price = airplane.name.price;
		let remain = airplane.remain;
		
		let strdate = date.substring(0, 4) + "." + date.substring(4, 6) + "." + date.substring(6, 8)
        
		const row = 
			`<tr style="border:1px solid black">
		        <td><span>${name}<br>출발시각 ${time}<br>가격(1인) ${price}</span></td>
		        <td><span>${strdate}<br>남은좌석 ${remain}<br>${depart} → ${arrive}</span>
		        <br>
		        	<div width="100%" class="d-flex justify-content-end">
		        		<input type="radio" name="air_id" id="air_id${id}" value="${id}" style="width:20px; height:20px;">
		        		<label for="air_id${id}">선택</label>
		        	</div>
		        </td>
	        </tr>`;
		out.push(row);
	});
	$("#air_list").html(out.join("\n"));
}

// 댓글삭제버튼이 눌렸을때 해당 댓글 삭제하는 이벤트리스너를 삭제버튼에 등록