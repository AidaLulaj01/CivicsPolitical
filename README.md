# CivicsPolitical

## Introduction

Do social characteristics and behavior predict presidential voter choice? We propose the following analysis to find out. We selected this topic because in a politically polarized society, understanding underlying drivers for political decisions may be useful in bringing about a more balanced and cooperative political culture.


## Data source

Kuriwaki, Shiro complied voter survey data in .Rds file format for the years 2006–2018. The dataframe contains 452,755 rows (observations) and 73 columns (features), including geographic, demographic, economic, news interest, political affinity, and presidential choice variables.

The data was drawn from Cooperative Congressional Election Study (CCES), one of the most comprehensive political surveys in the US.

The data set is divided then joined along the following parameters from the CSVs(find the files into the DATA folder):   

## Database Entity Relationship Diagram (ERD)
![ERD](./DB/ERD.png)


## Data Exploration, preprocessing, and methodology

We will refine the data for the most recent survey year of 2018, which holds 60,000 rows and 93 features. The data pertains to voter information, ideological leaning, voter opinion, district information and candidate information. For the machine learning model, we will be using the following features in a dataframe:
 
State, district, cong., geography, gender, birthyear, age, education, race, family income, marital status, news interests, ideology, and presidential vote for 2016. Since the database contains a lot of features with categorical data,  then one-hot encode those variables into dummy sets (Using the dummy_cols and fastDummies packages). 

After the features have been given a numeric value, the output features which is the 2016 presidential vote will be removed from the dataframe. The data is separated into training and test sets, the model is then trained.

Layers:

For the input layer of the model, the activation function is ReLu (Rectified Linear Unit) since this is a category classification, it will be comprised of 148 variables fed to a neuron. 

For the hidden layer the activation function that was used is softmax. For compiling and training the model, the optimizer algorithm used is adam and the loss function that is used is sparse categorical crossentropy. The model will also have 20% of its training data for the model to iteratively calculate validation errors. 500 epochs are chosen for lastly the algorithm will stop if the test model performance doesn’t increase for 20 continuous epochs. 

The output layer will consist of five categories (in accordance with the survey question structure): voted Trump, voted Hillary Clinton, Voted Other, Did not Vote, and Not Sure/Don't Recall. 


Neural Network Pros & Cons

Neural networks form the basis of DL, and applications are enormous for DL, ranging from voice recognition to cancer detection. The pros and cons of neural networks are described in this section. The pros outweigh the cons and give neural networks as the preferred modeling technique for data science, machine learning, and predictions.

Pros
The following are some of the advantages of neural networks:

Neural networks are flexible and can be used for both regression and classification problems. Any data which can be made numeric can be used in the model, as neural network is a mathematical model with approximation functions.
Neural networks are good to model with nonlinear data with large number of inputs; for example, images. It is reliable in an approach of tasks involving many features. It works by splitting the problem of classification into a layered network of simpler elements.
Once trained, the predictions are pretty fast.
Neural networks can be trained with any number of inputs and layers.
Neural networks work best with more data points.
Cons
Let us take a look at some of the cons of neural networks:

Neural networks are black boxes, meaning we cannot know how much each independent variable is influencing the dependent variables.
It is computationally very expensive and time consuming to train with traditional CPUs.
Neural networks depend a lot on training data. This leads to the problem of over-fitting and generalization. The mode relies more on the training data and may be tuned to the data.
