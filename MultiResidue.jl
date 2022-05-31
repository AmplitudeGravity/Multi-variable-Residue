using Symbolics
@variables x y
f=x^2 *y
function degree(f::Num)
    ls=Symbolics.value(f).dict;
    ls|>values|>collect|>sum
end

degree(f)





