# Colors
***
## Introduction

***

In this section, we are going to explore colors and blending in OpenGL. So, be ready.

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
    
    _glFlush
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
Now, we will learn how to combine the pixels to get blending effect. This process consists of following :-
- **Source Color** :- The color of the pixel which is being drawn.
- **Destination Color** :- The color of the pixel which is already drawn and is stored in the buffer/memory.

The color is the sum of products between the its associated factor and this is what we call
*Blending Formulae*.

_finalColor = sourceColor * sourceFactor + destColor * destFactor_

**or**

_finalColor = (srcR\*srcRF+dstR\*dstRF,srcG\*srcGF+dstG\*dstGF, .... and so on._ (srcR = sourceRed, srcRF = sourceRedFactor....)

The source and destination color factor is defined by `_glBlendFunc()` command. Its syntax is as follows -
`_glBlendFunc(srcFactor, dstFactor)` where srcFactor and dstFactor are source factor and destination factor and they
can take value of followig OpenGL constants.

OpenGL Constants | Value
-----------------|---------------
`_GL_ZERO` | (0, 0, 0, 0)
`_GL_ONE` | (1, 1, 1, 1)
`_GL_DST_COLOR` | (_destR_, _destG_, _destB_, _destA_)
`_GL_ONE_MINUS_DST_COLOR` | (_1 - destR_, _1 - destG_, _1 - destB_, _1 - destA_)
`_GL_SRC_COLOR` | (_srcR_, _srcG_, _srcB_, _srcA_)
`_GL_ONE_MINUS_SRC_COLOR` | (_1 - srcR_, _1 - srcG_, _1 - srcB_, _1 - srcA_)
`_GL_DST_ALPHA` | (_destA_, _destA_, _destA_, _destA_)
`_GL_ONE_MINUS_DST_ALPHA` | (_1 - destA_, _1 - destA_, _1 - destA_, _1 - destA_)
`_GL_SRC_ALPHA` | (_srcA_, _srcA_, _srcA_, _srcA_)
`_GL_ONE_MINUS_SRC_ALPHA` | (_1 - srcA_, _1 - srcA_, _1 - srcA_, _1 - srcA_)
`_GL_CONSTANT_COLOR` | (_constR_, _constG_, _constB_, _constA_)
`_GL_ONE_MINUS_CONSTANT_COLOR` | (_1 - constR_, _1 - constG_, _1 - constB_, _1 - constA_)
`_GL_CONSTANT_ALPHA` | (_constA_, _constA_, _constA_, _constA_)
`_GL_ONE_MINUS_CONSTANT_ALPHA` | (_1 - destR_, _1 - destG_, _1 - destB_, _1 - destA_)
`_GL_SRC_ALPHA_SATURATE` | (_i_, _i_, _i_, 1) where _i = min(srcA, 1 - destA)_

Above, destR, destG, destB, destA are just for red, green, blue and alpha component of destination color. Similarly, srcR, srcG,
srcB and srcA are red, green, blue and alpha component of the source color. constR, constG, constB and constA is the component of the color defined by `_glBlendColor()`. Its syntax is `_glBlendColor(red, green, blue, alpha)`. The red, green, blue and alpha parameter are just compoment of the color and there value should be between 0-1.

Now, let's test the `_glBlendFunc()` with following example -

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

    _glEnable _GL_BLEND 'Enable Alpha blending

    _glBlendFunc _GL_ONE, _GL_ONE 'add our blending function

    _glColor3f 1, 0, 0
    drawCircle -.2, 0, .5
    _glColor3f 0, 1, 0
    drawCircle .2, 0, .5
    _glColor3f 0, 0, 1
    drawCircle 0, -.2, .5

    _glFlush
END SUB

SUB drawCircle (x, y, r)
    _glBegin _GL_TRIANGLE_FAN
    FOR i = 0 TO _PI(2) STEP .06
        _glVertex2f COS(i) * r + x, SIN(i) * r + y
    NEXT
    _glEnd
END SUB

```

If you run the code above, you will have the following output-

![Colorful Circle with Blending](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/colors/blend-circles.png)

This is exactly working according to blending formulae. After drawing the green circle, srcG = 1, and srcR = srcB = srcA =0.
This gets multiplied with `_GL_ONE` constant, that is by 1. The red circle color, which is drawn previosly will be acting as destination color. It wil also get multiplied with `_GL_ONE` constant, that is by 1. On adding red and green color, we will get yellow color. And the same process is done with blue circle. This is exactly what happened in our output.

The main advantage of Blending function is masking, which we will learn later.

## Keywords you have learned about -
- \_glColor4f
- \_glBlendFunc
- \_glBlendColor

## Exercises


***
_This page is in development. Keep coming, you might eventually see something new!_
