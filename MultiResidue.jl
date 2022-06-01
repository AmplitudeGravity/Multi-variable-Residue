using SymEngine
using LinearAlgebra
@vars x y z my
function degree(f::Basic)
      if SymEngine.get_symengine_class(f)==:Add
             ls=get_args(f); 
             degvec = Array{Int64}(undef, length(ls))
             for i=1:length(ls)
                  degvec[i]=degree(ls[i])
             end
             maximum(degvec)
      elseif SymEngine.get_symengine_class(f)==:Mul;
            ls=get_args(f); 
             degvec = Array{Int64}(undef, length(ls))
             for i=1:length(ls)
                  degvec[i]=degree(ls[i])
             end
             sum(degvec)
      elseif SymEngine.get_symengine_class(f)==:Pow
            ls=get_args(f); 
            ls[2]*degree(ls[1])
      elseif SymEngine.get_symengine_class(f)==:Symbol
            1
      else 
            0
      end
end
int(x) = floor(Int, x)
function FrobeniusSolve(vec::Vector{Int64},vs::Int64)
      res=[];
      js=vs ./vec.|>int;
      for i in Iterators.product((0:k for k in js)...)
             dot(vec,i)==vs ? push!(res,i) : nothing
      end
      res
end
function gd(f::Basic,var::Basic,order::Int64)
      xs=fill(var,order);
      diff(f,xs...)
end
function gd(f::Basic,vars::Vector{Basic},orders::Vector{Int64})
      g=f
      for i=1:length(vars)
            g=gd(g,vars[i],orders[i])
      end
      g
end
@funs g

gd(g(x,y,z),[x,y,z],[2,3,2])



subs(gd(g(x,y,z),[x,y,z],[2,3,2]),g(x,y,z)=>1//(x+2y+z))
diff(1//(x^2-y-z),x,x,y,y,z,z)

FrobeniusSolve([12, 16, 20, 27],133)
[12; 16; 20; 27]|>typeof
