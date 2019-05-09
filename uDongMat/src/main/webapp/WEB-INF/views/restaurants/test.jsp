<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="cont">
		<div class="_frequency_select  selectbox13">
			<select class="selectbox-source" style="">
				<option value="everyWeek">매주</option>
				<option value="firstWeek">매월 첫째주</option>
				<option value="secondWeek">매월 둘째주</option>
				<option value="thirdWeek">매월 셋째주</option>
				<option value="fourthWeek">매월 넷째주</option>
				<option value="firstThirdWeek">매월 첫째주,셋째주</option>
				<option value="secondFourthWeek">매월 둘째주,넷째주</option>
			</select>
		</div>

		<p class="_repeat_week repeat_day" style="display: block;">
			<input type="checkbox" id="ch1_5" value="sun" class="input_chk">
			<label for="ch1_5">일</label>
			<input type="checkbox" id="ch1_6" value="mon" class="input_chk">
			<label for="ch1_6">월</label>
			<input type="checkbox" id="ch1_7" value="tue" class="input_chk">
			<label for="ch1_7">화</label>
			<input type="checkbox" id="ch1_8" value="wed" class="input_chk">
			<label for="ch1_8">수</label>
			<input type="checkbox" id="ch1_9" value="thu" class="input_chk">
			<label for="ch1_9">목</label>
			<input type="checkbox" id="ch1_10" value="fri" class="input_chk">
			<label for="ch1_10">금</label>
			<input type="checkbox" id="ch1_11" value="sat" class="input_chk">
			<label for="ch1_11">토</label>
		</p>
	</div>

</body>
</html>