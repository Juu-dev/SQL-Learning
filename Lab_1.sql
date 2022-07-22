1. ALTER TABLE countries RENAME TO country_new;

2. ALTER TABLE locations ADD COLUMN region_id Int;

3. ALTER TABLE locations ADD COLUMN ID Int FIRST;

4. ALTER TABLE locations ADD region-id Int AFTER state_province;

5. ALTER TABLE locations ADD COLUMN country_id int;

6. ALTER TABLE locations DROP COLUMN city;

7. ALTER TABLE locations RENAME COLUMN state_province TO state;

8. ALTER TABLE locations ADD PRIMARY KEY (location_id);

9. ALTER TABLE locations ADD CONSTRAINT lct_pri PRIMARY KEY (location_id, country_id);

10. ALTER TABLE locations DROP CONSTRAINT lct_pri;

11. ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs (job_id);

12. ALTER TABLE job_history ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs (job_id);

13. ALTER TABLE job_history DROP FOREIGN KEY fk_job_id;

14. CREATE INDEX indx_job_id ON job_history(job_id);

15. DROP INDEX indx_job_id;
