#!/bin/bash
find -type f -iname "*.sql" -exec psql -f {} \;
