# My First Triangle
***
# Introduction
Welcome to this section, my readers! In this section we will learn how coordinates system work in OpenGL and at the end of this 
section, we will have our first triangle to our program. I've commented out `glClearColor 1, .5, 0, 1` from our previous code.

# Coordinate System
![Coordinate System In OpenGL](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/first-triangle/coordinate_system.png)

When you are working with OpenGL, the value of _x-position_ is 0 at the centre, -1 at the leftmost of the window and +1 at the rightmost of the window. Similarly, the value of _y-position_ is 0 at the centre, 1 at the topmost of the window and -1 at the bottommost of the window. You can clearly see this in the picture above. Any value of _x_ or _y_ which less than -1 or greater than 1 will be outside of our window (actually for our current window). However, there is no limit of using this value. We'll discuss about that later in our tutorial. For now, you must have this knowledge that negative _x_ goes to left, positive _x_ goes to right, negative _y_ goes to bottom and positive _y_ goes up. 
***

# Our Triangle Vertices

Any geometric figure have several points called **vertices**. Our Triangle will have 3 vertices as shown below -

![Triangles Vertices in OpenGL](https://raw.githubusercontent.com/AshishKingdom/OpenGL-Tutorials/gh-pages/images/first-triangle/triangles_vertices.png)

***
_This page is in development.
Keep coming, you might eventually see something new!_
