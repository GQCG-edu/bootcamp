<p align="center">
<img src="../media/projects.png" width="350">
</p>

> This project assumes that you have a working knowledge of linear algebra and the Hartree-Fock methodology. If you need a refresher, consult the [3Blue1Brown linear algebra playlist](https://www.3blue1brown.com/topics/linear-algebra) and the [TMP Chem Hartree-Fock playlist](https://www.youtube.com/watch?v=B3D_WZ3NbbM&list=PLm8ZSArAXicIijiVIx0yfk2ZOK-16ycji).

[PySCF](https://pyscf.org/index.html) is an ab initio computational chemistry package that allows users access to many internal objects needed for quantum chemical method development. In this capstone project, you will first implement [Restricted Hartree-Fock](rhf.ipynb) *using the integrals offered by PySCF*. As a follow-up, you will implement (part) of the required [integrals](integrals.ipynb), so that you are able to obtain a converged Hartree-Fock solution starting from only the specification of the molecular framework and the underlying [basis set](https://www.basissetexchange.org/).

> Note: use as many of the techniques you have learned as possible. This entails but is not limited to
> - writing a final LaTeX report on your implementation in your forked repo
> - contributing back to the bootcamp by mentioning issues with the current version of the bootcamp (or even writing PRs that resolve them!)

> Note: this project is heavily influenced by and uses materials from the excellent [Psi4Numpy](https://github.com/psi4/psi4numpy) tutorials.
