
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DO
    _LIMIT 40 'Adding this will prevent high cpu usage.
LOOP

SUB _GL ()
    STATIC glInit
    'Here we'll put our OpenGL commands!
    IF NOT glInit THEN
        glInit = -1
        _glViewport 0, 0, _WIDTH, _HEIGHT 'here _WIDTH() and _HEIGHT() gives the width and height of our window.
        img& = _LOADIMAGE("texture_2.jpg")
		img2& = _NEWIMAGE(_WIDTH(img&), _HEIGHT(img&), 32)
		_PUTIMAGE (0,_HEIGHT - 1)-(_WIDTH - 1, 0),img&,img2&

        STATIC myTex AS LONG'our texture handle
        _glGenTextures 1, _OFFSET(myTex) 'generate our texture handle
        _glBindTexture _GL_TEXTURE_2D, myTex 'select our texture handle

        DIM m AS _MEM
        m = _MEMIMAGE(img2&) 'we will take data from our image using _MEM

        'giving image data to our texture handle
        _glTexImage2D _GL_TEXTURE_2D, 0, _GL_RGB, _WIDTH(img2&), _HEIGHT(img2&), 0, _GL_BGRA_EXT, _GL_UNSIGNED_BYTE, m.OFFSET

        _MEMFREE m

        'set our texture wrapping
        _glTexParameteri _GL_TEXTURE_2D, _GL_TEXTURE_WRAP_S, _GL_REPEAT
        _glTexParameteri _GL_TEXTURE_2D, _GL_TEXTURE_WRAP_T, _GL_REPEAT

        'set out texture filtering
        _glTexParameteri _GL_TEXTURE_2D, _GL_TEXTURE_MAG_FILTER, _GL_LINEAR 'for scaling up
        _glTexParameteri _GL_TEXTURE_2D, _GL_TEXTURE_MIN_FILTER, _GL_NEAREST 'for scaling down


    END IF

    _glEnable _GL_TEXTURE_2D 'enable texture mapping

    _glClearColor 0, 0, 0, 1 'set color to solid black
    _glClear _GL_COLOR_BUFFER_BIT

	_glBindTexture _GL_TEXTURE_2D, myTex
    _glBegin _GL_TRIANGLES

    _glTexCoord2f 0.5, 1
    _glVertex2f 0, 1

    _glTexCoord2f 0, 0
    _glVertex2f -1, -1

    _glTexCoord2f 1, 0
    _glVertex2f 1, -1
    _glEnd


    _glFlush
END SUB


