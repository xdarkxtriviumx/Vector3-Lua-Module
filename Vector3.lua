local Vector3 = {}

local Vector3_mt = {
    __index = Vector3,
    __add = function(a, b)
        return Vector3.new(a.x + b.x, a.y + b.y, a.z + b.z);
    end,
    __sub = function(a, b)
        return Vector3.new(a.x - b.x, a.y - b.y, a.z - b.z);
    end,
    __mul = function(a, b)
        if (type(b) == "number") then
            return Vector3.new(
                a.x * b,
                a.y * b,
                a.z * b
            );
        else
            return Vector3.new(
                a.x * b.x,
                a.y * b.y,
                a.z * b.z
            );
        end
    end,
    __div = function(a, b)
        if (type(b) == "number") then
            if (b == 0) then print("Attempted to divide by zero. Returning nil"); return nil; end

            return Vector3.new(
                a.x / b,
                a.y / b,
                a.z / b
            );
        else
            if (b.x == 0 or b.y == 0 or b.z == 0) then print("Attempted to divide by zero. Returning nil."); return nil; end
            
            return Vector3.new(
                a.x / b.x,
                a.y / b.y,
                a.z / b.z
            );
        end
    end,
    __unm = function(self)
        return Vector3.new(-self.x, -self.y, -self.z);
    end,
    __tostring = function(self)
        return "(" .. self.x .. ", " .. self.y .. ", " .. self.z .. ")";
    end
};

function Vector3.new(x, y, z)
    local obj = {
        x = x or 0,
        y = y or 0,
        z = z or 0
    }

    return setmetatable(obj, Vector3_mt);
end

function Vector3:distance(other)
    return math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2 + (self.z - other.z)^2);
end

function Vector3:magnitude()
    return math.sqrt(self.x^2 + self.y^2 + self.z^2);
end

function Vector3:normalized()
    local magnitude = self:magnitude();

    return Vector3.new(
        self.x / magnitude,
        self.y / magnitude,
        self.z / magnitude
    );
end

function Vector3:dot(other)
    return ((self.x * other.x) + (self.y * other.y) + (self.z * other.z));
end

function Vector3:cross(other)
    local result = Vector3.new(
        (self.y * other.z) - (self.z * other.y),
        (self.z * other.x) - (self.x * other.z),
        (self.x * other.y) - (self.y * other.x)
    );

    -- Doing some workarounds to avoid '-0' in Lua.
    if (result.x == 0) then result.x = 0; end
    if (result.y == 0) then result.y = 0; end
    if (result.z == 0) then result.z = 0; end

    return result;
end

return Vector3;