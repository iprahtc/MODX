var site_name;
function forWotch(name_site){
	window.site_name = name_site;
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
	//console.log(site_name);
	switch (site_name) {
		case "seasonvar":
			var film = $("input[name='first_name']").val();
			var season = $("input[name='season']").val();
			var series = $("input[name='series']").val();
			var translation = $("input[name='translation']").val();
			var fullHd1080 = $("input[id='fullHd1080']").val();
			var hd720 = $("input[id='hd720']").val();
			var c480p = $("input[id='c480p']").val();
			var camrip = $("input[id='camrip']").val();
			var webdl = $("input[id='webdl']").val();
			if(film){
				$.get("/assets/snippets/APIsites/APIsites.php",
				{
					site: site_name,
					search: film,
					season: season,
					series: series,
					translation: translation,
					fullHd1080: fullHd1080,
					hd720: hd720,
					c480p: c480p,
					camrip: camrip,
					webdl: webdl,
					action: ""
					
				},function(data){
					$(".wotch-site").html(data);
					console.log(data);
				});
			}
			else{
				$(".wotch-site").html('Вы не заполнили в форме колонку "название фильма"');
			}
			break;
			
		case "olx":
			var tovar = $("input[name='first_name']").val();
			var price_start = $("input[name='price_start']").val();
			var price_final = $("input[name='price_final']").val();
			var region = $("input[name='region']").val();
			var city = $("input[id='city']").val();
			if(film){
				$.get("/new_wotch",
				{
					site: site_name,
					tovar: tovar,
					price_start: price_start,
					region: region,
					city: city
					
				},function(data){
					
				});
			}
			else{
				$(".wotch-site").html('Вы не заполнили в форме колонку "название фильма"');
			}
			break;	
	}
}


