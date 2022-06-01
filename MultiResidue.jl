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
function FrobeniusSolve(vec::Array{Int64},vs::Int64)
      res=[];
      js=vs ./vec.|>int;
      for i in Iterators.product((0:k for k in js)...)
             dot(vec,i)==vs ? push!(res,i) : nothing
      end
      res
end
f=y^5*x^3//(z^2+1)+x^4-y^4-z*x*y+2//3

@funs g
diff(f,x)
g = SymFunction("g")
diff(1//(x^2-y-z),x,x,y,y,z,z)

FrobeniusSolve([12, 16, 20, 27],1233)
