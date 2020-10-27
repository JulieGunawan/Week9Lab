/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.util.List;
import models.User;

/**
 *
 * @author 829468
 */
public class RoleServices {
    public List<User> getAll (String email) throws Exception {
        UserDB noteDB = new UserDB();
        List<User> notes = UserDB.getAll(email);
        return notes;
    }
}
