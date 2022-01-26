# CivicsPolitical

## Introduction

Do social characteristics and behavior predict presidential voter choice? We propose the following analysis to find out. We selected this topic because in a politically polarized society, understanding underlying drivers for political decisions may be useful in bringing about a more balanced and cooperative political culture. The analysis determines if social, fiscal, media-choice, demographic, and other factors are predictive of if a voter cast a ballot for Donald Trump in the 2018 election.


## Data source

Kuriwaki, Shiro complied voter survey data in .Rds file format for the years 2006–2018. The dataframe contains 452,755 rows (observations) and 73 columns (features), including geographic, demographic, economic, news interest, political affinity, and presidential choice variables.

The data was drawn from Cooperative Congressional Election Study (CCES), one of the most comprehensive political surveys in the US.

The data set is divided then joined along the following parameters from the CSVs(find the files into the DATA folder):   

### Database Entity Relationship Diagram (ERD)
![ERD](./DB/ERD.png)



## Data Exploration

The dataframe contains election survey data going back to the year 2006. For the neural analysis we will be focusing on the year 2018, it holds 60,000 rows and 93 features. Most of the data pertains to voter information, ideological leaning, voter opinion, candidate information, and voter choice.

The database contains a plethora of survey information given from many voters. We decided to choose features from the database that would represent social and political demographics that could sway a voter to choose one candidate over another. The features that were chosen were:  voter’s state, gender, furthest education, race, family income, employment status, marital status, news interest, gauge of presidential approval, political ideology, and lastly the target feature presidential vote.

<img width="838" alt="Screen Shot 2022-01-25 at 11 01 34 PM" src="https://user-images.githubusercontent.com/88690258/151101948-a2a3bd9b-db2b-4028-bcd8-f5eea49e23ea.png">


<img width="384" alt="Screen Shot 2022-01-25 at 11 01 49 PM" src="https://user-images.githubusercontent.com/88690258/151101968-c9d329bf-da1d-461b-84a1-2bb02e266b9a.png">




The database did not contain a uniform data type so many of the features that are chosen for the analysis are categorical. We have opted to use a simple neural network to predict voter outcome, but before that some data preprocessing was needed to make the training and test data sets to feed into the machine learning model. Some features contained a significant number of unique values compared to others. To take on this issue we used pandas get dummies function since it turns string columns into multiple numeric value columns. With the features ready they were then split into input features and the target array. A StandardScaler instance was created to transform the data to have its distribution and standard deviation more uniform.

## Machine Learning Model:

### Neural Network Pros & Cons

Neural networks form the basis of Deep Learning (DL) with a range of application usage such as voice recognition to cancer detection. The pros and cons of neural networks are described in this section. The pros outweigh the cons and give neural networks as the preferred modeling technique for data science, machine learning, and predictions.

**Pros**

Neural networks are flexible and can be used for both regression and classification problems. Any data which can be made numeric can be used in the model, as neural network is a mathematical model with approximation functions.
Neural networks are good to model with nonlinear data with large number of inputs; for example, images. It is reliable in an approach of tasks involving many features. It works by splitting the problem of classification into a layered network of simpler elements.
Once trained, the predictions are pretty fast.
Neural networks can be trained with any number of inputs and layers.
Neural networks work best with more data points.

**Cons**

Neural networks are black boxes, meaning we cannot know how much each independent variable is influencing the dependent variables.
It is computationally very expensive and time consuming to train with traditional CPUs.
Neural networks depend a lot on training data. This leads to the problem of over-fitting and generalization. The mode relies more on the training data and may be tuned to the data.

### Explanation of the Model and Evalution

This type of analysis gears towards a classification model, we used the Keras sequential model. This model is used for the task because of its simplicity to design a neural network and minimal user action. The input layer will contain the features that have been used to train the model. To get a better accuracy we will use two hidden layers with activation function Relu (Rectified Linear Unit). ReLu is used due to its simplicity compared to other activation functions, it also takes into account the non-linear relationship between the features selected. To follow suit with another neural analysis that inspired this analysis the first hidden layer will have 148 neurons and the second hidden layer will have 100 neurons. The output layer used was the sigmoid activation function we are trying to predict whether a voter chose one president over another. 

<img width="562" alt="Screen Shot 2022-01-25 at 10 59 42 PM" src="https://user-images.githubusercontent.com/88690258/151101814-d69d926f-5d76-464b-a857-6f044725e992.png">



The defined model is now compiled with the following parameters:
Optimizer parameter is adam, used due to the volume of data rows within each feature.
Loss parameter is sparse_categorical_crossentropy because this is a binary classification model after the preprocessing stage. 
The model is then trained, traditionally neural networks have a high number of epochs, for this analysis we chose 500 epochs to see if we can get a higher accuracy score. Afterwards the model is evaluated, and the loss percentage was 2.22 with an accuracy of 90.4%.  

<img width="621" alt="Screen Shot 2022-01-25 at 10 58 34 PM" src="https://user-images.githubusercontent.com/88690258/151101751-02d0ff74-ee9d-496c-b84c-1f14acdaf72e.png">

With this return value the model does a fairly good job of predicting voter preference. This is taking into regards that the outcome column “voted_pres_16” was manipulated into unique values if the surveyor voted for one president or other. Originally the database contained many categorical answers which would make fitting into the machine learning model more difficult.  This is a simple model compared to what organizations in the political sphere and thinktanks would use for voter prediction. 

### Analysis

#### Voter Choice

![fig3](https://github.com/AidaLulaj01/CivicsPolitical/blob/8c8e49a216cdad51930763b06d3d69f041452d0d/images/fig3.png)

In this figure, we can see from our data that the largest share of voters, approximately 22,000 people, voted for Hilary Clinton. The second largest share of voters, approximately 19,800 people, voted for Donald Trump. Approximately 4,500 people voted for someone else other than Clinton or Trump, and less than 1,000 people did not vote. Unfortunately, a considerable portion of the data is Not Available. 



#### Employment

![fig4](https://github.com/AidaLulaj01/CivicsPolitical/blob/8c8e49a216cdad51930763b06d3d69f041452d0d/images/fig4.png)

Looking at the employment status of voters, we can see that the people that voted the most were full-time employees and retired people. Part-time workers and homemakers ranked third and fourth, respectively. It is interesting to note that students and unemployed people have very low voting rates. This indicates that future analysis might be done to determine why certain demographics have lower voting turnout. 



#### Age vs. Ideology

![fig1](https://github.com/AidaLulaj01/CivicsPolitical/blob/8c8e49a216cdad51930763b06d3d69f041452d0d/images/fig1.png)

This figure shows the average age of people voting for each ideology. We can see that the average age of Very Conservative and Conservative voters is 55 and 53, respectively, which also seem to be the older people from our dataset. We can also observe that the younger people are, the more likely they are to be Not Sure regarding their ideology, Liberal, and Very Liberal. The average age of Moderate voters falls, as expected, between the average of Liberal and Conservative voters.



#### Race vs. President Approval

![fig2](https://github.com/AidaLulaj01/CivicsPolitical/blob/8c8e49a216cdad51930763b06d3d69f041452d0d/images/fig2.png)

In this image, we can see the approval of the president based on each race.

### Presentation slides
https://docs.google.com/presentation/d/1uR1uyg7Ha2fiDcW7krFO_xvlTzNGH14D/edit#slide=id.p1
