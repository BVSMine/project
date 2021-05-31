declare @travel_history varchar(max)
select @travel_history=
	bulkcolumn
	from openrowset (bulk 'C:\Users\Jayasree\Desktop\response3.json',single_blob)json
select @travel_history as daily;
if(ISJSON(@travel_history)=1)
	begin
		print 'json file is valid';
		insert into travel_history
		select * 
		from openjson(@travel_history,'$.travel_history.hist')
		with(
		_cn6ca int '$._cn6ca',
		accuracylocation varchar(200) '$.accuracylocation',
		address varchar(2000) '$.address',
		datasource varchar(4000) '$.datasource',
		latlong varchar(4000) '$.latlong',
		modeoftravel varchar(200) '$.modeoftravel',
		pid varchar(100) '$.pid',
		placename varchar(200) '$.placename',
		timefrom varchar(4000) '$.timefrom',
		timeto varchar(4000) '$.timeto',
		typr varchar(3000) '$.type'
		)
		end
else
	begin
		print 'json file invalid';
	end
select * from travel_history
