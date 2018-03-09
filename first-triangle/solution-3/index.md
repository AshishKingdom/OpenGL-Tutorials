```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DO
    _LIMIT 40 'Adding this will prevent high cpu usage.
LOOP

SUB _GL ()
    'Here we'll put our OpenGL commands!
    _glViewport 0, 0, _WIDTH, _HEIGHT 'here _WIDTH() and _HEIGHT() gives the width and height of our window.

    '_glClearColor 1, .5, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT


    _glBegin _GL_TRIANGLES
    _glColor3f 0, 1, 1

    _glVertex2f 0, 0
    _glVertex2f -1, 1
    _glVertex2f -1, -1

    _glVertex2f 0, 0
    _glVertex2f 1, 1
    _glVertex2f 1, -1

    _glColor3f 1, 0, 1

    _glVertex2f -.5, 0
    _glVertex2f -1, 1
    _glVertex2f -1, -1

    _glVertex2f .5, 0
    _glVertex2f 1, 1
    _glVertex2f 1, -1
    _glEnd
    
    _glFlush
END SUB


```
