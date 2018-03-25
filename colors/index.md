# Colors
***
## Introduction
***
In this section, we are going to explore colors and blending in OpenGL. So, be ready!

***
## Colors
Going back to [My First Triangle](https://ashishkingdom.github.io/OpenGL-Tutorials/first-triangle/) section, we have the following code at the end -
```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DO
    _LIMIT 40 'Adding this will prevent high cpu usage.
LOOP

SUB _GL ()
    'Here we'll put our OpenGL commands!

    _glViewport 0, 0, _WIDTH, _HEIGHT      'here _WIDTH() and _HEIGHT() gives the width and height of our window.
    '_glClearColor 1, .5, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT

	'giving orange color.
    _glColor3f 1, .5, 0

    _glBegin _GL_TRIANGLES
    _glVertex2f 0, 1
    _glVertex2f -1, -1
    _glVertex2f 1, -1
    _glEnd

END SUB
```

Now, let's try adding red, green and blue color before first, second and third vertex of our triangle inside `glBegin()` and `glEnd()`.
```vb
...
  _glBegin _GL_TRIANGLES
  _glColor3f 1,0,0
  _glVertex2f 0, 1
  _glColor3f 0,1,0
  _glVertex2f -1, -1
  _glColor3f 0,0,1
  _glVertex2f 1, -1
  _glEnd
...
```

Run the code, and you will have the following output -

![OpenGL Triangle With Colors](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/colors/color-triangle.png)

What? You might be thinking that we have just added 3 colors but we are getting rainbow of colors in our triangle! This color palette is because of fragment interpolation in the [fragment shader](https://www.opengl.org/wiki/Fragment_Shader).

In this way, you can give variety of colors to your object/shapes before each vertices between `_glBegin()` and `_glEnd()`.

## Transparency
Just like we have `_RGBA()` in QB64 for alpha with color, OpenGL too provides us `_glColor4f()` to work with alpha based colors.
The syntax for **\_glColor4f()** is - `_glColor4f(r,g,b,a)` where r,g,b and a are values for red, green, blue and alpha between 0-1 
(Just like we have between 0-255 with **\_RGBA()**).

But, before using these alpha based colors, we need to enable them with `_glEnable _GL_BLEND`.
```vb
  ...
  _glViewport 0, 0, _WIDTH, _HEIGHT      'here _WIDTH() and _HEIGHT() gives the width and height of our window.
  '_glClearColor 1, .5, 0, 1
  _glClear _GL_COLOR_BUFFER_BIT

  _glEnable _GL_BLEND 'Enable Alpha blending
  ...
```

Now, let's try to add some alpha based colors -

```vb
  ...
  _glBegin _GL_TRIANGLES
  _glColor4f 1,0,0, 0.5
  _glVertex2f 0, 1
  _glColor4f 0,1,0, 0.5
  _glVertex2f -1, -1
  _glColor4f 0,0,1, 0.5
  _glVertex2f 1, -1
  _glEnd
  ...
 ```
 
 Run the code, and you will have the following output -
 
![Color Triangle With Alpha](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/colors/color-alpha-triangle.png)

As you can see, the triangle is fainter than last one, because of 50% transparency in its color, it get mixed with black background.

## Blending Formulae
***
_This page is in development. Keep coming, you might eventually see something new!_
