package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import klu.model.User;
import klu.model.UserManager;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserManager userManager;

    @PostMapping("/signup")
    public ResponseEntity<String> signup(@RequestBody User user) {
        // Call userManager's signup method and return the response
        String result = userManager.signUp(user);
        return ResponseEntity.ok(result);  // Return the result string directly
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody User user) {
        // Call userManager's login method and return the response
        String result = userManager.login(user.getUsername(), user.getPassword());
        if ("200".equals(result)) {
            return ResponseEntity.ok(result); // Successful login
        } else {
            return ResponseEntity.badRequest().body(result); // Invalid credentials
        }
    }
}
