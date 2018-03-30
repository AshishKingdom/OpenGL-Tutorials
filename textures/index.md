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

***
_This page is in development. Keep coming, you might eventually see something new!_
