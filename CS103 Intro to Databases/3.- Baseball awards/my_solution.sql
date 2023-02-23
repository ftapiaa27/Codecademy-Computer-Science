-- Heaviest hitters

select distinct on (batting.yearid) 
	batting.yearid as year, teams.name as team, avg(weight) as avrg
from people
join batting
	on people.playerid = batting.playerid
join teams 
	on batting.teamid = teams.teamid
group by teams.name, batting.yearid
order by year desc, avrg desc;

-- Shortest Sluggers
select distinct on (batting.yearid) 
	batting.yearid as year, teams.name as team, avg(height) as avrg
from people
join batting
	on people.playerid = batting.playerid
join teams 
	on batting.teamid = teams.teamid
group by teams.name, batting.yearid
order by year desc, avrg;

-- Most bang for their buck
select teams.name, round(sum(salary)/teams.w) as cost
from salaries
join teams
	on salaries.teamid = teams.teamid
where salaries.yearid = 2010 and teams.yearid = 2010
group by teams.name, teams.w
order by cost
limit 1;

-- Priciest starter
select distinct on (salaries.yearid)
	salaries.yearid as year, people.namegiven as name, people.namefirst, people.namelast,
  salaries.salary, pitching.g as games,
  round(salaries.salary / pitching.g) as cost
from pitching
left join salaries
	on pitching.playerid = salaries.playerid
  and pitching.yearid = salaries.yearid
  and pitching.teamid = salaries.teamid
join people
	on salaries.playerid = people.playerid
where pitching.g > 10
order by year desc, cost desc