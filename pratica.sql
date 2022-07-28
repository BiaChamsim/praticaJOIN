-- Questão 1
SELECT users.id, users.name, cities.name AS city
FROM cities
JOIN users
ON cities.id = users."cityId"
WHERE cities.name = 'Rio de Janeiro'


-- Questão 2
SELECT testimonials.id, writers.name AS writer, 
recipients.name AS recipient, testimonials.message 
FROM testimonials
JOIN users writers
ON testimonials."writerId" = writers.id
JOIN users recipients
ON testimonials."recipientId" = recipients.id;

-- Questão 3
SELECT users.id, users.name, courses.name AS course,
schools.name AS school, educations."endDate"
FROM educations
JOIN courses
ON educations."courseId" = courses.id
JOIN users 
ON educations."userId" = users.id
JOIN schools
ON educations."schoolId" = schools.id
WHERE users.id = 30 AND educations.status = 'finished';

-- Questão 4
SELECT users.id, users.name, roles.name AS role,
companies.name AS company, experiences."startDate"
FROM experiences
JOIN users
ON experiences."userId" = users.id
JOIN roles
ON roles.id = experiences."roleId"
JOIN companies
ON companies.id = experiences."companyId"
WHERE experiences."endDate" IS NULL 
AND users.id = 50;

-- BÔNUS 
SELECT schools.id, schools.name AS school,
courses.name AS course, companies.name AS company,
roles.name AS role
FROM jobs
JOIN applicants
ON jobs.id = applicants."jobId"
JOIN users
ON applicants."userId" = users.id
JOIN educations
ON users.id = educations."userId"
JOIN schools
ON educations."schoolId" = schools.id
JOIN courses
ON courses.id = educations."courseId"
JOIN companies
ON companies.id = jobs."companyId"
JOIN roles
ON roles.id = jobs."roleId"
WHERE companies.id = 10 
AND jobs.active = true
AND roles.name = 'Software Engineer';