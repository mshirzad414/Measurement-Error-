# Illustrating Measurement Error by Monte Carlo Simulation Approach
### Measurement error has been a concern for econometrician, data scienteist and statitistan working with any sort of dataset that causes bias result. In this section, we aims to illustrate the existence of the measurement in the dataset using Montel Carlo Simulation Approach for data generating process DGP. 
### We are given with a model where 
####                  *** y=1+0.5x+υ where  x∼N(1,1)  and  υ∼N(0,1) ***. The econometrician doesnot observe x but instead observesone(ortwo) of the following:
####                   x∗1 = x + e1 where e1 ∼ N(0,0.25) 
####                    x∗2 = x + e2 where e2 ∼ N(0,0.5) 
####                    x∗3 = x + e3 where e3 ∼ N(0,19)
### as we can see, in three different models, x is the function of x1, x2, and x3, with different variacen, wehre the x1 variance is the lowest and the x3 variacne is the largest
### considering the above conditions, we want to illustrate how x1, x2,and x3 with different errors represent x in the equation of y. 
