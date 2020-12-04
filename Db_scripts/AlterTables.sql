--update tables (was giving errors in framework)

alter table tblCancellation add Id_ int identity(1,1) primary key

alter table tblReturnTicket add Id_ int identity(1,1) primary key

select * from tblCustomer