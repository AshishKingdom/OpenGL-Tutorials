# Textures
***
## Introduction
Welcome to texures section of OpenGL Tutorials. In this section, we will be learning the way to give texture to objects.
We will also learn about different texture filtering, texture wrapping and masking.
***
## Texture Coordinates
In order to map texture to our triangle, we need to tell each vertex of the triangle which part of the texture it corresponds to. 
Therefore, each vertex must have **texture coordinates**, then only it will map the texture image to our triangle. 

![Texture Coordinates Diagram](https://ashishkingdom.github.io/OpenGL-Tutorials/images/textures/tex_coord_1.png)

Texture coordinates range from 0 to 1 in x and y axis. When talking about textures, we usually refer x-axis as s-axis and y-axis as
t-axis. At the bottom left of the texture, both X and Y equals to 0 (S = T = 0). At the rightmost of the texture, X = 1 (S = 1) and
at the topmost of the texture, Y = 1 (T = 1).

The texture coordinates for our triangle with corresponding vertices is shown below -

![Texture Coordinate For Our Triangle](https://ashishkingdom.github.io/OpenGL-Tutorials/images/textures/tex_coord_2.png)

We specify 3 texture coordinates for our triangle for its 3 vertices. For the top vertex, the texture coordiante will be (0.5,1). For bottom left and botoom right, the texture coordinate will be (0,0) and (1,0).

## Setting Up Texture for Our Triangle

We will be using [this image](https://ashishkingdom.github.io/OpenGL-Tutorials/images/textures/texture_2.jpg) as texture for our triangle. We need to do some things once in SUB \_GL(). For example, we have to load our texture and set its different properties. We can also to put our `_glViewPort()` in the procedure, as it doesn't need to be called again & again, unless the window size has change.

```vb
...

SUB _GL ()
    STATIC glInit
    'Here we'll put our OpenGL commands!
    IF NOT glInit THEN 'This block will execute once.
        glInit = -1 
        _glViewport 0, 0, _WIDTH, _HEIGHT 'here _WIDTH() and _HEIGHT() gives the width and height of our window.
        img& = _LOADIMAGE("texture_2.jpg")
    END IF
    
    ...
```

Textures are reference with an ID, so we have declare a STATIC variable for it inside \_GL().

```vb
...
    IF NOT glInit THEN
        glInit = -1
        _glViewport 0, 0, _WIDTH, _HEIGHT 'here _WIDTH() and _HEIGHT() gives the width and height of our window.
        img& = _LOADIMAGE("texture_2.jpg")

        STATIC myTex 'our textyre handle
        _glGenTextures 1, _OFFSET(myTex) 'generate our texture handle
        _glBindTexture _GL_TEXTURE_2D, myTex 'select our texture handle

...
```
We use `_glGenTextures()` to generate texture IDs. The first agruement is for number of textures to be generated which is going to store in the second array arguement. We can usually pass a unsigned integer variable as its second arguement when generating only one texture ID and **We need to pass this second argument with \_OFFSET()**. After this, we select our texture with the help of `_glBindTexture()`. The first arguement is texture type, which is `_GL_TEXTURE_2D` for our image, and the second arguement is for our texture ID.

Now, our next step is to give image data to our texture

```vb
...
    STATIC myTex 'our texture handle
    _glGenTextures 1, _OFFSET(myTex) 'generate our texture handle
    _glBindTexture _GL_TEXTURE_2D, myTex 'select our texture handle

    DIM m AS _MEM
    m = _MEMIMAGE(img&) 'we will take data from our image using _MEM.

    'giving image data to our texture handle
    _glTexImage2D _GL_TEXTURE_2D, 0, _GL_RGB, _WIDTH(img&), _HEIGHT(img&), 0, _GL_BGRA_EXT, _GL_UNSIGNED_BYTE, m.OFFSET

    _MEMFREE m 
...
```

We created a `_MEM` type variable 'm' and used `_MEMIMAGE()` to get a data block for our image. After this, we use `_glTexImage2D()` to pass our image data -
- The first argument specifies the texture target. Since our texture has `_GL_TEXTURE_2D` type, we set it to `_GL_TEXTURE_2D`. We can also set it to `_GL_TEXTURE_1D`, `_GL_TEXTURE_3D`, etc. depending on our requirement. 
- The second argument specifies the mipmap level of texture.
- The third argument specifies the format in which OpenGL will store the image data. We have set this to `_GL_RGB`. However, you can set it to `_GL_RGBA` if your image have some transparency.
- The fourth & fifth argument specifies the width and height of our image.
- The sixth argument specifies the border of our image. **It must be 0.**
- The seventh argument specifies the data format of our loaded image. This must be `_GL_BGRA_EXT` for all QB64 loaded image.
- The last argument is the actual image data. (`m.OFFSET`)

After this, we free our image data block using `_MEM`.
***
_This page is in development. Keep coming, you might eventually see something new!_
