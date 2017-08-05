# Introduction

Welcome to OpenGL Tutorials. I've tried to explain everything as clearly as I can. My aim is to teach you the basic of OpenGL
with clear examples. At the end of the each section, there is a **exercise** which you should solve before continuing to next
section.

## Prerequisites
Since OpenGL is a graphic API, and doesn't have platform of its own, it requires a language to operate with. Here, we will be using
[QB64](http://www.qb64.net/). So, if you don't have much experience, I recommend you to learn it from [Qb64 Source Code](http://www.qb64sourcecode.com)

# Site structure
To make the tutorials easier to follow and give them some added structure the site contains boxes, code blocks and keyword references. 

## Boxes
<div class="hint-box">
  <b>Green Boxes</b> contain some note or useful feature/hints about the OpenGL.
</div>
<div class="warning-box">
  <b>Red Boxes</b> contain warnings.
</div>

## Code
You will see plenty of small pieces of code in the site. They are highlighted as light grey as -

```vb
'A of the code
'Another line of code
```

## OpenGL Keyword References
You can hover on the OpenGL keywords to see information and syntax about it.
For example, try to hover on this - 
<span id="keyword-info" keyword-title="_glClear">
   _glClear clear buffers to preset values. <br>
  <i>Syntax - </i><br>
  <i>_glClear mask</i>
  The parameters of _glClear are as follows - <br>
  <ul>
    <li>mask : can be <i>_GL_COLOR_BUFFER_BIT</i> or <i>_GL_DEPTH_BUFFER_BIT</i></li>
  </ul>
</span>
