package com.example.demo.tekkenFighters;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;



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
