# 2D Shapes

***

# Introduction
In this section, we will be learning about each mode of `_glBegin` in deep. So, Let's start!

***

# \_GL_POINTS
In **\_GL_POINTS** mode, the each vertex is rendered as a single point, with a color specified before it.
Example - 
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


    _glColor3f 1, 1, 1

    _glBegin _GL_POINTS
    _glVertex2f -0.5, 0.5
    _glVertex2f 0.5, 0.5
    _glVertex2f 0.5, -0.5
    _glVertex2f -0.5, -0.5
    _glEnd

END SUB

```

![GL_POINTS](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/2d-shapes/_GL_POINTS.png)

<div id="hint-box">
  You can make the points to appear bigger with the help of `_glPointSize()`. It syntax is -
  `_glPointSize( size )`
  
  - size : It specifies the size of the point, can take value of 1,4,10,etc.
</div>
  

***
_This page is in development. Keep coming, you might eventually see something new!_
