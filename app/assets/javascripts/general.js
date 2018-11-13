(function (){
	var agendaKids = function ()
	{
		var index = function ()
		{
			ajaxLoad();
		};

		var ajaxLoad = function()
		{
			$('.ajax-load').on('click', function(e){
		    	e.preventDefault();
		    	$('.ajax-content').load($(this).attr('href'));
		  	});
		};

		return {
			init: index
		}
	}();
	$(document).ready(agendaKids.init)
})();