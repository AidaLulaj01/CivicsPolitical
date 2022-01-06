# CivicsPolitical
CU_FinalProject

Kuriwaki, Shiro complied voter survey data in .Rds file format for the years 2006–2018. The dataframe contains 452,755 rows (observations) and 73 columns (features), including geographic, demographic, economic, news interest, 
political affinity, and presidential choice variables.

The data was drawn from Cooperative Congressional Election Study (CCES), one of the most comprehensive political surveys in the US.

We will refine the data for the most recent survey year (2018), which indicates presidential choice for 2016. Using R and machine learning, we will develop a predictive model for presidential choice. 

We will divide 80% of the data into a “training section.” We will then use the remaining 20% for the “test” section of data. 

The input layer will be comprised of 148 variables fed to a neuron. These neurons will connect to a 100-neuron hidden layer. Finally, the output layer will consist of five categories (in accordance with the survey question 
structure): voted Trump, voted Hillary Clinton, Voted Other, Did not Vote, and Not Sure. 
