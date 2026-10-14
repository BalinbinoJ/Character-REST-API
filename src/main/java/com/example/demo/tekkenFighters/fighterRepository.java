package com.example.demo.tekkenFighters;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface fighterRepository extends JpaRepository<fighter, Long>{

    List<fighter> findByFightingStyle(String fightingStyle);

    List<fighter> findByNameContainingIgnoreCase(String name);

    List<fighter> findByNameContainingIgnoreCaseAndFightingStyle(String name, String fightingStyle);
    
} 
