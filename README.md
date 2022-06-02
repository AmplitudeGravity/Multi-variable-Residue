# Short introduction to multivariate residues(Math background and mathematica code)
This program is to calculate the multi-variable residue around zero-dimension intersection point. 
The main function is called "MultiResidue" which is used to calculate $$\text{Res}_{h_1=\cdots=h_r=0} ~ {f dz_1\wedge dz_2\wedge \cdots \wedge dz_r\over h_1 h_2\cdots h_r},$$
where $h_i$ is homogeneous polynomial function and the solution of $h_1=\cdots=h_r=0$ is an isolated point $p$. The $f$ function is regular at $p$.

```
MultiResidue[f, {h1, h2,..., hr}, {z1,z2,..., zr}]
```

More examples is included in the mathematica code. A julia package is still in development. This need to use CAS in julia, e.g.  [Symbolics.jl](https://github.com/JuliaSymbolics/Symbolics.jl) and/or  [SymEngine](https://github.com/symengine/SymEngine.jl).

For general in-homogeneous polynomial function, it is easy to transform to the homogeneous cases by a trick using the global residue theorem. For more details and citations, please
see and cite the origine papers [arxiv 1609.07621](https://arxiv.org/pdf/1609.07621.pdf) and [arxiv 1709.08503](https://arxiv.org/pdf/1709.08503.pdf).

# Examples for the julia code
```
ideals=[x, y*(x + y), x^2 + y*x + z*y]
ideals=[y - 2x + z, x^2 *y - x*z^2 + z^3, y^4 + x*y*z^2 - y^2*z^2 + z^4];
vars=[x,y,z]

MultiResidue((2x + 3y + 4z)/(z - 2),ideals,vars)
```

symbolic solution of linear equations
```
eqns=[x-y-1, 2(x + y)]
vars=[x,y]
solve(eqns,vars)
```

# Citation 
If you use **multiResidue.nb**, please cite the two papers [arxiv 1609.07621](https://arxiv.org/pdf/1609.07621.pdf) and [arxiv 1709.08503](https://arxiv.org/pdf/1709.08503.pdf) as following

```
@article{Chen:2016fgi,
    author = "Chen, Gang and Cheung, Yeuk-Kwan E. and Wang, Tianheng and Xu, Feng",
    title = "{A differential operator for integrating one-loop scattering equations}",
    eprint = "1609.07621",
    archivePrefix = "arXiv",
    primaryClass = "hep-th",
    doi = "10.1007/JHEP01(2017)028",
    journal = "JHEP",
    volume = "01",
    pages = "028",
    year = "2017"
}
```

```
@article{Chen:2017bug,
    author = "Chen, Gang and Wang, Tianheng",
    title = "{BCJ Numerators from Differential Operator of Multidimensional Residue}",
    eprint = "1709.08503",
    archivePrefix = "arXiv",
    primaryClass = "hep-th",
    doi = "10.1140/epjc/s10052-019-7604-8",
    journal = "Eur. Phys. J. C",
    volume = "80",
    number = "1",
    pages = "37",
    year = "2020"
}
```
