package edu_spring_crud.dao;

import edu_spring_crud.model.Person;

import java.util.List;

public interface PersonDAO {
    public void create(Person p);

    public void update(Person p);

    public void delete(int id);

    public Person getPersonById(int id);

    public List<Person> read();
}
