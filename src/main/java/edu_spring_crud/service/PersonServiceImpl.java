package edu_spring_crud.service;

import edu_spring_crud.dao.PersonDAO;
import edu_spring_crud.model.Person;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {

    private PersonDAO personDAO;

    public void setPersonDAO(PersonDAO personDAO) {
        this.personDAO = personDAO;
    }

    @Override
    @Transactional
    public void create(Person p) {
        this.personDAO.create(p);

    }

    @Override
    @Transactional
    public void update(Person p) {
        this.personDAO.update(p);
    }

    @Override
    @Transactional
    public void delete(int id) {
        this.personDAO.delete(id);
    }

    @Override
    @Transactional
    public Person getPersonById(int id) {
        return this.personDAO.getPersonById(id);
    }

    @Override
    @Transactional
    public List<Person> read() {
        return this.personDAO.read();
    }
}
