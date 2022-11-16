create or replace procedure create_person(
p_id person.id%TYPE, 
p_name person.name%TYPE)
is
    r_person person%rowtype;
begin
    delete from j_exec where fn_name = 'create_person';
    
    log_pkg.saveline('create_person');
    
    r_person.id := p_id;
    r_person.name := p_name;
    
    insert into person values r_person;
end;