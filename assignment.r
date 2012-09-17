> data(biofam)
> names(biofam)
 [1] "idhous"   "sex"      "birthyr"  "nat_1_02" "plingu02" "p02r01"   "p02r04"   "cspfaj"   "cspmoj"   "a15"      "a16"      "a17"      "a18"      "a19"      "a20"      "a21"      "a22"     
[18] "a23"      "a24"      "a25"      "a26"      "a27"      "a28"      "a29"      "a30"      "wp00tbgp" "wp00tbgs"
> biofam$age <- 2002 - biofam$birthyr
> summary(biofam$age[biofam$sex=="woman"])
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  45.00   50.00   57.00   59.39   66.00   93.00 
> biofam$cohort <- cut(biofam$birthyr, c(1900,1930,1940,1950,1960), labels=c("1900-1929","1930-1939","1940-1949","1950-1959"), right=FALSE)
> breaks<-c(1900,1930,1940,1950,1960)
> hist(biofam$birthyr, breaks=breaks, freq=TRUE, plot=TRUE, right=FALSE)
Warning message:
In plot.histogram(r, freq = freq1, col = col, border = border, angle = angle,  :
  the AREAS in the plot are wrong -- rather use freq=FALSE
> table(biofam$cohort)

1900-1929 1930-1939 1940-1949 1950-1959 
      260       466       632       642 
> table(biofam$cohort, biofam$a25)
           
              0   1   2   3   4   5   6   7
  1900-1929 120  41  31  30   0   1  33   4
  1930-1939 140  91  46  87   0   2  98   2
  1940-1949 145 134  42 137   1   4 160   9
  1950-1959 104 256  27 117   1   5 123   9
> biofam$a25is6 <- biofam$a25==6
> model1 <- glm(biofam$a25is6 ~ biofam$plingu02 + biofam$sex, family=binomial)
> summary(model1)

Call:
glm(formula = biofam$a25is6 ~ biofam$plingu02 + biofam$sex, family = binomial)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-0.8282  -0.7602  -0.5666  -0.5414   2.2714  

Coefficients:
                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)             -1.5486     0.1404 -11.031  < 2e-16 ***
biofam$plingu02german   -0.1996     0.1349  -1.480   0.1389    
biofam$plingu02italian  -0.9523     0.3723  -2.558   0.0105 *  
biofam$sexwoman          0.6547     0.1284   5.100  3.4e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 1693.3  on 1646  degrees of freedom
Residual deviance: 1657.8  on 1643  degrees of freedom
  (353 observations deleted due to missingness)
AIC: 1665.8

Number of Fisher Scoring iterations: 4

> model2 <- glm(biofam$a25is6 ~ biofam$plingu02 + biofam$sex, family=binomial, data=biofam[biofam$cohort=="1950-59"])
> summary(model2)

Call:
glm(formula = biofam$a25is6 ~ biofam$plingu02 + biofam$sex, family = binomial, 
    data = biofam[biofam$cohort == "1950-59"])

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-0.8282  -0.7602  -0.5666  -0.5414   2.2714  

Coefficients:
                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)             -1.5486     0.1404 -11.031  < 2e-16 ***
biofam$plingu02german   -0.1996     0.1349  -1.480   0.1389    
biofam$plingu02italian  -0.9523     0.3723  -2.558   0.0105 *  
biofam$sexwoman          0.6547     0.1284   5.100  3.4e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 1693.3  on 1646  degrees of freedom
Residual deviance: 1657.8  on 1643  degrees of freedom
  (353 observations deleted due to missingness)
AIC: 1665.8

Number of Fisher Scoring iterations: 4
