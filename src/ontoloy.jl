#=
# The ontology.jl file contains the base primitives used to create the
# atoms in our type abstraction experiments and the semantics used
# to compose them into machines that will be shown to participants.
#
# Felix Sosa - 06/18/21
=#

### Atom Types

abstract type Shape end

abstract type Color end

# Shapes

struct Square <: Shape
    color::Color
end

struct Circle <: Shape
    color::Color
end

struct Triangle <: Shape
    color::Color
end

# Colors

struct Red <: Color end

struct Blue <: Color end

struct Yellow <: Color end

### Atom Functions

# Shape-shifting functions

function squareify(::Shape)
    return Square()
end

function squareify(x::Vector{T}) where {T<:Shape}
    return [Square() for _ in x]
end

function triangleify(::Shape)
    return Triangle()
end

function triangleify(x::Vector{T}) where {T<:Shape}
    return [Triangle() for _ in x]
end

function circleify(::Shape)
    return Circle()
end

function circleify(x::Vector{T}) where {T<:Shape}
    return [Circle() for _ in x]
end

# Copy

function copy(x::T, y::Integer) where {T<:Shape}
    return [T(x.color) for _ in 1:y]
end

# Paint

function paint(x::ST, y::CT) where {ST<:Shape, CT<:Color}
    return ST(CT())
end

function paint(x::Vector{ST}, y::CT) where {ST<:Shape, CT<:Color}
    return [ST(CT()) for _ in x]
end

# Number

function add(x::Integer, y::Integer)
    return x + y
end

### Test

r = Red()
s = Square(r)
println(s)
s = copy(s, 10)
println(s)
n = add(5,5)
s = copy(s, n)
