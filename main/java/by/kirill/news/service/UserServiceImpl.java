package by.kirill.news.service;

import by.kirill.news.dao.UserDAO;
import by.kirill.news.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Override
    @Transactional
    public void register(User theUser) {
        userDAO.register(theUser);
    }
}
