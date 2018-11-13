(function (){
	var agendaKids = function ()
	{
		var index = function ()
		{
			loadSelect2();
			ajaxLoad();
		};

		var ajaxLoad = function()
		{
			$('.ajax-load').on('click', function(e){
		    	e.preventDefault();
		    	$('.ajax-content').load($(this).attr('href'));
		  	});
		};

		var loadSelect2 = function()
		{
			$(".js-select2").select2({
				placeholder: "Escolha um responsável",
	      theme: "material"
    	});
    
    	$(".select2-selection__arrow").addClass("material-icons").html("arrow_drop_down");
		};
	

		return {
			init: index
		}
	}();
	$(document).ready(agendaKids.init)
})();