begin
    create_person(3, 'test3');
    commit;
exception when OTHERS then
    rollback;
    raise;
end;

select * from person;
select * from j_exec;
--truncate table j_exec;
--truncate table person;