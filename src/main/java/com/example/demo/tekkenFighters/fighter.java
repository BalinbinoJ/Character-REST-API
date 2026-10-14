package com.example.demo.tekkenFighters;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "characters")
public class fighter {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long characterId;

    @NotBlank 
    @NotNull 
    private String name;

    @NotBlank 
    @NotNull 
    private String description;

    @NotBlank 
    @NotNull 
    private String country;

    @NotBlank 
    @NotNull 
    private String fightingStyle;

    public fighter(){       
    }

    public Long getId(){
        return characterId;
    }

    public String getName(){
        return name;
    }

    public void setName(String name){
        this.name = name;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getCountry(){
        return country;
    }

    public void setCountry(String country){
        this.country = country;
    }

    public String getFightingStyle(){
        return fightingStyle;
    }

    public void setFightingStyle(String fightingStyle){
        this.fightingStyle = fightingStyle;
    }

}
