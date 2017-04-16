$('.modal').modal({
      dismissible: true, // Модаль можно отменить, щелкнув за пределами модального
      opacity: .5, // Непрозрачность модального фона
      inDuration: 300, // Длительность перехода
      outDuration: 200, // Длительность перехода
      startingTop: '4%', // Атрибут начала верхнего стиля
      endingTop: '30%', 
      ready: function(modal, trigger) { // Обратный вызов для Modal open. Доступны модальные и триггерные параметры
        alert("Ready");
        console.log(modal, trigger);
      	},
     	 complete: function() { alert('Closed'); } // Callback for Modal close
    	}
  	);