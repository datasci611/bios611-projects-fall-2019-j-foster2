Analysis of Urban Ministries of Durham Data
================
Joseph Foster
10/07/2019

### Motivation of Study

Urban Ministries of Durham (UMD) is helping to end homelessness through
the distribution of food, providing shelter, and helping develop
futures. Here I aim to assess how well the organization has distributed
food in the past, and what factors may have influenced that
distribution.

### Report

I first looked at how much food was distributed annually from 2006 to
current date. What I found was the total annual food provided has
increased over the last 5 years, and has been trending upward since
2006. Note data collection from the current year 2019 is likely
incomplete and is probably driving the reported reduction of food
provided to clients. Nonetheless, these data may be helpful for UMD when
pitching to new funding sources, as they can show the the organization’s
ability to provide more food to clients
year-to-year.

<img src="project_1_files/figure-gfm/fig1-1.png" style="display: block; margin: auto;" />

Given the upward trend in total food distribution over the last decade I
next looked to see how that food was distributed on a client-by-client
basis. To understand how much food was being distributed per
transaction, I looked at the distribution of food received during each
interaction for every year over the past 13 years. The average amount of
food given at each distribution has been stable for nearly a decade.
This analysis also suggests UMD has done well at reducing any outlier
food allotments since 2011. Taken together these data may suggest the
operation procedures driving food distribution are helping to create an
equality in the distribution of
food.

<img src="project_1_files/figure-gfm/fig2-1.png" style="display: block; margin: auto;" />

I next sought to determine if other variables impacted how UMD is
distributing food. Specifically, to understand if paying a bill impacts
the amount of food received per interaction, I looked at the amount of
food received per interaction on an annual basis for individuals who
reported paying a bill and those who did not. Over the past 13 years,
only two years showed a significant difference (2006, 2008) in the
amount of food received when the client also reported paying a bill
(Wilcoxn rank sum test, ns: p \> 0.05, \* p \<= 0.05, \*\* p \<= 0.01).
However, these data shouldn’t be over interpreted as there were only 127
interactions where a bill was reported as paid, while there were over
65,000 interactions included in this analysis with no mention of paying
bills.

<img src="project_1_files/figure-gfm/fig-1.png" style="display: block; margin: auto;" />

### Conclusion

In summary, over the past decade UMD has been able to increase the total
amount of food reaching its clients, while also holding stable the
average amount of food given per interaction. Although the data for
clients paying bills was sparse, there is some evidence to suggest that
reporting payment of bills doesn’t have an impact on the average amount
of food clients receive at a given interaction. Given, one of the
central tenants of UMD is to provide food to the community these results
are encouraging.

### Notes on future data collection

1.  While cleaning the data I noticed there were lines dating back to
    1931, which predates the existence of UMD. There are also records
    listing future dates. It would be helpful to understand if these
    data are erroneous or if they have some other type of significance.

2.  While looking into the total amount of food provided each year I
    came across a record (client \#: 12943) that had received 450121
    pounds of food during one interaction. I assume that this was a data
    entry error. It would be helpful to know what the upper and lower
    limits are on the amount of food distributed at any one time.

3.  The analyses reported here focused on the year range 2006-2019
    because the data before 2006 was sparse in comparison. Are there
    additional records from earlier years?
