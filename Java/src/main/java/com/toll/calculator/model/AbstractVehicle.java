package com.toll.calculator.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "vehicles")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "vehicle_type", discriminatorType = DiscriminatorType.STRING)
@Getter
@Setter
public abstract class AbstractVehicle implements Vehicle{

    @Id
    @Column(name = "vehicle_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String regNumber;

    private String type;

    @ElementCollection
    @CollectionTable(name = "toll_dates", joinColumns = @JoinColumn(name = "vehicle_id"))
    @Column(name = "crossed_date")
    private List<Date> tollDates = new ArrayList<>();


    private boolean isTollFree;

    protected AbstractVehicle(String name, String regNumber, boolean isTollFree) {
        this.type = name;
        this.regNumber = regNumber;
        this.isTollFree = isTollFree;
    }
}
