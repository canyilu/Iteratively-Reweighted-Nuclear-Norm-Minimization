## IRNN: Iteratively Reweighted Nuclear Norm for Nonconvex Nonsmooth Low-rank Minimization

### Introduction


The nuclear norm is widely used as a convex surrogate of
the rank function in compressive sensing for low rank matrix
recovery with its applications in image recovery and signal
processing. However, solving the nuclear norm based relaxed
convex problem usually leads to a suboptimal solution of the
original rank minimization problem. In this paper, we propose to
use a family of nonconvex surrogates of <a href="https://www.codecogs.com/eqnedit.php?latex=\ell_0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\ell_0" title="\ell_0" /></a>-norm on the singular
values of a matrix to approximate the rank function. This leads to
a nonconvex nonsmooth minimization problem. Then we propose
to solve the problem by Iteratively Reweighted Nuclear Norm
(IRNN) algorithm. IRNN iteratively solves a Weighted Singular
Value Thresholding (WSVT) problem, which has a closed form
solution due to the special properties of the nonconvex surrogate
functions. We also extend IRNN to solve the nonconvex problem
with two or more blocks of variables. In theory, we prove that
IRNN decreases the objective function value monotonically, and
any limit point is a stationary point. Extensive experiments on
both synthesized data and real images demonstrate that IRNN
enhances the low rank matrix recovery compared with state-of-
the-art convex algorithms.


IRNN solves the following nonconvex nonsmooth low-rank minimization problem

<a href="https://www.codecogs.com/eqnedit.php?latex=\min_{\mathbf{X}\in\mathbb{R}^{m\times&space;n}}&space;\sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))&plus;f(\mathbf{X})," target="_blank"><img src="https://latex.codecogs.com/gif.latex?\min_{\mathbf{X}\in\mathbb{R}^{m\times&space;n}}&space;\sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))&plus;f(\mathbf{X})," title="\min_{\mathbf{X}\in\mathbb{R}^{m\times n}} \sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))+f(\mathbf{X})," /></a>

where <a href="https://www.codecogs.com/eqnedit.php?latex=g_\lambda:$&space;$\mathbb{R}\rightarrow\mathbb{R}^&plus;" target="_blank"><img src="https://latex.codecogs.com/gif.latex?g_\lambda:$&space;$\mathbb{R}\rightarrow\mathbb{R}^&plus;" title="g_\lambda:$ $\mathbb{R}\rightarrow\mathbb{R}^+" /></a> is continuous, concave and monotonically increasing on <a href="https://www.codecogs.com/eqnedit.php?latex=[0,\infty)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?[0,\infty)" title="[0,\infty)" /></a>, and <a href="https://www.codecogs.com/eqnedit.php?latex=f" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f" title="f" /></a> has Lipschitz continuous gradient.

Our work [1] is the first work which considers such a general nonconvex nonsmooth low-rank minimization problem. It is further extended to the journal version [2]. We also propose a faster solver by using generalized singular value thresholding in [3] for solving the same problem.

The nonconvex function <a href="https://www.codecogs.com/eqnedit.php?latex=g_{\lambda}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?g_{\lambda}" title="g_{\lambda}" /></a> is the nonconvex surrogate of the <a href="https://www.codecogs.com/eqnedit.php?latex=\ell_0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\ell_0" title="\ell_0" /></a>-norm. Some known examples are given in Table 1 and Figure 1 below. By applying <a href="https://www.codecogs.com/eqnedit.php?latex=g_{\lambda}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?g_{\lambda}" title="g_{\lambda}" /></a> on the singular values, <a href="https://www.codecogs.com/eqnedit.php?latex=\sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))" title="\sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))" /></a> becomes to the nonconvex surrogate function of matrix rank. See the manifolds of some nonconvex surrogates in Figure 2 below. 


<p align="center"> 
<img src="https://github.com/canyilu/Iteratively-Reweighted-Nuclear-Norm-Minimization/blob/master/table_l0_surrogate.JPG" width="600">
</p>

<p align="center"> 
<img src="https://github.com/canyilu/Iteratively-Reweighted-Nuclear-Norm-Minimization/blob/master/figure_l0_surrogate.JPG" width="1000">
</p>

<p align="center"> 
<img src="https://github.com/canyilu/Iteratively-Reweighted-Nuclear-Norm-Minimization/blob/master/figure_rank_surrogate.JPG" width="1000">
</p>



### References
<ol>
<li> Generalized Nonconvex Nonsmooth Low-Rank Minimization, Canyi Lu, Jinhui Tang, Shuicheng Yan, Zhouchen Lin, IEEE International Conference on Computer Vision and Pattern Recognition (CVPR) 2014: 4130-4137

<li> Nonconvex Nonsmooth Low-Rank Minimization via Iteratively Reweighted Nuclear Norm, Canyi Lu, Jinhui Tang, Shuicheng Yan, Zhouchen Lin, IEEE Transactions on Image Processing (TIP). 2016

<li> Generalized Singular Value Thresholding, Canyi Lu, Changbo Zhu, Chunyan Xu, Shuicheng Yan and Zhouchen Lin, AAAI Conference on Artificial Intelligence (AAAI), 2015
  
</ol>

