package by.kirill.news.controller;

import by.kirill.news.entity.User;
import by.kirill.news.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class UserController {


    public static final String MESSAGE_EMAIL_LOGIN_EXISTS = "messageErrorLoginOrEmailExists";
    public static final String ANSWER_EMAIL_LOGIN_EXISTS = "Login or email exists!! Try again.";
    public static final String LOGIN_PAGE = "login";
    public static final String REGISTRATION_PAGE = "registration";
    public static final String ACCESS_DENIED_PAGE = "accessDenied";
    public static final String REDIRECT_LOGIN_PAGE = "redirect:/showLoginPage?messageRegistrationOK=1";

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @Autowired
    private PasswordEncoder bcryptBean;

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage(Model model) {
        return LOGIN_PAGE;
    }

    @GetMapping("/registrationPage")
    public String showRegistrationPage() {
        return REGISTRATION_PAGE;
    }

    @PostMapping("/register")
    public ModelAndView registerNewUser(@Valid @ModelAttribute("user") User user, BindingResult theBindingResult) {

        ModelAndView modelAndView = new ModelAndView();

        if (theBindingResult.hasErrors()) {
            modelAndView.setViewName(REGISTRATION_PAGE);
        } else {
            user.setPass(bcryptBean.encode(user.getPass()));
            user.setRole("user");
            user.setStatus("user");
            userService.register(user);
            modelAndView.setViewName(REDIRECT_LOGIN_PAGE);
        }

        return modelAndView;
    }
}
