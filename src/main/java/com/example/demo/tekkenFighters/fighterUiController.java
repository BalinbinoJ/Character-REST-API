package com.example.demo.tekkenFighters;

import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;



@Controller
//@RequestMapping("/characters")
public class fighterUiController {

    private final fighterService service;

    public fighterUiController(fighterService service){
        this.service = service;
    }

    @GetMapping({ "/", "/characters"})
  public String gallery(@RequestParam(required = false) String name,
      @RequestParam(required = false) String fightingStyle,
      Model model) {
    model.addAttribute("characters", service.search(name, fightingStyle));
    model.addAttribute("name", name == null ? "" : name);
    model.addAttribute("selectedFightingStyle", fightingStyle == null ? "" : fightingStyle);
    return "index"; // templates/index.ftlh
  }

  @GetMapping("/characters/new")
  public String newForm(Model model) {
    fighter fighter = new fighter();
    model.addAttribute("character", fighter);
    model.addAttribute("formTitle", "Add a Fighter");
    model.addAttribute("formAction", "/characters");
    return "fighter-form";
  }

  @PostMapping("/characters")
  public String createFighter(@Valid @ModelAttribute fighter fighter) {
    fighter createdFighter = service.create(fighter);
    return "redirect:/characters/" + createdFighter.getId();
  }

  @GetMapping("/characters/{id}/edit")
  public String editForm(@PathVariable Long id, Model model) {
    fighter fighter = service.findById(id);
    model.addAttribute("character", fighter);
    model.addAttribute("formTitle", "Edit Fighter");
    model.addAttribute("formAction", "/characters/" + id);
    return "fighter-form";
  }

    @PostMapping("/characters/{id}")
  public String updateFighter(@PathVariable Long id, @Valid @ModelAttribute fighter fighter) {
    fighter updatedFighter = service.update(id, fighter);
    return "redirect:/characters/" + updatedFighter.getId();
  }

  @PostMapping("/characters/{id}/delete")
  public String deleteFighter(@PathVariable Long id) {
    service.delete(id);
    return "redirect:/";
  }
    
    @GetMapping("/about")
    public String about(){
        return "about";
    }

    @GetMapping("/{id}")
    public String details(@PathVariable long id, Model model){
        fighter fighter = service.findById(id);

        model.addAttribute("char", fighter);

        return "details";
    }
}
