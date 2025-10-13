# Blender Cheat Sheet

## Basics

* (X, Y, Z) = (right, forward, up) (right-handed)
* Default units: meters

## Navigation in Viewport

* ``MMB`` (Middle Mouse Button) drag to orbit
* ``Shift-MMB`` move side to side
* ``Wheel`` zoom in and out
* ``HorizontalWheel`` pan side to side
* ``Ctrl-drag MMB`` zoom in and out (finer grained)
* ``Numpad2``, ``Numpad4``, ``Numpad6``, ``Numpad8`` step viewing angle down, left, right, up
* ``Numpad1`` orthographic view along -Y-axis
* ``Numpad3`` orthographic view along X-axis
* ``Numpad7`` orthographic view along Z-axis
* ``Home`` change view so you can see all objects
* ``Numpad0`` jump to camera view
* ``Ctrl-Alt-Numpad0`` set camera to current view
* ``Numpad5`` switch between ortho and perspective
* ``Numpad9`` rotate view 180°

## Adding Objects
* 3D cursor crosshair with red and white signal
* ``Shift-Right-Click`` move 3D cursor
* ``Shift-S`` show selection and cursor circular menu
  * "Cursor to World Origin"
* ``Shift-A`` pop up the "Add" menu
* ``T`` show and hide the tools palette
* ``N`` to show/hide the Sidebar
* ``G`` to grab selected object and move it around
* ``X`` constrain movement to X-axis
* ``Y`` constrain movement to Y-axis
* ``Z`` constrain movement to Z-axis
* ``Ctrl-A`` "Apply" pop-up

## Display Modes (``Z`` for "pie" menu)
* ``Z`` ``4`` Wireframe
* ``Z`` ``6`` Solid
* ``Z`` ``2`` Material Preview (HDRI Skybox)
* ``Z`` ``7`` Rendered
* ``Alt-Z`` X-Ray mode (Wireframe and Solid only)

## Rendering
* ``F12`` to render
* Principled BSDF shader
* Right Click on Object
  * Shade Smooth

## Editing
* ``Tab`` to toggle between Object and Edit mode
* ``Ctrl-Tab`` select mode pie menu
* ``1`` select vertices
* ``2`` select edges
* ``3`` select faces
* ``G`` move selected
* ``E`` extrude
* ``Ctrl-R`` loop cut
    * ``Wheel`` increase/decrease number of cuts
* ``Alt-Click`` to select all the edges in the loop
* ``Alt-Shift-Click`` to extend the selection to the edges of another loop
* ``Shift-Z`` to constrain along X and Y axes
* ``G G`` edge slide
* ``A`` select all
* ``Alt-A`` select none
* ``Ctrl-B`` bevel
    * ``Wheel`` increase/decrease number of segments
    * ``V`` use vertices instead of edges?
* ``M`` merge
* Auto-merge icon in top right corner of window
* ``Alt-N`` Bring up "Normals" menu
