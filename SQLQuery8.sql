declare @district_wise varchar(max)
select @district_wise=
	bulkcolumn
	from openrowset (bulk 'C:\Users\Jayasree\Desktop\response1.json',single_blob)json
select @district_wise as daily;
if(ISJSON(@district_wise)=1)
	begin
		print 'json file is valid';
		insert into district_wise
		select * 
		from openjson(@district_wise,'$.district_wise.state')
		with(
		state varchar(50) '$.state',
		districtdata varchar(50) '$.districtDate',
		notes varchar(1000) '$.notes',
		active int '$.active',
		confirmed int '$.confirmed',
		migratedother int '$.migratedother',
		deceased int '$.deceased',
		recovered int '$.recovered',
		deltaconfirmed int '$.confirmed',
		deltadeceased int '$.deceased',
		deltarecovered int '$.recovered'
		)
		end
else
	begin
		print 'json file invalid';
	end