-- Observe the result of running this SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world;

-- Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
WHERE population >= 200000000;

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
select Name, gdp/population as 'Per Capita GDP'
from world 
where population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 as 'Population' 
FROM world 
WHERE continent = 'South America'

-- Show the name and population for France, Germany, Italy
SELECT name, population as 'Population' 
FROM world 
WHERE name in ('France', 'Germany', 'Italy')

-- Show the countries that are big by area or big by population. Show name, population and area.
select name from world 
where name like '%united%'

-- Show the countries that are big by area or big by population. Show name, population and area.
select name, population, area from world 
where area > 3000000 or population > 250000000;

-- Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
select name, population, area from world 
where area > 3000000 xor population > 250000000;

-- For South America show population in millions and GDP in billions both to 2 decimal places.
select 
 name, 
 round(population/1000000, 2) as 'population', 
 round(gdp/1000000000, 2) as 'gdp' from world 
where continent = 'South America';

-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.
select name, round(gdp/(population*1000), 0)* 1000 as 'per capita gdp' 
from world 
where gdp >= 1000000000000;

-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
 WHERE length(name) = length(capital)

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital

-- Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'
