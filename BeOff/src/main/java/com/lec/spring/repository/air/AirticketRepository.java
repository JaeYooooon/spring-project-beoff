package com.lec.spring.repository.air;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lec.spring.domain.air.Airticket;

public interface AirticketRepository extends JpaRepository<Airticket, Long> {

}
