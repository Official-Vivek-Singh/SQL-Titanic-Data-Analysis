# SQL-Titanic-Data-Analysis
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

![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/678b9e19-8f93-4413-a9b1-d0620708338a)

	-- Seelct : The Select is a DQL(Data Query Language) commange that helpd us to fetch the record form table.
	-- * : The * symbol is used to fetch all (columns) record of the database.
    
# SHow the column List of Table

SHOW COLUMNS FROM tbl_titanic;

![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/5ef1f2a2-4d99-4f59-891a-933842840135)

	
    -- here we are using The Show Column to get the list of complte details of column of Tables

# Set the Passenger ID as Primary Key

alter table tbl_titanic
add constraint primary key(PassengerId);
	
    -- Here We have used Alter Statement :
    -- Alter key is ued to modifiy the defination of table 
    -- here we are adding constraints , It is rule, we are setting the rule on PassengerId as Primary Key 

# show first 10 record of table 

select * from tbl_titanic Limit 10;
	![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/b61a2570-3a35-4653-bc6f-53a8623e8448)

    -- limit : The Limit keyword is use to show selected No. of record form table.
    
# Find the No of passenger who survived? 

select count(*) as "pasenger_Survived" from tbl_titanic where survived = 1;

![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/bd43c3ad-aa87-4445-be21-cda7ed536dd5)

	-- Count() : The Count()  is a aggregate Method that returns the total No of Record in the Table/Coumn .
    -- Where : The where Keyword is used to filter the data based on the specified condition 

# Find the Average Age of passenger ? 

select avg(Age) from tbl_titanic;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/e3b4a9ff-fc03-46c7-9fc5-f595a829c038)

	-- AVG() : The AVG()  is a aggregate Method that returns the Average of value .

# Find the passenger in each Class ? 

select Pclass, count(*) Total_Passenger from tbl_titanic
group by Pclass 
order by Total_Passenger DESC;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/4e3f6f7b-d8b7-4757-b76c-b0ea30c1f004)

	-- group by() : The group by  is clause, that groups the similar data / value. 
    -- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low).  

# Find the First 10 record of the dataset sorted by passenger class in highest to lowest  ? 

select * from tbl_titanic
order by Pclass DESC
limit 10;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/00f9225b-5ca8-4885-8f54-5d1cc6203e1f)

	-- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low).
    -- limit : The Limit keyword is use to show selected No. of record form table.

# Find the No of passenger in each class sorted by class in ascending order?
select count(*) Total_Passenger, PClass from tbl_titanic
Group by PClass
order by Pclass ASC;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/7eb5b24a-1b1d-4111-899e-db060c748a47)

	-- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low).
    -- Group By : The Group by clause is sued to grouping the similar value/data 

# Find the Average Fare paid by passenger in each class ?

select avg(fare) Avg_Fare, PClass from tbl_titanic
Group by PClass
order by Pclass ASC;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/a2b7927c-e4f3-4c00-b669-14042b4d6dea)

	-- Order by() : The order by  is clause, sort the data / value in ASC(Low to High) or DESC( Hight to Low). 
    -- Group By : The Group by clause is sued to grouping the similar value/data 

# Find the Passenger Name who paid the Highest Fare  ?

select Name, Fare from tbl_titanic 
where fare = (
				select Max(fare) Highest_fare from tbl_titanic
             );
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/504977b8-3204-4d4a-b8f8-f4b919cf9752)

	-- Here we are using here the the Query inside the Query, That is called the Subquery
    -- The outer Query result is depend on the inner Query
    --  Here we are finding the max/ highest fare from the table, then we we extracting thr result on the basis on MAX fare
    
    
# Find the Passenger  who had Highest Age Among the survivors  ?

select Name, Age as Highest_Age from tbl_titanic 
where age = (
			select Max(age) from tbl_titanic where survived = 1
			)
and survived = 1;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/53d547f7-0d03-42f8-9265-5c1d46d7dce1)

	-- Here we are using here the the Query inside the Query, That is called the Subquery
    -- The outer Query result is depend on the inner Query
    -- Here we are finding the max/ highest AGE from the table, then we we extracting thr result on the basis on MAX AGE
    
# Find the No of Passenger  who paid more than agerage fare  ?
select Name, Fare as Avg_FAre 
from tbl_titanic 
where fare > (
			   select avg(fare) from tbl_titanic
			);
	 ![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/fb1ed230-0aa0-47ec-b707-3574e289f219)
 
   -- Here we are using here the the Query inside the Query, That is called the Subquery
    -- The outer Query result is depend on the inner Query
    -- Here we are finding the Avg/ mean Fare from the table, then we we extracting the result where Fare is grather that Avg Fare.

# Find the No of Passenger  who paid more than agerage fare  ?

select Count(*) 
from tbl_titanic 
where fare > (
			   select avg(fare) from tbl_titanic
			);	
	![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/76478046-bc27-4b5f-982a-f35ee07ba4ed)
		
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
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/0bd17b64-462d-4bf3-9952-c71b60b46147)

# Find the Number of male &  Female Passenger  who survived , and order the result by gender in Low to high?

select sex, count(*) as Total_Passenger
from tbl_titanic 
where survived =1
group by sex Order by sex asc;

![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/4f33781c-ccbd-462e-aa98-35bde166f40f)

    -- Here we are Grouping  the Sex/Gender with Group By Clause  to find Gener wise total No of Passenger of Survival=1 and sorting them by Sex.


# Find the Number of male &  Female Passenger  who survived , and order the result by gender in Low to high?
select name, age, fare from tbl_titanic 
where age= (
			select max(age) from tbl_titanic
		   )
and survived = 1 ;

![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/4aef75a9-87f5-4df0-a392-b0228c857037)

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
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/e7de9ef2-ba08-46f5-b8a7-9b844700c677)

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

![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/3a93073e-0b30-4aa0-999a-923d72907b3d)

# Select All passenger   who traveled in Cabin that was not shared by other Passenger?

Select * from tbl_titanic 
where cabin not in 
	( 
		select cabin from tbl_titanic 
        group by Cabin 
        having count(*) > 1
	);
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/837fa589-3a63-4991-b35b-323747616a1c)

 
 -- here on the basis of SubQuery we are extracting in the Main Query the where Cabin is not shared with other Passenger with NOT IN operatot

#  Show the List of top 3 Passenger by gender who paid the maximum fare

select Distinct * from (
		select *,
		dense_rank() 
		over(partition by Sex order by fare Desc) as d_rank from tbl_titanic
       ) tbl 
where tbl.d_rank <=3;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/64e73763-14b7-4592-b4c2-d42cd7cfe9e9)

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
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/a7f53ee4-c36a-438e-ae28-8d101c4dc952)

	   -- Here we are using the Window Function to find the Top 3 Passenger in Each Gender/Sex
       -- We have used Dense_rank() : The Dense_rank() give the The Unique ranking to each Unique Value.
       -- We user Over() clause for Partitioned By Sex  to assigne the Unique Rankin to each gender
       -- We Used Order By : The Order By Claused is usde to sort the Data in ACS/Desc, We are sorting the Fare in Desc(High to Low) to find the Maximum

# Assign Unique Number to each row in Table 

Select *,
 row_number() 
 over(order by fare asc) as Sr_no
 from tbl_titanic;
![image](https://github.com/Official-Vivek-Singh/SQL-Titanic-Data-Analysis/assets/129989230/35bb547f-cb17-40ce-9d5b-a49149bcc91f)
       
       -- Here we are using the Window Function() Row_Number
       -- Row_Number() : It is used to assign the unique no to each row.
       -- Over() : Over is used with Window Function to use the partitioned By  and Order By claused to partitioned the data and sorting the data
       -- Here in Over Claue we are sorting the dare in asc Order. 


select * from tbl_titanic;
