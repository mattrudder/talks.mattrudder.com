(function(){
    if( typeof CodeMirror === 'undefined' ) {
        throw 'The reveal.js CodeMirror plugin requires CodeMirror to be loaded';
    }

    var initEditors = function () {
    	var textareas = document.querySelectorAll('textarea[data-codemirror]'),
    		editor;

    	for (var i = 0, iLen = textareas.length; i < iLen; ++i) {
    		editor = CodeMirror.fromTextArea(textareas[i], {
    			theme: 'solarized dark',
    			lineNumbers: true,
    			lineWrapping: true
    		});
    	}
    };

    initEditors();
}());