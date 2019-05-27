# Predictive-Modelling
This project involves data from an online retailer and develops predictive models using SAS studio and Enterprise Miner to analyse whether a shopper will be a repeat buyer. This predcition helps companies to send discount coupons to customers who are more likely to come again for shopping.

# Step 1 - Data Manipulation, joins and aggreagation

For this program, we'll use SAS studio. The data files in the File1 folder contains 3 datasets viz.

offers – contains information about promotions, 6 columns, 37 rows
train – contains information about shoppers, 7 columns, 160057 rows
transactions – contains information about transactions, 4 columns, 3499628 rows

In the train data, let's choose the target variables as repeater, which is a binary variable and signifies whether a shopper is a repeat shopper.  We can drop repeattrips, which is a numeric variable and indicates the number of times a shopper repeats. This was done to solve the simpler problem of whether a shopper will be a repeat buyer. Then, Left join the offers dataset onto the train dataset. 

Finally, we must summarize the transactions set by grouping the transaction set by id and category and summarize the groups by averaging the purchasequantity and purchaseamount variables. Then left join the summarized set onto the train dataset by id and category. Replace missing values with 0 as missingness in this case simply indicates the customer has purchased 0 items, costing 0 dollars. After this step, we get the final joined training set that we'll use in the next file.

# Data Modelling - Predictive Modelling and Segmentation

For this program, we'll use SAS Enterprise Miner. Let's start by splitting the joined data from above file into train, validate, and test partitions. Then, we'll use interactive grouping to encode the rejected high-cardinality variables using the weight of evidence technique, which is similar to target encoding. Then we'll develop various models - LARS, Regression, Neural Network, HP Forest, Gradient Boosting, Decision Tree to compare various models for the right prediction. We can use model selection criteria as Lift and finally scored the model. We can also do segmentation analysis to profile the customers by using HPDM Cluster node. 

Here's the screenshot of the model.

[![model.jpg](https://i.postimg.cc/c468ckG9/model.jpg)](https://postimg.cc/xcDCfRCM)

# Results
After running prediction model, we can see some interesting results below for our shoppers data -

1) Brand and woe_offer appears to be the most important interaction in the trained decision tree model.

2) Brand = 64486 has the largest impact on the odds of a customer being a repeat shopper.

3) Most important variable in the LASSO model is woe_offer

4) Neural Network node selected the best model at iteration no. 26

5) LASSO/LARS/Penalized regression model is the best model as assessed by the criterion of test lift at the 10th decile.

6) Highest lift two-item rules - 9609 ==> 0 and 0 ==> 9609



