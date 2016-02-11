



# How to avoid middle seats on Ryanair flights?

I'm a frequent flier with Ryanair and I like their assigned seats policy, but I really don't like sitting on the middle seat. At a first glance, it seems that the seats are assigned *randomly* and the only way to avoid sitting in the middle is to pay the 6 GBP/EUR fee to choose your own seat. But what if their seat allocation is not actually completely random and you can predict which seat you are likely to get? 

Some time ago, I noticed that when I checked in early I was less likely to sit in the middle compared to checking in later. To check if this was really the case, I compared the check-in times to the deparure times for all 46 Ryanair flights that I have taken during the last two years. Indeed, when I checked in during the first 24 hours I ended up sitting in the middle only on 1 out of 29 (3.5%) flights whereas this increased to 8/17 (47%) when I checked in later:


|Check-in time   | Number of flights| Number of middle seats|  Fraction|
|:---------------|-----------------:|----------------------:|---------:|
|After 24 hours  |                17|                      8| 0.4705882|
|Within 24 hours |                29|                      1| 0.0344828|
So there you have it, if you don't want to sit in the middle then checking in early does indeed look very promising.

But are there any downsides to early check-in? Well, you are likely to be one of the last person to get off the plane when it lands. That's because the seat allocation tends to start from the rows that are in the middle of the plane. The follwing figure shows how check-ins done within the first 24 hours almost always give you a seat in rows between 15-22 (exluding emergency exit rows 16 and 17). On the otherhand, for check-ins done later there is no strong row bias and you are more likely to sit eihter towards the front end or the back end of the plane.

![](README_files/figure-html/unnamed-chunk-3-1.png) 

##Technical details
* **Where did you get the check-in times from?** Whenever I check in for a flight, I always download the PDF copy of the boarding pass and save it into a folder on my computer. This means that all of these files have last modification date attached to them. The last time the boarding pass file was modified corresponds almost perfectly to the time that I checked in for the flight.
* **Is this analysis reproducible?** Yes! All of the raw data is the the `data/` subfolder of this repository and all of the neccessary code is in the README.Rmd Rmarkdown document.
* **Can I condtribute?** Of course. If you've got lots of Ryanair boarding pass PDFs lying around that have the correct check-in times attached to them then add them to the `data/ryanair_chedkin_data.csv` and send them to me either via e-mail (kauralasoo [at] gmail.com) or as a github pull request. If you are interested in doing additional analysis on this data then feel free to fork this repository.



