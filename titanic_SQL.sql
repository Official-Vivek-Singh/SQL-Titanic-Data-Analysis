# Project Overview :
/* 
The titanic and titanic2 data frames describe the survival status of individual passengers on the Titanic. The
The variables on our extracted dataset are pclass, survived, name, age, embarked,
home.dest, room, ticket, boat, and sex. pclass refers to passenger class (1st, 2nd, 3rd),
*/

# We are going to analysis the titanic Passerger Survival.

# Create the database 

Create database titanic ;
	
    -- Create is a DDL(Data Defination Language) command , that help us to create a structure in RDMBS.
    
# use the dataset

use titanic;

	-- use : The use keyword is used to set the data base as primary, in  which you are goingt o work on.
    
    
# show the record of table 

select * from tbl_titanic;

	-- Seelct : The Select is a DQL(Data Query Language) commange that helpd us to fetch the record form table.
	-- * : The * symbol is used to fetch all (columns) record of the database.
    
# SHow the column List of Table

SHOW COLUMNS FROM tbl_titanic;
	
    -- here we are using The Show Column to get the list of complte details of column of Tables

# Set the Passenger ID as Primary Key

alter table tbl_titanic
add constraint primary key(PassengerId);
	
    -- Here We have used Alter Statement :
    -- Alter key is ued to modifiy the defination of table 
    -- here we are adding constraints , It is rule, we are setting the rule on PassengerId as Primary Key 

# show first 10 record of table 

select * from tbl_titanic Limit 10;
	
    -- limit : The Limit keyword is use to show selected No. of record form table.
    
# Find the No of passenger who survived? 

select count(*) as "pasenger_Survived" from tbl_titanic where survived = 1;

	-- Count() : The Count()  is a aggregate Method that returns the total No of Record in the Table/Coumn .
    -- Where : The where Keyword is used to filter the data based on the specified condition 

# Find the Average Age of passenger ? 

select avg(Age) from tbl_titanic;

	-- AVG() : The AVG()  is a aggregate Method that returns the Average of value .

# Find the passenger in each Class ? 

select Pclass, count(*) Total_Passenger from tbl_titanic
group by Pclass 
order by Total_Passenger DESC;

	-- group by() : The group by  is clause, that groups the similar data / value. 
    -- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low).  

# Find the First 10 record of the dataset sorted by passenger class in highest to lowest  ? 

select * from tbl_titanic
order by Pclass DESC
limit 10;

	-- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low).
    -- limit : The Limit keyword is use to show selected No. of record form table.

# Find the No of passenger in each class sorted by class in ascending order?
select count(*) Total_Passenger, PClass from tbl_titanic
Group by PClass
order by Pclass ASC;

	-- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low).
    -- Group By : The Group by clause is sued to grouping the similar value/data 

# Find the Average Fare paid by passenger in each class ?

select avg(fare) Avg_Fare, PClass from tbl_titanic
Group by PClass
order by Pclass ASC;

	-- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low). 
    -- Group By : The Group by clause is sued to grouping the similar value/data 

# Find the Passenger Name who paid the Highest Fare  ?

select Name, Fare from tbl_titanic 
where fare = (
				select Max(fare) Highest_fare from tbl_titanic
             );

	-- Here we are using here the the Query inside the Query, That is called the Subquery
    -- The outer Query result is depend on the inner Query
    --  Here we are finding the max/ highest fare from the table, then we we extracting thr result on the basis on MAX fare
    
    
# Find the Passenger  who had Highest Age Among the survivors  ?

select Name, Age as Highest_Age from tbl_titanic 
where age = (
			select Max(age) from tbl_titanic where survived = 1
			)
and survived = 1;

	-- Here we are using here the the Query inside the Query, That is called the Subquery
    -- The outer Query result is depend on the inner Query
    -- Here we are finding the max/ highest AGE from the table, then we we extracting thr result on the basis on MAX AGE
    
# Find the No of Passenger  who paid more than agerage fare  ?
select Name, Fare as Avg_FAre 
from tbl_titanic 
where fare > (
			   select avg(fare) from tbl_titanic
			);
	-- Here we are using here the the Query inside the Query, That is called the Subquery
    -- The outer Query result is depend on the inner Query
    -- Here we are finding the Avg/ mean Fare from the table, then we we extracting the result where Fare is grather that Avg Fare.

# Find the No of Passenger  who paid more than agerage fare  ?

select Count(*) 
from tbl_titanic 
where fare > (
			   select avg(fare) from tbl_titanic
			);	
			
		-- Here we are using here the the Query inside the Query, That is called the Subquery
		-- The outer Query result is depend on the inner Query
		-- Here we are finding the Avg/ mean Fare from the table, then we we extracting the Total Count where Fare is grather that Avg Fare.
	

# Find the Name of Passenger  who had the most parents or child on board more than agerage fare  ?

select Name, Parch  
from tbl_titanic 
where Parch = (
			   select Max(parch) from tbl_titanic
			);
	-- Here we are using here the the Query inside the Query, That is called the Subquery
    -- The outer Query result is depend on the inner Query
    -- Here we are finding the MAX/ highest Parch from the table, then we we extracting the result of that passenger who has Maxium no of child.

# Find the Number of male &  Female Passenger  who survived , and order the result by gender in Low to high?

select sex, count(*) as Total_Passenger
from tbl_titanic 
where survived =1
group by sex Order by sex asc;

    -- Here we are Grouping  the Sex/Gender with Group By Clause  to find Gener wise total No of Passenger of Survival=1 and sorting them by Sex.


# Find the Number of male &  Female Passenger  who survived , and order the result by gender in Low to high?
select name, age, fare from tbl_titanic 
where age= (
			select max(age) from tbl_titanic
		   )
and survived = 1 ;

    -- Here we are Grouping  the Sex/Gender with Group By Clause  to find Gener wise total No of Passenger of Survival=1 and sorting them by Sex.

# Find the name & age  of youngest Female Passenger  who survived in third class?
select name, Age  from tbl_titanic
where sex = 'female' 
and Pclass =3 
and survived = 1 and  
age = (
		select min(age) from tbl_titanic 
        where sex = 'female' 
        and Pclass =3 
        and survived = 1
        );
 -- Here we are using SubQuery to find the the Min Age of Female passenger who has survived and
 -- then we are fetchthing the result on SubQuery to extract the Name , AGE of Female Passenger.

## Find the Number of Male & female Passenger?
select count(*) As Passenger_Count, sex
from tbl_titanic
group by Sex;

# Other Way 

Select 
	sum(case when sex = 'Male' then 1 else 0 END ) as Total_Male,
    sum(case when sex = 'Female' then 1 else 0 END ) as Total_female
From tbl_titanic;


# Select All passenger   who traveled in Cabin that was not shared by other Passenger?

Select * from tbl_titanic 
where cabin not in 
	( 
		select cabin from tbl_titanic 
        group by Cabin 
        having count(*) > 1
	);

 
 -- Then on the basis of SubQuery we are extracting in the Main Query the where Cabin is not shared with other Passenger with NOT IN operatot

#  Show the List of top 3 Passenger by gender who paid the maximum fare

select * from (
		select *,
		dense_rank() 
		over(partition by Sex order by fare Desc) as d_rank from tbl_titanic
       ) tbl 
where tbl.d_rank <=3;
       -- Here we are using the Window Function to find the Top 3 Passenger in Each Gender/Sex
       -- We have used Dense_rank() : The Dense_rank() give the The Unique ranking to each Unique Value.
       -- We user Over() clause for Partitioned By Sex  to assigne the Unique Rankin to each gender
       -- We Used Order By : The Order By Claused is usde to sort the Data in ACS/Desc to sort High to Low or Low To High
       
       
# Show me the list of Top 3 Passenger ho paid max fare by gender?
select  Distinct Fare, Sex, D_rnk_Fare from (
		Select Sex, fare,
		dense_rank() 
        Over(partition by Sex order by fare desc) as D_rnk_Fare 
        from tbl_titanic ) t
where t.D_rnk_Fare <=3;

	   -- Here we are using the Window Function to find the Top 3 Passenger in Each Gender/Sex
       -- We have used Dense_rank() : The Dense_rank() give the The Unique ranking to each Unique Value.
       -- We user Over() clause for Partitioned By Sex  to assigne the Unique Rankin to each gender
       -- We Used Order By : The Order By Claused is usde to sort the Data in ACS/Desc, We are sorting the Fare in Desc(High to Low) to find the Maximum

# Assign Unique Number to each row in Table 

Select *,
 row_number() 
 over(order by fare asc) as Sr_no
 from tbl_titanic;
       
       -- Here we are using the Window Function() Row_Number
       -- Row_Number() : It is used to assign the unique no to each row.
       -- Over() : Over is used with Window Function to use the partitioned By  and Order By claused to partitioned the data and sorting the data
       -- Here in Over Claue we are sorting the dare in asc Order. 


select * from tbl_titanic;
