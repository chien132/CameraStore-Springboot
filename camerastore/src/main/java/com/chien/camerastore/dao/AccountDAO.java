package com.chien.camerastore.dao;

import com.chien.camerastore.model.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

@Transactional
public interface AccountDAO extends JpaRepository<Account,Integer> {
    Account deleteById(int id);
    Account findById(int id);
    Account findByEmail(String email);
    Account findByUsername(String username);

    @Query(value = "SELECT * FROM Account WHERE username = ?1 and password= ?2", nativeQuery = true)
    Account login(String username, String password);
}
