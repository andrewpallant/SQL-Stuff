use master

declare @memlimit as int, @cpulimit as int 

set @memlimit = 100 – Memory Filter Limit 
set @cpulimit = 200 – CPU Filter Limit 

select spid, login_time, last_batch, hostname, program_name, memusage,cpu 
	from sysprocesses 
	where ( memusage > @memlimit or cpu > @cpulimit )