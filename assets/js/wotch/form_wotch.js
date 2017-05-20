function forWotch(name_site){
	$.get("/new_wotch",
		{
			name: name_site
		},function(data){
			data = JSON.parse(data);
			$(".target").html(data.target);
			$(".time-wotch").html(data.time_wotch);
			$(".click-firm").click();
			$('select').material_select();
			
			$( ".city" ).focus(function() {
				$("#city_on").hide(300);
			});
			$( ".city" ).focusout(function() {
				$("#city_on").show();
			});
		});
}


