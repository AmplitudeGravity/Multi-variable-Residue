(* ::Package:: *)

(* ::Section::Closed:: *)
(*Copyright*)


(* ::Text:: *)
(*Copyright 2016-2017, Gang Chen and Tianheng Wang*)
(*This program is distributed under the terms of the GNU General Public License.*)


(* ::Section:: *)
(*Functions*)


deg[f_,var_List]:=Max[Plus@@@CoefficientRules[#,var][[All,1]]]&@(f)
homogenize[f_,var_List,w_]:=Block[{highest,homoN,numList},highest=deg[f,var];
numList=MonomialList[f,var];
 Sum[numList[[j]] w^(highest-deg[numList[[j]],var]),{j,Length@numList}]]


GD[f_,s_List,var_List]:=Module[{i,df=f},For[i=1,i<= Length[s],i++,df=D[df,{var[[i]],s[[i]]}];];Return[df]]


\[DoubleStruckCapitalD][f_,var_List,d_Integer]:=Block[{n=Length@var,par,i},par=FrobeniusSolve[Table[1,{j,n}],d];Sum[(a@@par[[j]]) GD[f,par[[j]],var],{j,Length@par}]]


localDual[fun_,var_List,order_Integer]:=
Block[{len=Length@var,degree=deg[fun,var],diff=order-deg[fun,var],comb},comb=FrobeniusSolve[Table[1,{l,len}],diff];(v/@comb) fun]


homoEqn[ideal_List,var_List,order_Integer]:=Module[{f,f2},f=Table[localDual[ideal[[i]],var,order],{i,Length@ideal}]//Flatten;
f2=f/.{v[a_List]:>If[Length[a]==0,1,Product[Power[var[[l]],a[[l]]],{l,Length@a}]]};
Union@Table[\[DoubleStruckCapitalD][f2[[i]],var,order],{i,Length@f}]]
inhomoEqn[ideal_List,var_List,order_Integer]:=Module[{matrix=Table[D[ideal[[i]],var[[l]]],{i,Length@ideal},{l,Length@var}]},\[DoubleStruckCapitalD][Det@matrix,var,order]]



homoRank[ideal_List,var_List,id_List,order_Integer]:=Module[{homo=homoEqn[ideal,var,id,order],coef},coef=Table[(Normal@CoefficientArrays[homo[[l]],var])[[2]],{l,Length@homo}];MatrixRank[coef]]


eqnAnsatz[ideal_List,var_List,order_Integer]:=Module[{inter=Product[deg[ideal[[i]],var],{i,Length@ideal}],homo,inhomo},
homo=homoEqn[ideal,var,order];inhomo=inhomoEqn[ideal,var,order];
Union[Table[homo[[i]]==0,{i,Length@homo}],{inhomo==inter}]]


MultiResidue[num_,homoideal_,var_]:=Module[{dOrder,coeqn,aVar,solbv,varszero},dOrder=Total[Table[deg[homoideal[[i]],var],{i,Length[homoideal]}]]-Length[var];
coeqn=eqnAnsatz[homoideal,var,dOrder];
aVar=a/@(FrobeniusSolve[Table[1,{j,Length@var}],dOrder])/.a[{b___}]:>a[b];
solbv=Solve[coeqn,aVar];
(*Print[coeqn,solbv];*)
varszero=Rule[#,0]&/@var;
If[solbv=={},Print["nonzero dimension intersection"],\[DoubleStruckCapitalD][num,var,dOrder]/.solbv[[1]]/.varszero]
]
