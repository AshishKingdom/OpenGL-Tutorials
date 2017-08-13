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

<div id="hint-box">
It's good idea to add frame limit by using <b>_LIMIT</b> to prevent high cpu usage.
</div>
