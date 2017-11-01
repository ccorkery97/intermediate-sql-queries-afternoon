select *
from Invoice
join InvoiceLine on InvoiceLine.invoiceId = Invoice.invoiceId
where InvoiceLine.UnitPrice > 0.99;

select Invoice.InvoiceDate, Invoice.Total, Customer.FirstName, Customer.LastName
from Invoice 
join Customer on Invoice.CustomerId = Customer.CustomerId;

select Customer.FirstName, Customer.LastName, Employee.FirstName, Employee.LastName
from Customer 
join Employee on Customer.SupportRepId = Employee.EmployeeId;

select Album.Title, Artist.Name
from Album 
join Artist on Album.ArtistId = Artist.ArtistId;

select PlaylistTrack.TrackId
from PlaylistTrack
join Playlist on Playlist.PlaylistId = PlaylistTrack.PlaylistId
where Playlist.Name = 'Music';

select Track.Name
from Track
join PlaylistTrack on Track.TrackId = PlaylistTrack.TrackId
where PlaylistId = 5;

select Track.Name, Playlist.Name
from Track
join PlaylistTrack on Track.TrackId = PlaylistTrack.TrackId
join Playlist on PlaylistTrack.PlaylistId = Playlist.PlaylistId;

select Track.Name, Album.Title
from Track 
join Album on Track.AlbumId = Album.AlbumId
join Genre on Track.GenreId = Genre.GenreId
where Genre.Name = 'Alternative';

select Track.name, Genre.Name, Album.Title, Artist.Name
from Track 
join PlaylistTrack on PlaylistTrack.TrackId = Track.TrackId
join Playlist on Playlist.PlaylistId = PlaylistTrack.PlaylistId
join Genre on Genre.GenreId = Track.GenreId
join Album on Album.AlbumId = Track.AlbumId
join Artist on Artist.ArtistId = Album.ArtistId
where Playlist.Name = 'Music'









select * 
from Invoice
where InvoiceId in (select InvoiceId from InvoiceLine where UnitPrice > 0.99);

select *
from PlaylistTrack
where PlaylistId in (select PlaylistId from Playlist where Name = 'Music');

select Name 
from Track 
where TrackId in (select TrackId from PlaylistTrack where PlaylistId = 5);

select Name 
from Track
where GenreId in (select GenreId from Genre where Name = 'Comedy');

select Name 
from Track
where AlbumId in (select AlbumId from Album where Title = 'Fireball');

select Name 
from Track
where Composer in (select Name from Artist where Name = 'Queen');









update Customer
set Fax = null
where Fax is not null;

update Customer
set Company = 'Self'
where Company is null;

update Customer
set LastName = 'Thompson'
where FirstName = 'Julia' and LastName = 'Barnett';

update Customer 
set SupportRepId = 4
where Email = 'luisrojas@yahoo.cl';

update Track
set Composer = 'The darkness around us'
where GenreId = (select GenreId from Genre where Name = 'Metal')
and Composer is null;




select count(*), Genre.Name
from Track
join Genre on Track.GenreId = Genre.GenreId
group by Genre.Name; 

select Count(*), Genre.Name
from Track
join Genre on Genre.GenreId = Track.GenreId
where Genre.Name = 'Pop' or Genre.Name = 'Rock'
group by Genre.Name;

select Artist.Name, count(*)
from Album
join Artist on Artist.ArtistId = Album.ArtistId
group by Artist.Name;





select distinct Composer
from Track;

select distinct BillingPostalCode
from Invoice;

select distinct Company
from Customer;




delete from practice_delete
where Type = 'bronze';

delete from practice_delete
where Type = 'silver';

delete from practice_delete
where Value = 150;






create table Users (
  id integer primary key autoincrement,
  name varchar(20),
  email varchar(20)
  );
  
create table Products (
  id integer primary key autoincrement,
  name varchar(20),
  price integer
  );
  
create table Orders (
  id integer primary key autoincrement,
  productId integer,
  foreign key (productId) references Product (id)
  );


insert into Users (name,email)
values ('example1', 'example1.com');

insert into Users (name,email)
values ('example2', 'example2.com');

insert into Users (name,email)
values ('example3', 'example3.com');

insert into Products (name,price)
values ('example1', 1);

insert into Products (name,price)
values ('example2', 2);

insert into Products (name,price)
values ('example3', 3);

insert into Orders (productId)
values (1);

insert into Orders (productId)
values (2);

insert into Orders (productId)
values (3);


select *
from Products
where id in (select productId from Orders where id = 1);

select *
from Orders;

select sum(price)
from Products
where id in (select productId from Orders where id = 1); 

alter table Orders 
add column userId integer references Users (id);

update Orders
set id = userId;

select * 
from Orders 
join Users on Orders.userId = Users.id
where Users.name = 'example1';

select count(*)
from Orders 
group by userId;

select sum(id)
from Orders
group by Users;








































































