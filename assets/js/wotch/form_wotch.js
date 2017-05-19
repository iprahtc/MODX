
function forWotch(name_site){
	$.get("/new_wotch",
		{
			name: name_site
		},function(data){
			data = JSON.parse(data);
			$(".target").html(data.target);
			$(".time-wotch").html(data.time_wotch);
		});
}

