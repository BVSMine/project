declare @daily_cases varchar(max)
select @daily_cases=
	bulkcolumn
	from openrowset (bulk 'C:\Users\Jayasree\Desktop\response.json',single_blob)json
--select @daily_cases as daily;
if(ISJSON(@daily_cases)=1)
	begin
		print 'json file is valid';
		insert into daily_cases
		select * 
		from openjson(@daily_cases,'$.daily_cases.cases_time_series')
		with(
		dailyconfirmed int '$.dailyconfirmed',
		dailydeceased int '$.dailydeceased',
		dailyrecovered int '$.dailyrecovered',
		date date '$.date',
		dateymd date '$.dateymd',
		totalconfirmed int '$.totalconfirmed',
		totaldeceased int '$.totaldeceased',
		totalrecovered int '$.totalrecovered'
		)
		end
else
	begin
		print 'json file invalid';
	end
select * from daily_cases
