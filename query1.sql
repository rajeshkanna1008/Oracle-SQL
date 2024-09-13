SELECT *
FROM all_source
WHERE upper(TEXT) LIKE '%GETORDDTL%';
ORDER BY owner, name, line;

select * from DBA_dependencies
where --type like 'PACKAGE%'
REFERENCED_NAME LIKE '%XXX_ROUTING_CONV_STG_T%';
--AND REFERENCED_OWNER = 'APPS'; 

select * from ALL_dependencies
where REFERENCED_NAME like 'XXX_MCQPBIZ%';
SELECT * FROM USER_PROCEDURES
WHERE OBJECT_NAME LIKE 'XXX_MCQPBIZ%';

select * from XXX_PARTS_LEADTIME_PKG;
select * from all_source;
SELECT * FROM ALL_OBJECTS WHERE OBJECT_ID = 5124048;

with dep2 as (
    select dep.*
    from all_dependencies dep
    where dep.owner not in ('SYS', 'SYSTEM', 'PUBLIC', 'XDB')
    and dep.referenced_owner not in ('SYS', 'SYSTEM', 'PUBLIC', 'XDB')
    and dep.referenced_type = 'PACKAGE'
    and dep.dependency_type != 'NON-EXISTENT'
    and (dep.referenced_owner || '.' || dep.referenced_name) != (dep.owner || '.' || dep.name)
),
dep3 as (
    select owner || '.' || name as child,
    referenced_owner || '.' || referenced_name as parent
    from dep2
)
select connect_by_root parent, lpad(' ',2*(level-1)) || to_char(child) 
from dep3
start with parent = 'SCHEMA.PACKAGE_NAME'
connect by nocycle prior child = parent 
and exists (select 1 from all_source where (owner || '.' || name) = dep3.child and upper(text) like upper('%optional, some string you may want to search%')) 
;