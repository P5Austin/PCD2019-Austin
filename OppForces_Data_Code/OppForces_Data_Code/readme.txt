OppForces Model Data & Code: Overview and Instructions



Data & R Code
—————————————————

Exp_1.csv and Exp_2.csv contain all data used to conduct the analyses reported in Experiments 1 and 2 of this article, respectively.  The R file (OppForces.r) contains the code necessary to reproduce all figures from this article.  The R software needed to run these analyses is freely available at http://www.r-project.org. Once R is installed, be sure to install the “abind” package before running the code. 


Model_Visualization Folder
—————————————————

This folder contains “single-run” computer code for exploring the model one run at a time.  The model parameters of anticonformity levels, initial opinion distribution, and noise can be easily changed to get an understanding of the parameters and how they affect the system dynamics.

1.) Install Processing (http://www.processing.org).
2.) Open model_visualization folder.
3.) Double click modle_visualization.pde
(optional) Adjust parameters.*,**
4.) Press the Play button.
5.) Enjoy the simulation!
6.) An output file will be generated for your simulation in the directory. 

*Relevant parameter definitions/ranges:
	RatioA: Number of reds in the array at the start of the simulation (where red represents one of two possible opinions). This is used to set “Initial support for minority opinion.” However, because the range is [0,1] the relevant range is [0,.5] (i.e., a 70:30 initial opinion distribution displays the same behavior as a 30:70 initial opinion distribution).
	RatioB: The percent of anticonformists in the population. Range is [0,1].
	Noise: The amount of random influence on the simulation (e.g. Noise=1 is essentially the equivalent of one random neighbor). Range [0,8], although Noise>4 loses almost all meaningful interpretability.
	STOPAfter: The number of steps to run in the simulation.

**Parameters that are included in the model for future analyses that were not explored for this paper. 
	N: The number of elements on each side of the square lattice (Number of agents equals N squared). Range is any number greater than 5, although the meaningful range is probably [25,150]. (We used N=75.)
	MaxStrength: This is the max strength of each agent. We did not explore this parameter in the reported results. (This is only relevant if Distribution does not equal 0.)
	Distribution: 1 and -1 mean flat distribution, 0 means no difference, negative is a Pareto distribution, and positive is a Gaussian. Range is [-5,5].
	UseLogDraw: Boolean used to determine whether or not to use a logarithmic visualization for agent strengths.
	M: How often to calculate statistics to be exported and how often to export a .png (if DumpScreens=True). Range is [0,StopAfter]
	DumpScreens: boolean used to determine whether or not to export a .png file of the visualization, whenever statistics are calculated. 
	Bias: Range is [-8,8] although the meaningful range is much narrower. A Bias of 0 is neutral. This creates a general bias towards a particular opinion.



Model_Multirun Folder
————————————————— 

This folder contains “multi-run” computer code for generating data needed for repeated runs of the model across different model configurations for purposes of replicating the research results.  

1.) Install Processing.
2.) Open model_visualization folder.
3.) Double click model_multirun.pde 
4.) Adjust parameters for variable walks
5.) Press the Play button.
6.) An output file will be generated for your simulations.

