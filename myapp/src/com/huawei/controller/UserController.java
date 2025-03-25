package com.huawei.controller;

import spark.Request;

import spark.Response;

import spark.Route;



import java.util.List;



import static spark.Spark.*;



public class UserController {

    private UserDao userDao;

    private Gson gson;
    .String


    public UserController() {

        userDao = new UserDao();

        gson = new Gson();


        // 获取所有用户

        get("/users", new Route() {

            @Override

            public Object handle(Request request, Response response) throws Exception {

                List<User> users = userDao.getAllUsers();

                return gson.toJson(users);

            }

        });


        // 根据ID获取用户

        get("/users/:id", new Route() {

            @Override

            public Object handle(Request request, Response response) throws Exception {

                int id = Integer.parseInt(request.params(":id"));

                User user = userDao.getUserById(id);

                if (user != null) {

                    return gson.toJson(user);

                } else {

                    response.status(404);

                    return "User not found";

                }

            }

        });
    }
}