package com.example.demo.tekkenFighters;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

import java.util.List;

@RestController
@RequestMapping("/api/fighters")
public class fighterController {
    
    private final fighterService service;

    public fighterController(fighterService service){
        this.service = service;
    }

    @GetMapping
    public List<fighter> list(@RequestParam(required = false) String name,
            @RequestParam(required = false) String fightingStyle){
                return service.search(name, fightingStyle);
            }

    @GetMapping("/{id}")
    public fighter get(@PathVariable Long id){
        return service.findById(id);
    }

    @PostMapping 
    @ResponseStatus(HttpStatus.CREATED)
    public fighter create(@Valid @RequestBody fighter combatant){
        return service.create(combatant);
    }

    @PutMapping("/{id}")
    public fighter update(@PathVariable Long id, @Valid @RequestBody fighter combatant){
        return service.update(id, combatant);
    } 

    @DeleteMapping ("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id){
        service.delete(id);
    }
}
