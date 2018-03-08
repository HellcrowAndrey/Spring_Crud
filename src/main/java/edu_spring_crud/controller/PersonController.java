package edu_spring_crud.controller;

import edu_spring_crud.model.Person;
import edu_spring_crud.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PersonController  {
    private PersonService personService;

    @Autowired(required = true)
    @Qualifier(value = "personService")
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @RequestMapping(value = "people", method = RequestMethod.GET)
    public String read(Model model){
        model.addAttribute("person", new Person());
        model.addAttribute("read", this.personService.read());
        return "people";
    }

    @RequestMapping(value = "people/create", method = RequestMethod.POST)
    public String create(@ModelAttribute("person") Person person){
        if (person.getId() == 0){
            this.personService.create(person);
        }else {
            this.personService.update(person);
        }
        return "redirect:/people.form";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") int id){
        this.personService.delete(id);
        return "redirect:/people.form";
    }

    @RequestMapping("edit/{id}")
    public String edit(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("read", this.personService.read());
        return "people";
    }

    @RequestMapping("persondata/{id}")
    public String personDate(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        return "persondata";
    }

}
