```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DO
    _LIMIT 40 'Adding this will prevent high cpu usage.
LOOP

SUB _GL ()
    'Here we'll put our OpenGL commands!
    STATIC clock# 'we will be using this get different fading speed

    _glViewport 0, 0, _WIDTH, _HEIGHT 'here _WIDTH() and _HEIGHT() gives the width and height of our window.
    '_glClearColor 1, .5, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT

    _glEnable _GL_BLEND 'Enable Alpha blending

    _glColor4f 1, 1, 0, ABS(SIN(clock#))
    drawCircle -.5, 0, .5

    _glColor4f 1, 0, 1, ABS(SIN(clock# * 3)) 'multiplying by 3 to oscillate the value faster between 0 and 1
    drawCircle .5, 0, .5

    _glFlush

    clock# = clock# + .02
END SUB

SUB drawCircle (x, y, r)
    _glBegin _GL_TRIANGLE_FAN
    FOR i = 0 TO _PI(2) STEP .06
        _glVertex2f COS(i) * r + x, SIN(i) * r + y
    NEXT
    _glEnd
END SUB

```
