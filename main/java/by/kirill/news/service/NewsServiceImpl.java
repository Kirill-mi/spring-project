package by.kirill.news.service;

import by.kirill.news.dao.NewsDAO;
import by.kirill.news.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
public class NewsServiceImpl implements NewsService {
    public NewsServiceImpl(@Autowired NewsDAO newsDAO) {
        this.newsDAO = newsDAO;
    }

    private final NewsDAO newsDAO;

    @Override
    @Transactional
    public void createNews(News news) {
        newsDAO.create(news);
    }

    @Override
    @Transactional
    public void deleteNews(int id) {
        newsDAO.deleteNews(id);
    }

    @Override
    @Transactional
    public void updateNews(News news) {
         newsDAO.update(news);
    }

    @Override
    @Transactional
    public News readNews(int id) {
        return newsDAO.readNews(id);
    }

    @Override
    @Transactional
    public ArrayList<News> getLastNews(int page) {
        ArrayList<News> newsArrayList;
        newsArrayList = new ArrayList<>(newsDAO.readLastNews(page));
        return newsArrayList;
    }

    @Override
    @Transactional
    public int getNoOfRecords() {
        return newsDAO.getNoOfRecords();
    }

}

