/*  
Bisman Preet Singh Sachar (bismansingh@gwu.edu)
 */

* Setting a new library;
libname assign  '/home/bismansingh0/Assignment_1';

* Step 0 - Setting a copy of  train data, offers data and transactions data;

data work.train; 
	set assign.train;
run;

data work.offers;
	set assign.offers;
run;

data work.transactions;
	set assign.transactions;
run;
	
* Step 1 - Removing repeattrips from train set;

proc sql noprint;
	alter table work.train drop repeattrips;
quit;

* Step 2 - Left join offers dataset onto the train dataset;

* Sorting train data;
proc sort 
	data=work.train
	out=work.train_sort;
	by offer;
run;

* Left join offers data set onto train data set;
data work.train1;
	merge work.train_sort(in=X) work.offers;
	by offer;
	if X;
run;

/* Step 3 - Getting merged training set and summarizing groups by 
average purchase quantity and average purchase amount */

* Sorting transactions data set;
proc sort data=work.transactions;
by id category;
run;

/* Grouping transactions data set by id and category, summarizing by average
purchase quantity and average purchase amount */
proc means data=work.transactions noprint;
var purchaseamount purchasequantity;
by id category;
output out = work.transactions_1 mean(purchasequantity)=pqavg mean(purchaseamount)=paavg;
run;

* Keeping required columns only;
data work.transactions_2;
set work.transactions_1 (keep=id category pqavg paavg);
run;

* Sorting train data set;
proc sort data=work.train1;
by id category;
run;

* Left join transactions data set on train data set;
data work.train2;
	merge work.train1(in=X) work.transactions_2;
	by id category;
	if X;
run;

* Standardize merged train data set by replacing missing values with zero;
proc stdize data=work.train2 reponly missing = 0 
out = work.train3;
var paavg pqavg;
run;


*Step 4 - Creating subset of train set & Export to csv;

*Creating subset of train data set;
data work.train4;
set work.train3;
if id < 107014607 and paavg > 0 and pqavg > 0;
run;

*Exporting data set in csv format;
proc export data=work.train4 outfile='/home/bismansingh0/Assignment_1/train_final.csv';
run;






