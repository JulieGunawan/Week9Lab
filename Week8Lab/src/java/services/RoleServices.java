/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.RoleDB;
import java.util.List;
import models.Role;

/**
 *
 * @author 829468
 */
public class RoleServices {
    public List<Role> getAll (String email) throws Exception {
        RoleDB roleDB = new RoleDB();
        List<Role> roles = RoleDB.getAll();
        return roles;
    }
}
