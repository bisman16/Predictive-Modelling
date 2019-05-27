# Predictive-Modelling
This project involves data from an online retailer. I did predictive modelling using SAS studio and Enterprise Miner to analyse whether a shopper will be a repeat buyer. This predcition helps companies to send discount coupons to customers who are more likely to come again for shopping.


# Data Manipulation, joins and aggreagation

For this program, I used SAS studio. The data files in this folder contains 3 datasets viz.

offers – contains information about promotions, 6 columns, 37 rows
train – contains information about shoppers, 7 columns, 160057 rows
transactions – contains information about transactions, 4 columns, 3499628 rows

In the train data, I chose the target variables as repeater, which is a binary variable which signifies whether a shopper is a repeat shopper. I dropped repeattrips, which is a numeric variable which indicates the number of times a shopper repeats. This was done to solve the simpler problem of whether a shopper will be a repeat buyer. Then, Left join the offers dataset onto the train dataset. 

Finally, we must summarize the transactions set by grouping the transaction set by id and category and summarize the groups by averaging the purchasequantity and purchaseamount variables. Then left join the summarized set onto the train dataset by id and category. Replace missing values with 0 as missingness in this case simply indicates the customer has purchased 0 items, costing 0 dollars. After this step, we get the final joined training set that we'll use in the next file.

# Data Modelling - Predictive Modelling and Segmentation

For this program, I used SAS Enterprise Miner. I started by splitting the joined data from aboe file into train, validate, and test partitions. Then, I used interactive grouping to encode the rejected high-cardinality variables using the weight of evidence technique,
which is similar to target encoding. Then I developed various models - LARS, Regression, Neural Network, HP Forest, Gradient Boosting, Decision Tree to compare various models for the right prediction. I used model selection criteria as Lift and finally scored the model. I also did segmentation analysis to profile the customers by using HPDM Cluster node. 

Here's the screenshot of the model.

[![model.jpg](https://i.postimg.cc/c468ckG9/model.jpg)](https://postimg.cc/xcDCfRCM)

# Results
