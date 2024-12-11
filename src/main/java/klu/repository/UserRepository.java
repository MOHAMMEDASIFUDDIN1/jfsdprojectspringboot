package klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import klu.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
    // Check if the username exists
    @Query("select count(U) from User U where U.username=:uname")
    public int validateUsername(@Param("uname") String uname);

    // Check if both username and password match
    // Replace this with a hashed password verification mechanism (e.g., BCrypt)
    @Query("select count(U) from User U where U.username=:uname and U.password=:pwd")
    public int validateCredentials(@Param("uname") String uname, @Param("pwd") String pwd);
}
