(function(){
    if( typeof CodeMirror === 'undefined' ) {
        throw 'The reveal.js CodeMirror plugin requires CodeMirror to be loaded';
    }

    var editors = [];

    var findSection = function(el) {
        var parent = el.parentNode;

        while (parent) {
            if (parent.tagName == "SECTION") {
                return parent;
            }

            parent = parent.parentNode;
        }

        return null;
    }

    var createEditor = function (textarea, index) {
        var editor,
            section,
            options = {
                theme: 'solarized dark',
                lineNumbers: true,
                lineWrapping: true
            };

        editor = CodeMirror.fromTextArea(textarea, options);
        section = findSection(textarea);
        if (section) {
            section.setAttribute("data-codemirror-editor", index);
            editors.push(editor);
        }
    }

    var initEditors = function () {
    	var textareas = document.querySelectorAll('textarea[data-codemirror]'),
            textarea,
            url,
            section;

    	for (var i = 0, iLen = textareas.length; i < iLen; ++i) {
            textarea = textareas[i];
            url = textarea.getAttribute('data-codemirror');

            if (url) {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", url, false);
                xhr.send(null);
                textarea.value = xhr.responseText;
                
                createEditor(textarea, i);
            }
            else {
                createEditor(textarea, i);
            }
    	}

        Reveal.getCodeMirrorOnSlide = function (slide) {
            if (!!slide && slide.getAttribute) {
                var editorIndex = parseInt(slide.getAttribute("data-codemirror-editor"));
                if (!isNaN(editorIndex)) {
                    return editors[editorIndex];
                }
            }

            return null;
        };

        Reveal.addEventListener('slidechanged', function(event) {
            var editor = Reveal.getCodeMirrorOnSlide(event.currentSlide);
            if (editor) {
                setTimeout(function () {
                    editor.refresh();
                }, 750);
            }
        });
    };

    initEditors();
}());