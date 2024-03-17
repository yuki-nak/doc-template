SELECT f.filename
FROM files AS f
INNER JOIN (
    SELECT LEFT(filename, INSTR(filename, '-') - 1) AS prefix, MAX(MID(filename, INSTR(filename, '-') + 1, INSTR(filename, '.') - INSTR(filename, '-') - 1)) AS max_number
    FROM files
    GROUP BY LEFT(filename, INSTR(filename, '-') - 1)
) AS subquery ON LEFT(f.filename, INSTR(f.filename, '-') - 1) = subquery.prefix AND MID(f.filename, INSTR(f.filename, '-') + 1, INSTR(f.filename, '.') - INSTR(f.filename, '-') - 1) = subquery.max_number;
