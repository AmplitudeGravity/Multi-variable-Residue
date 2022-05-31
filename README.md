# Multi-variable-Residue
This program is to calculate the multi-variable residue around zero-dimension intersection point. 
The main function is called "MultiResidue" which is used to calculate $$\text{Res}_{h_1=\cdots=h_r=0} ~ {f dz_1\wedge dz_2\wedge \cdots \wedge dz_r\over h_1 h_2\cdots h_r},$$
where $h_i$ is homogeneous polynomial function and the solution of $h_1=\cdots=h_r=0$ is an isolated point $p$. The $f$ function is regular at $p$.

```
MultiResidue[f, {h1, h2,..., hr}, {z1,z2,..., zr}]
```

More examples is included in the mathematica code. 

For general in-homogeneous polynomial function, it is easy to transform to the homogeneous cases by a trick using the global residue theorem. For more details and citations, please
see and cite the origine papers [arxiv 1609.07621](https://arxiv.org/pdf/1609.07621.pdf) and [arxiv 1709.08503](https://arxiv.org/pdf/1709.08503.pdf).
