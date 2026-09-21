

--- 
### PINTALIISKAIN
#### A surface reducer.
#### By Tero Hannula, 2026_09_21
<img width="128" height="128" align="right" alt="icon-PintaLiiskain" src="https://github.com/user-attachments/assets/8fec55d0-cf78-47d5-bf76-bb3221e5bcca" />
https://terohannula.itch.io/pintaliiskain

--- 
### GENERAL INFORMATION

This library allows reducing given input all the way into 1x1 surface.
The asset generates and keeps the midsteps alive, so you may also refer to them.

You may reduce the surface by "average", "maximum", "minimum" or "summation".
If you use regular rgba8unorm format, 
there can be quantization error, but should work.

But for "summation" you HAVE TO use floating-point textures, 
as rgba8unorm is normalized (can represent only values 0 to 1).
If platform you are using reducer doesn't support highp float-textures,
then you may opt using UNormSum reducer. 

UNormSum only reduces only single color channel, 
but uses rgba8unorm to encode uint32 whole number.
Therefore it can represent
If you readback to CPU, you can directly read this output with buffer_u32.

The methods should be called in Draw-event, as this uses shaders for reduction steps.

---
### EXAMPLE OF USE

For example if you have 1280x720 surface from video playing, 
and you want to calculate average color of overall video. 
For this you can use `.ReduceAvg()` method, which updates the cascading surfaces.
Then you may use `.GetSurface(-1)` to get last (1x1) surface, which hold the average value.
But if you refer to `.GetSurface(2)`, then it has been reduced twice.

```gml
// CREATE EVENT.
self.liiskain = new PintaLiiskain();
  
// DRAW-EVENT.
// You have gotten video-playback surface beforehand.

// Set the layout.
self.liiskain.SetLayout(
  surface_get_width(_videoPlayback),
  surface_get_height(_videoPlayback)
);

// Get initial input.
self.liiskain.AssignSurface(_videoPlayback);

// Reduce, updates cascading surfaces.
self.liiskain.ReduceAvg();

// Get index for smallest reduction.
// Contains average color of whole input.
var _average1x1 = self.liiskain.GetSurface(-1);
```


--- 
### AVAILABLE METHODS

* `AssignBegin`
* `AssignEnd`
* `AssignSprite`
* `AssignSurface`
* `Exists`
* `Free`
* `GetIndexExact`
* `GetIndexFuzzy`
* `GetMap`
* `GetMapExt`
* `GetMapLayout`
* `GetSurface`
* `Reduce`
* `ReduceAvg`
* `ReduceMax`
* `ReduceMin`
* `ReduceSum`
* `ReduceUNormSum`
* `SetFormat`
* `SetLayout`
* `Verify`


--- 
