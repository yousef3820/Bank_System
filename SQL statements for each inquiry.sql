/*==============================================================*/
/* The branch with no customers                                 */
/*==============================================================*/
SELECT * from dbo.BRANCH
where BRANCH_NO not in (select BRANCH_NO from dbo.EMPLOYEE, dbo.CUSTOMER
where EMPLOYEE.EMP_ID = CUSTOMER.EMP_ID);

/*==============================================================*/
/* The branch with no employees                                 */
/*==============================================================*/
select * from dbo.BRANCH
where BRANCH_NO not in (select BRANCH_NO from dbo.EMPLOYEE);

/*==============================================================*/
/* The employee with maximum number of loans added              */
/*==============================================================*/
select * from dbo.EMPLOYEE 
where EMP_ID in (select EMP_ID from dbo.ACCEPTED
		 group by EMP_ID
		 having count(EMP_ID) = (select top 1 count(EMP_ID) from dbo.ACCEPTED
					 group by EMP_ID
 	 				 order by count(EMP_ID) DESC)
		);

/*==============================================================*/
/* The customer(s) who has the maximum numbr of loans           */
/*==============================================================*/
select * from dbo.CUSTOMER
where SSN in (select SSN 
	      from dbo.ACCEPTED inner join dbo.LOAN_REQUEST 			
	      on ACCEPTED.REQUEST_NO = LOAN_REQUEST.Request_no
	      group by SSN
	      having count(SSN) = (select top 1 count(SSN) 
				   from dbo.ACCEPTED inner join dbo.LOAN_REQUEST 
				   on ACCEPTED.REQUEST_NO = LOAN_REQUEST.Request_no
			           group by SSN
			           order by count(SSN) DESC)
	    );

/*==============================================================*/
/* The customer(s) who didn't take any loans                    */
/*==============================================================*/
select * from dbo.CUSTOMER
where SSN not in (select SSN 
		  from dbo.ACCEPTED inner join dbo.LOAN_REQUEST 			
		  on ACCEPTED.REQUEST_NO = LOAN_REQUEST.Request_no
		  );

/*================================================================================================*/
/* For each customer, retrieving all informations and the number of employees he deals with       */
/*================================================================================================*/
select CUSTOMER.SSN, NAME, PHONE, ADDRESS, count(CUSTOMER.EMP_ID) as 'EMPLOYEES_NO'
from dbo.ACCEPTED inner join dbo.LOAN_REQUEST 
on ACCEPTED.REQUEST_NO = LOAN_REQUEST.Request_no right join dbo.CUSTOMER
on CUSTOMER.SSN = LOAN_REQUEST.SSN
group by CUSTOMER.SSN, CUSTOMER.NAME, CUSTOMER.PHONE, CUSTOMER.ADDRESS;