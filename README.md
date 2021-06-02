# Exploratory-Data-Analysis-with-R
Section I. Data cleaning:

Read in the Facebook data hosted here: link 

Get an initial understanding of how the data is structured. What are the dimensions? Are the variables in appropriate data types? Convert them if needed (refer to Tables 2 & 3 for variable descriptions).

The “Category” variable represents the post’s marketing purpose (“action” is defined as special offers and contests, “product” as direct advertisements, and “inspiration” as indirect brand-related content). Recode the values from 1 to “action”, 2 to “product”, and 3 to “inspiration”.

The “Paid” variable indicates whether the company paid Facebook to advertise the particular post. Recode the values from 0 to “non-paid” and 1 to “paid”.

How many missing values do we have in the dataset? Remove them for the time being.

Section II. Univariate analysis: 

In digital marketing, the number of shares a Facebook post gets is commonly used as a measure of the post’s effectiveness in engaging consumers. What do the descriptive statistics (min/max, mean/median, Q1/Q3, standard deviation) for “share” tell us about the cosmetic company’s social media performance? 

Plot a histogram of the “share” variable using the hist( ) function. 
Label the x and y axes using the xlab and ylab parameters. Create a title for the plot using the main parameter. Adjust the breaks parameter to get a more detailed look at the distribution (breaks=100)
What does the plot tell us about the distribution of shares? Any outliers? Adjust the xlim parameter to examine the 0-200 range on the x-axis. What range of shares do most posts tend to fall in? 

Use descriptive statistics and bar plots to examine the following categorical variables:
Do we see any trends in posting frequency by month?
Which “category” of post does the company most frequently make? Least?
What proportion of posts were paid for Facebook to advertise them?

Section III. Bivariate analysis:

Create a scatterplot of shares against likes. What is the relationship between these two performance metrics?

Using a boxplot, compare shares by month to examine how posts are performing based on when they are published. Consider adjusting the ylim parameter to get a more detailed look. What is a key insight you could give the company from this plot?

The company wants to know whether they should continue spending money on paid advertising for their posts. 
Use xtabs( ) and aggregate( ) functions to compare performance (shares) between paid and non-paid posts. 
Compare performance between paid and non-paid posts using boxplots.
Based on your interpretation of these results, what would you recommend the company do with paid posts?

Section IV. Multivariate analysis:

The marketing team wants to evaluate how paid vs non-paid posts perform based on the category (whether it’s an action, product, or inspiration post).
Create a 1x3 panel plot comparing shares between paid and non-paid posts for each category.
What insight could you provide the marketing team from this? 
