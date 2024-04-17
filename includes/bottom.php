<script src="<?= JS;?>ckeditor.js"></script>
<script>
ClassicEditor
	.create( document.querySelector( '#editor' ), {
		// Editor configuration.
	} )
	.then( editor => {
		window.editor = editor;
	} )
	.catch( handleSampleError );</script>
</body>
</html>