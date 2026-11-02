package main.java.com.example.demo.tekkenFighters;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.tekkenFighters.fighterService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


import com.example.demo.tekkenFighters.fighter;

@Controller
@RequestMapping("/characters")
public class fighterUiController {

    private final fighterService service;

    public fighterUiController(fighterService service){
        this.service = service;
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
