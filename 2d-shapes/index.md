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

<div class="hint-box">
    You can make the points to appear bigger with the help of <b>_glPointSize()</b>. It syntax is -<br><b>_glPointSize( size )</b> where <b>size</b> is the size of the point and it can take value such as 1,2,10,25.4,etc
</div>

***

# \_GL_LINES

In **\_GL_LINES** mode, the two vertices are connected to form a line. 
I've just replace the **\_GL_POINTS** with **\_GL_LINES**.

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

    _glBegin _GL_LINES
    _glVertex2f -0.5, 0.5
    _glVertex2f 0.5, 0.5
    _glVertex2f 0.5, -0.5
    _glVertex2f -0.5, -0.5
    _glEnd

    _glFlush
END SUB
```

It will produce the following output -

![GL_LINES](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/2d-shapes/_GL_LINES.png)

***

# \_GL_LINE_STRIP

The **\_GL_LINE_STRIP** mode is somewhat similar to **\_GL_LINES**. The only difference is that, in **\_GL_LINE_STRIP**
the previous vertex get connected to the current vertex. I've replace `_GL_LINES` with `_GL_LINE_STRIP` -

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

    _glBegin _GL_LINE_STRIP
    _glVertex2f -0.5, 0.5
    _glVertex2f 0.5, 0.5
    _glVertex2f 0.5, -0.5
    _glVertex2f -0.5, -0.5
    _glEnd

    _glFlush
END SUB

```

This is will produce the following result -

![GL_LINE_STRIP](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/2d-shapes/_GL_LINE_STRIP.png)

***

# \_GL_LINE_LOOP

**\_GL_LINE_LOOP** is similar to **\_GL_LINE_STRIP**. It joins the previous vertex with current vertex and automatically joins
the last vertex to the first vertex in order to form a loop.
Example -

```vb
...
    _glColor3f 1, 1, 1

    _glBegin _GL_LINE_LOOP
    _glVertex2f -0.5, 0.5
    _glVertex2f 0.5, 0.5
    _glVertex2f 0.5, -0.5
    _glVertex2f -0.5, -0.5
    _glEnd
...
```

It will produce the following result -

![GL_LINE_LOOP](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/2d-shapes/_GL_LINE_LOOP.png)

<div class="hint-box">
    You can also increase the width of the line using <b>_glLineWidth()</b> just like <b>_glPointSize()</b>
    It has only one arguement for the width of the line. For example - <b>_glLineWidth 3.0</b>
</div>
    

***

# \_GL_TRIANGLES
As you know, we have already played with `_GL_TRIANGLES`. In **\_GL_TRIANGLES** mode, the three vertices get connected
to form a color filled triangle. If you replace the previous code with **\_GL_TRIANGLES**, then it will produce the
following result -

![GL_TRIANGLES](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/2d-shapes/_GL_TRIANGLES.png)

***

# \_GL_TRIANGLE_STRIP
In **\_GL_TRIANGLE_STRIP** mode, the current vertex gets connected with previous 2 vertex to form a triangle. Just like as shown
in the figure below -

![GL_TRIANGLE_STRIP_Diagram](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/2d-shapes/diagram-1.png)

I've replace the **\_GL_LINE_STRIP** with **\_GL_TRIANGLE_STRIP** from my previous code -

```vb
    ...
    
    _glColor3f 1, 1, 1

    _glBegin _GL_TRIANGLE_STRIP
    _glVertex2f -0.5, 0.5
    _glVertex2f 0.5, 0.5
    _glVertex2f 0.5, -0.5
    _glVertex2f -0.5, -0.5
    _glEnd
    
    ...
```

And, we will have the following result -

![GL_TRIANGLE_STRIP](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/2d-shapes/_GL_TRIANGLES_STRIP.png)



***
_This page is in development. Keep coming, you might eventually see something new!_
