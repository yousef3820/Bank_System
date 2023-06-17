/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     5/30/2022 8:02:49 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACCOUNT') and o.name = 'FK_ACCOUNT_HOLDS_CUSTOMER')
alter table ACCOUNT
   drop constraint FK_ACCOUNT_HOLDS_CUSTOMER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACCOUNT') and o.name = 'FK_ACCOUNT_MAINTAINS_BRANCH')
alter table ACCOUNT
   drop constraint FK_ACCOUNT_MAINTAINS_BRANCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BRANCH') and o.name = 'FK_BRANCH_HAS_BANK')
alter table BRANCH
   drop constraint FK_BRANCH_HAS_BANK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CUSTOMER') and o.name = 'FK_CUSTOMER_ADDS_CUST_EMPLOYEE')
alter table CUSTOMER
   drop constraint FK_CUSTOMER_ADDS_CUST_EMPLOYEE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('EMPLOYEE') and o.name = 'FK_EMPLOYEE_WORKS_FOR_BRANCH')
alter table EMPLOYEE
   drop constraint FK_EMPLOYEE_WORKS_FOR_BRANCH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOAN') and o.name = 'FK_LOAN_OFFERS_BRANCH')
alter table LOAN
   drop constraint FK_LOAN_OFFERS_BRANCH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACCOUNT')
            and   name  = 'MAINTAINS_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACCOUNT.MAINTAINS_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACCOUNT')
            and   name  = 'HOLDS_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACCOUNT.HOLDS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ACCOUNT')
            and   type = 'U')
   drop table ACCOUNT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BANK')
            and   type = 'U')
   drop table BANK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BRANCH')
            and   name  = 'HAS_FK'
            and   indid > 0
            and   indid < 255)
   drop index BRANCH.HAS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BRANCH')
            and   type = 'U')
   drop table BRANCH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CUSTOMER')
            and   name  = 'ADDS_CUSTOMER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CUSTOMER.ADDS_CUSTOMER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CUSTOMER')
            and   type = 'U')
   drop table CUSTOMER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('EMPLOYEE')
            and   name  = 'WORKS_FOR_FK'
            and   indid > 0
            and   indid < 255)
   drop index EMPLOYEE.WORKS_FOR_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('EMPLOYEE')
            and   type = 'U')
   drop table EMPLOYEE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LOAN')
            and   name  = 'OFFERS_FK'
            and   indid > 0
            and   indid < 255)
   drop index LOAN.OFFERS_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOAN')
            and   type = 'U')
   drop table LOAN
go

/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
create table ACCOUNT (
   ACC_NO               int                  not null,
   BRANCH_NO            int                  null,
   SSN                  numeric(14)          not null,
   ACC_TYPE             varchar(25)          not null,
   BALANCE              float                not null,
   constraint PK_ACCOUNT primary key nonclustered (ACC_NO)
)
go

/*==============================================================*/
/* Index: HOLDS_FK                                              */
/*==============================================================*/
create index HOLDS_FK on ACCOUNT (
SSN ASC
)
go

/*==============================================================*/
/* Index: MAINTAINS_FK                                          */
/*==============================================================*/
create index MAINTAINS_FK on ACCOUNT (
BRANCH_NO ASC
)
go

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table BANK (
   CODE                 int                  not null,
   NAME                 varchar(25)          not null,
   ADDRESS              varchar(30)          not null,
   constraint PK_BANK primary key nonclustered (CODE)
)
go

/*==============================================================*/
/* Table: BRANCH                                                */
/*==============================================================*/
create table BRANCH (
   BRANCH_NO            int                  not null,
   CODE                 int                  not null,
   ADDRESS              varchar(30)          not null,
   constraint PK_BRANCH primary key nonclustered (BRANCH_NO)
)
go

/*==============================================================*/
/* Index: HAS_FK                                                */
/*==============================================================*/
create index HAS_FK on BRANCH (
CODE ASC
)
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   SSN                  numeric(14)          not null,
   EMP_ID               int                  null,
   NAME                 varchar(25)          not null,
   PHONE                numeric(11)          not null,
   ADDRESS              varchar(30)          not null,
   constraint PK_CUSTOMER primary key nonclustered (SSN)
)
go

/*==============================================================*/
/* Index: ADDS_CUSTOMER_FK                                      */
/*==============================================================*/
create index ADDS_CUSTOMER_FK on CUSTOMER (
EMP_ID ASC
)
go

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE (
   EMP_ID               int                  not null,
   BRANCH_NO            int                  not null,
   NAME                 varchar(25)          not null,
   PHONE                numeric(11)          not null,
   ADDRESS              varchar(30)          not null,
   constraint PK_EMPLOYEE primary key nonclustered (EMP_ID)
)
go

/*==============================================================*/
/* Index: WORKS_FOR_FK                                          */
/*==============================================================*/
create index WORKS_FOR_FK on EMPLOYEE (
BRANCH_NO ASC
)
go

/*==============================================================*/
/* Table: LOAN                                                  */
/*==============================================================*/
create table LOAN (
   LOAN_NO              int                  not null,
   BRANCH_NO            int                  null,
   LOAN_TYPE            varchar(25)          not null,
   AMOUNT               float                not null,
   constraint PK_LOAN primary key nonclustered (LOAN_NO)
)
go

/*==============================================================*/
/* Index: OFFERS_FK                                             */
/*==============================================================*/
create index OFFERS_FK on LOAN (
BRANCH_NO ASC
)
go

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
CREATE TABLE dbo.Admin (
    Password VARCHAR (50) NOT NULL,
    A_name   VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Password] ASC)
);

/*==============================================================*/
/* Table: LOAN_REQUEST                                          */
/*==============================================================*/
CREATE TABLE dbo.LOAN_REQUEST (
     Request_no  INT          NOT NULL,
     SSN         NUMERIC (14) NOT NULL,
     LOAN_NO     INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Request_no] ASC),
    CONSTRAINT [FK_CUSTOMER_ADDS_LOAN_REQUEST] FOREIGN KEY ([SSN]) REFERENCES [dbo].[CUSTOMER] ([SSN]),
    CONSTRAINT [FK_CUSTOMER_ADDS_LOAN_NO] FOREIGN KEY ([LOAN_NO]) REFERENCES [dbo].[LOAN] ([LOAN_NO])
);

/*==============================================================*/
/* Table: ACCEPTED                                              */
/*==============================================================*/
CREATE TABLE dbo.ACCEPTED (
     EMP_ID      INT          NOT NULL,
     REQUEST_NO  INT          NOT NULL,
     PAID        VARCHAR (10) DEFAULT ('FALSE') NOT NULL,
    CONSTRAINT [FK_EMPLOYEE_ACCEPTS_CUST_REQUEST] FOREIGN KEY ([EMP_ID]) REFERENCES [dbo].[EMPLOYEE] ([EMP_ID]),
    CONSTRAINT [FK_EMPLOYEE_ADDS_REQUEST_NO] FOREIGN KEY ([REQUEST_NO]) REFERENCES [dbo].[LOAN_REQUEST] ([Request_no])
);


alter table ACCOUNT
   add constraint FK_ACCOUNT_HOLDS_CUSTOMER foreign key (SSN)
      references CUSTOMER (SSN)
go

alter table ACCOUNT
   add constraint FK_ACCOUNT_MAINTAINS_BRANCH foreign key (BRANCH_NO)
      references BRANCH (BRANCH_NO)
go

alter table BRANCH
   add constraint FK_BRANCH_HAS_BANK foreign key (CODE)
      references BANK (CODE)
go

alter table CUSTOMER
   add constraint FK_CUSTOMER_ADDS_CUST_EMPLOYEE foreign key (EMP_ID)
      references EMPLOYEE (EMP_ID)
go

alter table EMPLOYEE
   add constraint FK_EMPLOYEE_WORKS_FOR_BRANCH foreign key (BRANCH_NO)
      references BRANCH (BRANCH_NO)
go

alter table LOAN
   add constraint FK_LOAN_OFFERS_BRANCH foreign key (BRANCH_NO)
      references BRANCH (BRANCH_NO)
go

