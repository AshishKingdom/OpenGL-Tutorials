```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DIM SHARED greenValue AS SINGLE
DIM temp AS SINGLE 'we will use this with SIN() to get a oscillating value between -1 and 1.
DO
    greenValue = ABS(SIN(temp)) 'we are using ABS() to prevent negative values.
    _LIMIT 40 'Adding this will prevent high cpu usage.
    temp = temp + .05 'It must increased a bit in every loop, otherwise, SIN() will return same value again & again.
LOOP

SUB _GL ()
    'Here we'll put our OpenGL commands!
    _glClearColor 0, greenValue, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT
END SUB
```
