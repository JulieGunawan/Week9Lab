/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.UserDB;
import java.util.List;
import models.User;
/**
 *
 * @author 829942
 */
public class UserService {
    
    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }
    
    public List<User> getAll() throws Exception {
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }
    
    
    public void insert(User thisUser) throws Exception {
        User user = thisUser;
        UserDB userDB = new UserDB();
        userDB.insert(user);
    }
    
    public void update(User thisUser) throws Exception {
        User user = thisUser;
        UserDB userDB = new UserDB();
        userDB.update(user);
    }
    
    public void delete(String email) throws Exception {
        UserDB userDB = new UserDB();
        userDB.delete(email);
    }
   
    
}
