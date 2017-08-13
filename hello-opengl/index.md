# Hello OpenGL
## Creating Window
To setup our OpenGL to work, we'll need to create a window. Every OpenGL program should have main loop (So that OpenGL rendering occurs). So, after creating
our window, we'll add a main loop.
```vb
_TITLE "Learning OpenGL" 'giving title to your window
SCREEN _NEWIMAGE(600, 600, 32) 'creating a window of 600x600

'We will make window resizable by adding $resize:on
$RESIZE:ON

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
....
....
SUB _GL ()
END SUB
```
That's it. It will currently not affect our output with previous one.

## Coloring the background (OpenGL CLS)
Currently, This window is boring to see. Let's do some fancy by adding some OpenGL commands.
We'll be changing the color of the background by using <span id="keyword-info" keyword-title="_glClear">   _glClear clear buffers to preset values. <br><br>
  <i>Syntax - </i><br><br>
  <i>_glClear mask</i><br><br>
  mask: can be <i>_GL_COLOR_BUFFER_BIT</i> or <i>_GL_DEPTH_BUFFER_BIT</i>.<br>
</span>. To set the color for <span id="keyword-info" keyword-title="_glClear">   _glClear clear buffers to preset values. <br><br>
  <i>Syntax - </i><br><br>
  <i>_glClear mask</i><br><br>
  mask: can be <i>_GL_COLOR_BUFFER_BIT</i> or <i>_GL_DEPTH_BUFFER_BIT</i>.<br>
</span> by <span id="keyword-info" keyword-title="_glClearColor">   _glClearColor specifies the color for _glClear <br><br>
  <i>Syntax - </i><br><br>
  <i>_glClearColor red, green, blue, alpha</i><br><br>
  red: Value of red ranging between 0-1.<br>
  green: Value of green ranging between 0-1.<br>
  blue: Value of blue ranging between 0-1.<br>
  alpha: Value of alpha ranging between 0-1.<br>
</span>
