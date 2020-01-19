  window.console = window.console || function (t) {};
  if (document.location.search.match(/type=embed/gi)) {
  	window.parent.postMessage("resize", "*");
  }



  $(document).ready(function () {

  	$('.card').delay(1800).queue(function (next) {
  		$(this).removeClass('hover');
  		$('a.hover').removeClass('hover');
  		next();
  	});
  });
