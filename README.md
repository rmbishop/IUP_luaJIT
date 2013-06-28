IUP_luaJIT
==========

LuaJIT ffi interface to the IUP GUI library

A bare-bones LuaJIT ffi interface to the IUP GUI library.  This can be a replacement of the current official
(non-ffi-based) Lua interface.


Example:

Pulled right from submenu.c (typos and all) in the iup-3.8 Examples.zip, 
which is available for download at the IUP site.  The only modifications
are that some slight syntax changes were needed to convert it
from C to Lua.

![ScreenShot](https://raw.github.com/rmbishop/IUP_luaJIT/master/example1.png)
