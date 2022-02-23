package com.chien.camerastore.dao;

import com.chien.camerastore.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;

@Transactional
public interface AccountDAO extends JpaRepository<Account,Integer> {
    Account deleteById(int id);
    Account findById(int id);
    Account findByEmail(String email);
    Account findByUsername(String username);

}
