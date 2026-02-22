select *
from [Portfolio Project]..['Covid Deaths$']
where continent is not null
and location like '%canada%'
order by 3,4

SELECT *
FROM [Portfolio Project]..['Covid Vaccs$']
order by 3,4


select location, date, total_cases, new_cases, total_deaths, population
from [Portfolio Project]..['Covid Deaths$']
order by 1, 2


-- Looking at Total Cases vs Total deaths
-- shows the likelihood the death rate if you get Covid in your country
select location, date, total_cases, total_deaths,(total_deaths/total_cases) * 100 AS "Death Percentage on Total Cases"
from [Portfolio Project]..['Covid Deaths$']
where location like '%kingdom%'
order by 1, 2



--select location, date, total_cases, population, (total_cases/population)*100 AS "Population percentage of Covid sufferers"
--from [Portfolio Project]..['Covid Deaths$']
--where location like '%United Kingdom%'
--order by 1, 2

-- looking at the total cases Vs Population Percentage
-- Shows what perccentage of population got Covid

	select location, date, total_cases,  population, (total_cases/population)*100 AS "Population percentage of Covid sufferers"
	from [Portfolio Project]..['Covid Deaths$']
	where location like '%kingdom%'
	order by 1, 2



	-- looking at countries with the higest ingection rate  Compared to Population

	select location, population, MAX(total_cases) AS "Maximum Total Cases",  MAX((total_cases/population))*100 AS "Percentage of those who have Covid"
	from [Portfolio Project]..['Covid Deaths$']
	--where location like '%kingdom%'
	Group by location, population
	order by 4 DESC



	-- Showing countries with the highest count per population

	select location, MAX(cast(total_deaths as int)) AS TotalDeathCount 	
	from [Portfolio Project]..['Covid Deaths$']
	where continent is not null
	--where location like '%kingdom%'
	Group by location
	order by TotalDeathCount DESC



	-- LETS BREAK THINGS DOWN BY CONTINENT
	--- Showing the continent's highest death count per population
	 select location, MAX(cast(total_deaths as int)) AS TotalDeathCount 	
	from [Portfolio Project]..['Covid Deaths$']
	where continent is null
	--where location like '%kingdom%'
	Group by location
	order by TotalDeathCount DESC

	-- Global numbers
	-- This will give the total of the COVID cases and deaths worldwide on a daily basis. 
select SUM(new_cases) AS TotalCOVIDCases, SUM(cast(new_deaths as int)) AS TotalCOVIDDeaths, SUM(cast(new_deaths as int))/SUM(new_cases) * 100 AS DeathPercent 
from [Portfolio Project]..['Covid Deaths$']
where continent is not null
--and location like '%canada%'
--Group by date
order by 1,2

-- Total Population vs Vaccination
-- CAST XXXXXXX as int
--  CONVERT(int, XXXXXX)

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by  dea.Location Order by dea.Location,
dea.date) AS RollingPeopleVaccinated,
(RollingPeopleVaccinated/population)*100
from [Portfolio Project]..['Covid Deaths$'] dea
Join [Portfolio Project]..['Covid Vaccs$'] vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is NOT null
order by 2,3


-- Using CTE

With PopVsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated) 
AS
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by  dea.Location Order by dea.Location,
dea.date) AS RollingPeopleVaccinated
from [Portfolio Project]..['Covid Deaths$'] dea
Join [Portfolio Project]..['Covid Vaccs$'] vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is NOT null
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100 AS PercentageVaccinated
From PopVsVac


-- TEMP Table
Drop Table if exists #PercentPopulationVaccinated 
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255), 
Location nvarchar(255),
Date datetime, 
Population numeric, 
New_Vaccinations numeric, 
RollingPeopleVaccinated numeric
)

insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by  dea.Location Order by dea.Location,
dea.date) AS RollingPeopleVaccinated
from [Portfolio Project]..['Covid Deaths$'] dea
Join [Portfolio Project]..['Covid Vaccs$'] vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is NOT null
--order by 2,3

Select *, (RollingPeopleVaccinated/Population)*100 AS PercentageVaccinated
From #PercentPopulationVaccinated


-- Creating view to store data for later visualisation
Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(Cast(vac.new_vaccinations as int)) OVER (Partition by  dea.Location Order by dea.Location,
dea.date) AS RollingPeopleVaccinated
from [Portfolio Project]..['Covid Deaths$'] dea
Join [Portfolio Project]..['Covid Vaccs$'] vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is NOT null
--order by 2,3

select *
From PercentPopulationVaccinated





select location, MAX(cast(total_deaths as int)) AS TotalDeathCount 	
	from [Portfolio Project]..['Covid Deaths$']
	where continent is null
	--where location like '%kingdom%'
	Group by location
	order by TotalDeathCount DESC

