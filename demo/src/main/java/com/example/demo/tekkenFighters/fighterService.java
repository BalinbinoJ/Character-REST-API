package com.example.demo.tekkenFighters;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class fighterService {
    
    private final fighterRepository repository;


    public fighterService(fighterRepository repository){
        this.repository = repository;
    }

    public List<fighter> findAll(){
        return repository.findAll();
    }

    public List<fighter> findByFightingStyle(String fightingStyle){
        return repository.findByFightingStyle(fightingStyle);
    }

    public List<fighter> search(String name, String fightingStyle){
        boolean hasName = name != null && !name.isBlank();
        boolean hasFightingStyle = fightingStyle != null && !fightingStyle.isBlank();

        if (hasName && hasFightingStyle){
            return repository.findByNameContainingIgnoreCaseAndFightingStyle(name.trim(), fightingStyle.trim());
        }

        if (hasName){
            return repository.findByNameContainingIgnoreCase(name.trim());
        }

        if (hasFightingStyle){
            return repository.findByFightingStyle(fightingStyle.trim());
        }
        return repository.findAll();
    }

    public fighter findById (Long id){
        return repository.findById(id).orElseThrow(() -> new fighterNotFoundException(id));
    }

    public fighter create(fighter combatant){
        return repository.save(combatant);
    }

    public fighter update(Long id, fighter updated){
        fighter existing = findById(id);
        existing.setName(updated.getName());
        existing.setCountry(updated.getCountry());
        existing.setDescription(updated.getDescription());
        existing.setFightingStyle(updated.getFightingStyle());
        return repository.save(existing);
    }

    public void delete(Long id){
        findById(id);
        repository.deleteById(id);
    }
}
