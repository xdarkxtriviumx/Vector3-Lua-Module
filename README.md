# Vector3-Lua-Module
This module gives some functionality within Lua to immitate libraries such as Vector3 for Unity. I will refer to the table as a 'class' and the functions as 'methods'. (Object-oriented mindset).

## Usage example
Usage is fairly straight forward. All methods which are accessed through `:` such as `myVector:magnitude()` are methods that rely on having an 'instance' to act upon (exposes a `self` variable within). Methods tied directly to the Vector3 class can be accessed with `.` such as `Vector3.new()`. These don't use a specific instance to call them, but can still be called with an instance. I will attach usage examples below in the documentation.

## Implemented Operators
* **Vector Addition**
    * You are able to add to vectors together which will return the result of their component values summed together.
        * ex: `local vector_3 = vector_1 + vector_2`
* **Vector Subtraction**
    * Same as addition, but for subtraction.
        * ex: `local vector_diff = vector_2 - vector_1`
* **Vector Multiplication**
    * For this I used the Unity approach of returning a vector which holds the respective component values multiplied together. I also added functionality for multiplying a vector by a scalar value if one is passed in instead of another vector.
        * ex: `local vector_mul = vector_1 * vector_2` or `local vector_mul = vector_1 * scalar`
* **Vector Division**
    * I wasn't sure if this was necessary, but I did the same with this as I did with multiplication. Returns `nil` if you attempt to divide by 0 with a scalar or vector containing a 0 component.
        * ex: `local vector_div = vector_2 / vector_1` or `local vector_div = vector_1 / scalar`
* **Negation**
    * Added support for negating a vector. This will return a vector with the signs for all component values inverted.
        * ex: `local negatedVec = -vector_1`
* **Equality Comparison**
    * You can do equality comparisons between vectors to see if they have equal component values.
        * ex: `local isEqual = vector_1 == vector_2`
* **Concat Operations**
    * You can concat the vectors directly into a string which will use the 'tostring()' of the vector.
        * ex: `print('Vector_1: '..vector_1)`
* **Overridden 'tostring()'**
    * Using `tostring(myVector)` will return a nicely formatted string that will appear like so: `(1, 2, 3)`.
        * ex: `local vector_text = tostring(vector_1)`
  
## Implemented Methods
#### Class Methods
* `Vector3.new(x, y, z)`
    * All parameters are optional. If any are not passed in then they will default to 0 for that component. Returns the resulting Vector3.
        * ex: `local vector_1 = Vector3.new()` or `local vector_1 = Vector3.new(1, 2, 3)` or anything inbetween
* `Vector3.lerp(start, finish, ratio)`
    * Interpolates between the start and finish vectors based on the ratio passed in (`ratio` is between 0 to 1). Returns the resulting Vector3.
        * ex: `local middleVector = Vector3.lerp(vector_1, vector_2, 0.5)`
#### Instance Methods
* `Vector3:distance(other)`
    * Returns the distance between the calling vector and the `other` vector that was passed in.
        * ex: `local distance = vector_1:distance(vector_2)`
* `Vector3:magnitude()`
    * Returns the length of the calling vector (its magnitude).
        * ex: `local magnitude = vector_1:magnitude()`
* `Vector3:normalized()`
    * Returns a normalized version of the calling vector. Handles a magnitude of 0 by returning a vector of (0, 0, 0).
        * ex: `local vector_1Normalized = vector_1:normalized()`
* `Vector3:dot(other)`
    * Returns the dot (scalar) product of the calling and `other` vector.
        * ex: `local dotProduct = vector_1:dot(vector_2)`
* `Vector3:cross(other)`
    * Returns the cross (vector) product of the calling and `other` vector.
        * ex: `local crossProduct = vector_1:cross(vector_2)`
* `Vector3:tostring()`
    * Returns the value of `tostring(myVector)` in a more convenient way.
        * ex: `local vector_string = vector_1:tostring()`

## Implemented Fields
These fields are based on a 'positive y-axis = up, positive x-axis = right, positize z-axis = forward' orientation.
* `Vector3.zero`
    * Represents the Vector3 (0, 0, 0).
        * ex: `local zero = Vector3.zero`
* `Vector3.up`
    * Represents the Vector3 (0, 1, 0).
        * ex: `local up = Vector3.up`
* `Vector3.down`
    * Represents the Vector3 (0, -1, 0).
        * ex: `local down = Vector3.down`
* `Vector3.left`
    * Represents the Vector3 (-1, 0, 0).
        * ex: `local left = Vector3.left`
* `Vector3.right`
    * Represents the Vector3 (1, 0, 0).
        * ex: `local right = Vector3.right`
* `Vector3.forward`
    * Represents the Vector3 (0, 0, 1).
        * ex: `local forward = Vector3.forward`
* `Vector3.back`
    * Represents the Vector3 (0, 0, -1).
        * ex: `local back = Vector3.back`

## Important Final Notes
If you are using this in an in-line way (such as pasting this into a script in the Plasma game), just remove the final `return Vector3;` line at the end and place your code starting below. You can leave this module in the current form if you have access to `require()` to be able to import it at the top of a different script.
