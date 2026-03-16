/* 
This project demonstrates how SQL queries are used in Healthcare Analysis.
It analyzes healthcare claims data to understand claim status,
aging trends, insurance performance, and outstanding balances.
*/
Use rcm;

/* 1.Total Claims in the give Data*/
Select* from rcm Limit 50;
Select Count(*) As Total_claims From rcm;

/*2. Claims By status*/

select`status`,count(*) from RCM Group by`Status`;

/*3. Total Billed Amount*/
Select Sum(`Billed Amount`)As total_billed From rcm;

/* 4.Out standing Balance*/

Select Sum(`Billed Amount`)As Outstanding_balance From rcm where `Status`!='Paid';

/* 5.Denied claims By Insurance */

Select `Status`,Count(*)from rcm Where `Status`= 'Denied';
select `Insurance Name`, Count(*) as denied_claims From rcm 
Where `Status`= 'Denied' group by `Insurance Name` Order by denied_claims DESC;

/* 6.Aging Analysis*/
Select `Aging Bucket`,Count(*)As total_Claims From rcm Group By `Aging Bucket`;

/* 7. State wise Claim Distribution*/
Select `State`,count(*) as total_claim From RCM group by`State`;

/* 8. Highest Claim Amount*/

Select `Billed Amount` From rcm Order By `Billed Amount` DESC Limit 10;