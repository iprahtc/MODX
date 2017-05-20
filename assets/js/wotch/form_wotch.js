function forWotch(name_site){
	$.get("/new_wotch",
		{
			name: name_site
		},function(data){
			data = JSON.parse(data);
			$(".target").html(data.target);
			//console.log(data.target);
			$(".time-wotch").html(data.time_wotch);
			$(".click-firm").click();
			$('select').material_select();
			
			if($("input[name='city']").val())
				$("#city_on").hide();
			else
				$("#city_on").show();
			$( ".city" ).focus(function() {
					$("#city_on").hide(300);
			});
		});
}

function validationSite(){
	var test;
	test = $("input[name='first_name']").val();
	if(test){
		console.log(test);
	}
	else{
		$(".wotch-site").html('Вы не заполнили в форме колонку "название товора"');
	}
}


