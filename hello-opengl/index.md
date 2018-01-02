# Hello OpenGL
## Creating Window
To setup our OpenGL to work, we'll need to create a window. Every OpenGL program should have main loop (So that OpenGL rendering occurs). So, after creating
our window, we'll add a main loop.
```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DO
    _LIMIT 40 'Adding this will prevent high cpu usage.
LOOP
```
This is will produce the following result - 

![OpenGL First Window Created](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/hello-opengl/first_window.png)

<div class="hint-box">
It's a good idea to add frame limit by using <b>_LIMIT</b> to prevent high cpu usage.
</div>

## Adding OpenGL Subroutine
To use OpenGL keywords and other commands, we need to add a subroutine named **\_GL**. QB64 automatically detects this special subroutine and allows us to use OpenGL commands in it.
```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DO
    _LIMIT 40 'Adding this will prevent high cpu usage.
LOOP

SUB _GL ()
    'Here we'll put our OpenGL commands!
END SUB
```
That's it. It will currently not affect our output with previous one.

## Coloring the background (OpenGL CLS)
Currently, This window is boring to see. Let's do some fancy by adding some OpenGL commands.
We'll be changing the color of the background by using `glClear()`. The syntax for it is as follows -
`glClear( mask )`
- **mask** : You can give this value of **GL_COLOR_BUFFER_BIT**,**GL_DEPTH_BUFFER_BIT** or **GL_STENCIL_BUFFER_BIT** for clearing color buffer, depth buffer or stencil buffer.

You can also set the color value that OpenGL will use for clearing the color buffer by `glClearColor()`. The syntax for this is `glClearColor(redValue, greenValue, blueValue, alphaValue)`.
**redValue**, **greenValue**, **blueValue** and **alphaValue** are just red, green, blue and alpha component of a color, just like we have with `_RGBA()`. They all should be between 0-1. Just like we have 0-255 for `_RGB()` and `_RGBA()`.

Now, we'll use these two OpenGL commands in our previous code
```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'This is our main loop
DO
    _LIMIT 40 'Adding this will prevent high cpu usage.
LOOP

SUB _GL ()
    'Here we'll put our OpenGL commands!
    _glClearColor 1, .5, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT
END SUB
```
This will produce the following output -

![Yellow colored window with glClear()](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/hello-opengl/window_after_glClear.png)
