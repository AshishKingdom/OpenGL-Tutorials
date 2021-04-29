# 2D Transformations

***

## Introduction
We are now just one step behind to get into 3D. In this section, you are going to learn how can you perform 2D transformation using OpenGL commands in QB64. This section is divided into 3 sub-sections, _viz._ translations, rotations and scaling. So, be ready!

***

## Translations
 As you have seen in the previous section, whenever we call `_glVertex2f()` with the x-coordinate and y-coordinate respectively, it gets its position on screen relative to its origin. The origin as we know is center of our screen. Now, a simple question arises; how can we change this default origin?. Well, there are 2 approaches to achieve this :-
 1. You can add a constant in x and y coordinate every time, whenever you use `_glVertex2f()`
 2. You can use the new keyword `_glTranslatef()`

### First Approach (Adding constant to coordinates)


 ![Diagram showing how adding constant can shift origin](https://ashishkingdom.github.io/OpenGL-Tutorials/images/2d-transformation/translate_diagram.png)
 
 
 We are going to take the code we had in [My First Triangle](https://ashishkingdom.github.io/OpenGL-Tutorials/first-triangle/) and modify it a little bit.
 
 ```vb
 _Title "Learning OpenGL" 'giving title to your window
Screen _NewImage(600, 600, 32) 'creating a window of 600x600
Dim Shared xOrigin, yOrigin
xOrigin = 0.5: yOrigin = 0.5 'set the new origin
'This is our main loop
Do
    _Limit 40 'Adding this will prevent high cpu usage.
Loop

Sub _GL ()
    'Here we'll put our OpenGL commands!
    _glViewport 0, 0, _Width, _Height 'here _WIDTH() and _HEIGHT() gives the width and height of our window.

    '_glClearColor 1, .5, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT


    _glColor3f 1, .5, 0

    _glBegin _GL_TRIANGLES
    'we are going to add xOrigin and yOrigin to each vertex call whenever
    'we are using glVertex2f() if we want that shape/object to be shifted in position
    _glVertex2f 0 + xOrigin, 1 + yOrigin
    _glVertex2f -1 + xOrigin, -1 + yOrigin
    _glVertex2f 1 + xOrigin, -1 + yOrigin
    _glEnd

    _glFlush
End Sub

 ```
 
 This will produce the following output - 
 ![Output of program showing the approach #1 of translations](https://ashishkingdom.github.io/OpenGL-Tutorials/images/2d-transformation/translation_approach_1.png)
 
 **Notice how the triangle is slightly shifted towards top right corner.** Now suppose, your program have to render hundreds of objects,
consisting of thousands of vertex and each object has to be rendered at different position. In such cases, adding constants in x-coordinate
and y-coordinate for each object(like xOrigin & yOrigin in the above code) will be a mess. For such cases `_glTranslatef()` comes out to be
handy which we are going to learn next.

### Second Approach (using _glTranslatef)
 In easy language, `_glTranslatef()` to use to add the constant to the **current origin**. Its syntax is -
 
 `_glTranslatef(xShift, yShift, zShift)`
 
 - xShift : The amount you want to add to x-coordinate of the current origin.
 - yShift : The amount you want to add to y-coordinate of the current origin.
 - zShift : The amount you want to add to z-coordinate of the current origin.
 
 xShift, yShift, zShift can be positive or negative. Below is program which does the same work as achieved in *First Approach*
 section -
 
```vb
 _Title "Learning OpenGL" 'giving title to your window
Screen _NewImage(600, 600, 32) 'creating a window of 600x600
Dim Shared xOrigin, yOrigin
xOrigin = 0.5: yOrigin = 0.5 'set the new origin
'This is our main loop
Do
    _Limit 40 'Adding this will prevent high cpu usage.
Loop

Sub _GL ()
    'Here we'll put our OpenGL commands!
    _glViewport 0, 0, _Width, _Height 'here _WIDTH() and _HEIGHT() gives the width and height of our window.

    '_glClearColor 1, .5, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT


    _glColor3f 1, .5, 0
    'adding 0.5 and 0.5 to origin (0,0,0). So new origin will be (0.5,0.5,0)
    _glTranslatef xOrigin, yOrigin, 0
    _glBegin _GL_TRIANGLES
    _glVertex2f 0, 1
    _glVertex2f -1, -1
    _glVertex2f 1, -1
    _glEnd

    _glFlush
End Sub

```

If you run this code and you will notice that it also produce the same output as we had in *First Approach* section.

<div class="warning-box">
    Never call <b>glTranslatef()</b> between <b>_glBegin()</b> and <b>_glEnd()</b> Calling <b>_glTranslatef()</b> between these may cause error. Also,
    _<b>glTranslatef()</b> is not effective when it is called between these two commands.
</div>

Some of you might have a question - how can we reset origin again to (0,0,0) ? Well, you can just call `_glTranslatef()` again with same
parameter which you had used previously but with their sign opposite. This makes value cancel out on addition and we are left with (0,0,0)
Below is short example based upon this - 

```vb
_Title "Learning OpenGL" 'giving title to your window
Screen _NewImage(600, 600, 32) 'creating a window of 600x600
Dim Shared xOrigin, yOrigin
xOrigin = 0.5: yOrigin = 0.5 'set the new origin
'This is our main loop
Do
    _Limit 40 'Adding this will prevent high cpu usage.
Loop

Sub _GL ()
    'Here we'll put our OpenGL commands!
    _glViewport 0, 0, _Width, _Height 'here _WIDTH() and _HEIGHT() gives the width and height of our window.

    '_glClearColor 1, .5, 0, 1
    _glClear _GL_COLOR_BUFFER_BIT


    _glColor3f 1, .5, 0
    'adding 0.5 and 0.5 to origin (0,0,0). So new origin will be (0.5,0.5,0)
    _glTranslatef xOrigin, yOrigin, 0
    _glBegin _GL_TRIANGLES
    _glVertex2f 0, 1
    _glVertex2f -1, -1
    _glVertex2f 1, -1
    _glEnd

    _glColor3f 0, 1, 0
    'adding -0.5, -0.5 to the our origin (which is now (0.5,0.5,0)). So, new origin will be (0,0,0)
    '_glTranslatef -xOrigin, -yOrigin, 0

    _glBegin _GL_TRIANGLES
    _glVertex2f 0, 1
    _glVertex2f -1, -1
    _glVertex2f 1, -1
    _glEnd


    _glFlush
End Sub
```

Output - 

![Output showing a way to reset origin using _glTranslatef()](https://ashishkingdom.github.io/OpenGL-Tutorials/images/2d-transformation/translation_approach_2.png)

<div class="hint-box">
 You can also <b>_glLoadIdentity()</b> to reset the origin. But remember, using <b>_glLoadIdentity()</b> not only reset translate configuration, but 
 it also reset configuration of rotations and scaling.
</div>

## Rotations
_This page is in development. Keep coming, you might eventually see something new_