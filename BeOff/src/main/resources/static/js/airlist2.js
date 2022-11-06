$(function() {
	const departregion = $("input[name='departregion2']").val().trim();
	const arriveregion = $("input[name='arriveregion2']").val().trim();
	let time = $("select[name='time_sel2']").val().trim();
	const num_person = $("input[name='num_person2']").val().trim();
	const date = $("input[name='departdate2']").val().trim();
	
	loadAirList2(departregion, arriveregion, time, num_person, date);
	
	
	$("select[name='time_sel2']").change(function(){
		time = $("select[name='time_sel2']").val().trim();
		loadAirList2(departregion, arriveregion, time, num_person, date);
	})
})

// 특정 글(write_id)의 댓글 목록 읽어오기
function loadAirList2(departregion, arriveregion, time, num_person, date) {
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
				buildAirList2(data); // 비행편 목록 렌더링
			}
		},
	});	
}

function buildAirList2(result) {
	$("#air_cnt2").text(result.count);
	
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
			`<tr style="border:1px solid black; font-size:1.5rem; background-color:	#e0ffff">
		        <td><span>&nbsp;${name}<br>&nbsp;출발시각 ${time}<br>&nbsp;가격(1인) ${price}<br>&nbsp;</span></td>
		        <td><span>&nbsp;${strdate}<br>&nbsp;남은좌석 ${remain}<br>&nbsp;${depart} → ${arrive}</span>
		        <br>
		        	<div width="100%" class="d-flex justify-content-end">
		        		<input type="radio" name="air_id2" id="air_id2${id}" value="${id}" style="width:20px; height:20px;">
		        		<label for="air_id2${id}">선택</label>
		        	</div>
		        </td>
	        </tr>
	        <tr><td></td><td></td><td></td></tr>
	        `;
		out.push(row);
	});
	$("#air_list2").html(out.join("\n"));
}

// 댓글삭제버튼이 눌렸을때 해당 댓글 삭제하는 이벤트리스너를 삭제버튼에 등록