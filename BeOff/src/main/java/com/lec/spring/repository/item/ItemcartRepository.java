package com.lec.spring.repository.item;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lec.spring.domain.item.Itemcart;

public interface ItemcartRepository extends JpaRepository<Itemcart, Long> {

}
