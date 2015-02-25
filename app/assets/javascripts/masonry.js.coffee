
$ ->
	$('.masonry-box').imagesLoaded ->
		$('.masonry-box').masonry
			itemSelector: '.box'
			isFitWidth: true