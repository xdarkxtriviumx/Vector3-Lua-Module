# Vector3-Lua-Module
This module gives some functionality within Lua to immitate libraries such as Vector3 for Unity. I will refer to the table as a 'class' and the functions as 'methods'. (Object-oriented mindset).

## Usage example
Usage is fairly straight forward. All methods which are accessed through `:` such as `myVector:magnitude()` are methods that rely on having an 'instance' to act upon (exposes a `self` variable within). Methods tied directly to the Vector3 class will be accessed with `.` such as `Vector3.new()`. These don't use a specific instance to call them.

## Currently Implemented Operators
* Vector Addition
  * You are able to add to vectors together which will return the result of their component values summed together.
* Vector Subtraction
  * Same as addition, but for subtraction.
* Vector Multiplication
  * For this I used the Unity approach of returning a vector which holds the respective component values multiplied together. I also added functionality for multiplying a vector by a scalar value if one is passed in instead of another vector.
* Vector Division
  * I wasn't sure if this was necessary, but I did the same with this as I did with multiplication. Returns `nil` if you attempt to divide by 0 with a scalar or vector containing a 0 component.
* Negation
  * Added support for negating a vector (ex: `local negativePos = -position`). This will return a vector with the signs for all component values inverted.
* Overridden '**tostring()**'
  * Using `tostring(myVector)` will return a nicely formatted string that will appear like so: `(1, 2, 3)`.
  
## Currently Implemented Methods
#### Vector3 Methods
* `Vector3.new(x, y, z)`
  * All parameters are optional. If any are not passed in then they will default to 0 for that component. Returns the resulting Vector3.
#### Instance Methods
* `Vector3:distance(other)`
  * Returns the distance between the calling vector and the `other` vector that was passed in.
* `Vector3:magnitude()`
  * Returns the length of the calling vector (its magnitude).
* `Vector3:normalized()`
  * Returns a normalized version of the calling vector. Handles a magnitude of 0 by returning a vector of (0, 0, 0).
* `Vector3:dot(other)`
  * Returns the dot (scalar) product of the calling and `other` vector.
* `Vector3:cross(other)`
  * Returns the cross (vector) product of the calling and `other` vector.
