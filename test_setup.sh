#!/bin/bash


env PGPASSWORD=$TEST_PASSWORD psql -v ON_ERROR_STOP=1 -q -U $TEST_USERNAME -d $TEST_DATABASE -f project.sql
env PGPASSWORD=$TEST_PASSWORD psql -v ON_ERROR_STOP=1 -q -U $TEST_USERNAME -d $TEST_DATABASE -f project_test.sql

env PGPASSWORD=$TEST_PASSWORD psql -v ON_ERROR_STOP=1 -q -U $TEST_USERNAME -d $TEST_DATABASE <<-SQL
	SELECT assert.add_test('example', 'test_sum');
	SELECT assert.add_test('example', 'test_sum_fix_errors');
SQL

