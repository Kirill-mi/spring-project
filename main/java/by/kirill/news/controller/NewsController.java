package by.kirill.news.controller;

import by.kirill.news.entity.News;
import by.kirill.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.validation.Valid;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {
    public NewsController(@Autowired NewsService newsService) {
        this.newsService = newsService;
    }

    private final NewsService newsService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @RequestMapping("/main")
    public ModelAndView getLastNews(@RequestParam(defaultValue = "1") int page) {
        int recordsPerPage = 5;
        int noOfRecords = newsService.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        List<News> newsArray = newsService.getLastNews(page);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("listOfNews");
        modelAndView.addObject("page", page);
        modelAndView.addObject("newsArray", newsArray);
        modelAndView.addObject("pages", noOfPages);
        return modelAndView;
    }

    @PostMapping("/create")
    public ModelAndView createNews(@ModelAttribute("news") News news) {
        ModelAndView modelAndView = new ModelAndView();
        news.setDate(LocalDate.now());
        newsService.createNews(news);
        modelAndView.setViewName("redirect:/news/main");
        return modelAndView;
    }

    @PostMapping("/update")
    public ModelAndView updateNews(@Valid @ModelAttribute("news") News news, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("updateForm");
        } else {
            newsService.updateNews(news);
            modelAndView.setViewName("redirect:/news/main");
        }
        return modelAndView;
    }

    @GetMapping("/createForm")
    public String showCreateForm(Model model) {
        News news = new News();
        model.addAttribute("news", news);
        return "createForm";
    }

    @GetMapping("/updateForm")
    public String showUpdateForm(@RequestParam("newsId") int id, Model model) {
        News news = newsService.readNews(id);
        model.addAttribute("news", news);
        return "updateForm";
    }

    @GetMapping("/read")
    public ModelAndView readNews(@RequestParam("newsId") int id) {
        News news = newsService.readNews(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("readNews");
        modelAndView.addObject("news", news);
        return modelAndView;
    }

    @GetMapping("/delete")
    public String deleteNews(@RequestParam("newsId") int id) {
        newsService.deleteNews(id);
        return "redirect:/news/main";
    }
}

