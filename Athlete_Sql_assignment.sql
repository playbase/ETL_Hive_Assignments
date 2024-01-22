-- Table Desc
select * from athlete;

-- Show how many medal counts present for entire data.
select count(medal) from athlete;

-- Show count of unique Sports are present in olympics.
select count(distinct sport) from athlete ;

-- Show how many different medals won by Team India in data.
select distinct medal from athlete where team='India';

-- Show event wise medals won by india show from highest to lowest medals won in order.
select event,medal from athlete where team='India' order by medal desc;

-- Show event and yearwise medals won by india in order of year.
select event,year,medal from athlete where team='India' order by year asc;

-- Show the country with maximum medals won gold, silver, bronze
select * from (select count(medal) as medal_count,team from athlete group by team) as result order by medal_count desc limit 1;

 -- Show the top 10 countries with respect to gold medals
select * from (select count(medal) as medal_count ,team from athlete where medal ='Gold' group by team ) as result order by medal_count desc limit 10;

-- Show in which year did United States won most medals
select * from( select count(medal) as medal_count, year from athlete where team='United States' group by year) as result order by medal_count desc limit 1 ;

-- In which sports United States has most medals
select * from( select count(medal) as medal_count, sport from athlete where team='United States' group by sport) as result order by medal_count desc limit 1 ;

--  Find top 3 players who have won most medals along with their sports and country.
select * from (select count(medal) as medal_count,team,sport,name from athlete group by team,sport,name) as result order by medal_count desc limit 3;

-- Find player with most gold medals in cycling along with his country.
select * from (select count(medal) as medal_count,team,name from athlete  where sport = 'Cycling' and medal ='Gold' group by team,name) as result order by medal_count desc limit 1;

-- Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.
select * from (select count(medal) as medal_count,team,name from athlete  where sport = 'Basketball' and medal in ('Gold','Silver','Bronze') group by team,name) as result order by medal_count desc limit 1;

-- Find out the count of different medals of the top basketball player.
select * from (select count( medal) as medal_count,name from athlete  where sport = 'Basketball' group by name) as result order by medal_count desc limit 3;

-- Find out medals won by male, female each year . Export this data and plot graph in excel.