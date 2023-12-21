# Illustrating Measurement Error by Monte Carlo Simulation Approach
### Measurement error has been a concern for econometrician, data scienteist and statitistan working with any sort of dataset that causes bias result. In this section, we aims to illustrate the existence of the measurement in the dataset using Montel Carlo Simulation Approach for data generating process DGP. 
### We are given with a model where 
####                  *** y=1+0.5x+υ where  x∼N(1,1)  and  υ∼N(0,1) ***. The econometrician doesnot observe x but instead observesone(ortwo) of the following:
####                   x∗1 = x + e1 where e1 ∼ N(0,0.25) 
####                   x∗2 = x + e2 where e2 ∼ N(0,0.5) 
####                   x∗3 = x + e3 where e3 ∼ N(0,19)
### as we can see, in three different models, x is the function of x1, x2, and x3, with different variacen, wehre the x1 variance is the lowest and the x3 variacne is the largest
### considering the above conditions, we want to illustrate how x1, x2,and x3 with different errors represent x in the equation of y. 
### Employing "Monte Carlo Simulation" we generate 5o random simulation with 500 observation with each simualtion. then for each model (equation of x1, x2, and x3) we run the regression for all simulations. below we illustrate the regression summary of all three models:
### Model 1:
![image](https://github.com/mshirzad414/Measurement-Error-/assets/140922484/58715025-dffb-46fc-ae47-fe0027451956)

### Model 2:
![image](https://github.com/mshirzad414/Measurement-Error-/assets/140922484/cce72bb4-3c04-4477-a252-18c230104d13)

### Model 3: 
![image](https://github.com/mshirzad414/Measurement-Error-/assets/140922484/c98cd347-4c5c-4a32-aa6d-82dc4cd118fb)

###The three model above shows that the coefficient of x's in the y model varies, the higher variance or in other word measurement error, the larget the coeffient, theoritically, if control variable contains measurement error, then we observe bias result, the above three models shows that empiricially. 

### Next, we apply IV appraoch to test which x1,x2,and x3 is a good instrument for x in the y model. 
####below result shows the use of x3 as instrument for x1 
![image](https://github.com/mshirzad414/Measurement-Error-/assets/140922484/157e8683-ad1d-47bb-9fe2-a11ad9f5b297)

### in the last section, we illustrate how x2 and x3 differs in density, since x3 contains higher measurement error (e3 has higher variance) , then it shwos the density flatter, while the x2 wth lower standard erorr (lower e2) shows density more normal. 




