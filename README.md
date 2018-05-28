# IRNN: Iteratively Reweighted Nuclear Norm for Nonconvex Nonsmooth Low-rank Minimization

IRNN for solving the following nonconvex nonsmooth low-rank minimization problem

<a href="https://www.codecogs.com/eqnedit.php?latex=\min_{\mathbf{X}\in\mathbb{R}^{m\times&space;n}}&space;\sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))&plus;f(\mathbf{X})," target="_blank"><img src="https://latex.codecogs.com/gif.latex?\min_{\mathbf{X}\in\mathbb{R}^{m\times&space;n}}&space;\sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))&plus;f(\mathbf{X})," title="\min_{\mathbf{X}\in\mathbb{R}^{m\times n}} \sum_{i=1}^mg_{\lambda}(\sigma_i(\mathbf{X}))+f(\mathbf{X})," /></a>

where <a href="https://www.codecogs.com/eqnedit.php?latex=g_\lambda:$&space;$\mathbb{R}\rightarrow\mathbb{R}^&plus;" target="_blank"><img src="https://latex.codecogs.com/gif.latex?g_\lambda:$&space;$\mathbb{R}\rightarrow\mathbb{R}^&plus;" title="g_\lambda:$ $\mathbb{R}\rightarrow\mathbb{R}^+" /></a> is continuous, concave and monotonically increasing on <a href="https://www.codecogs.com/eqnedit.php?latex=[0,\infty)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?[0,\infty)" title="[0,\infty)" /></a>, and <a href="https://www.codecogs.com/eqnedit.php?latex=f" target="_blank"><img src="https://latex.codecogs.com/gif.latex?f" title="f" /></a> has Lipschitz continuous gradient.


codes for the following papers:

* Nonconvex Nonsmooth Low-Rank Minimization via Iteratively Reweighted Nuclear Norm, Canyi Lu, Jinhui Tang, Shuicheng Yan, Zhouchen Lin, IEEE Transactions on Image Processing (TIP). 2016
* Generalized Nonconvex Nonsmooth Low-Rank Minimization, Canyi Lu, Jinhui Tang, Shuicheng Yan, Zhouchen Lin, IEEE International Conference on Computer Vision and Pattern Recognition (CVPR) 2014: 4130-4137
