package by.kirill.news.service;

import by.kirill.news.entity.News;

import java.util.ArrayList;

public interface NewsService {
    void createNews(News news);

    void deleteNews(int id);

    void updateNews(News news);

    News readNews(int id);

    ArrayList<News> getLastNews(int page);

    int getNoOfRecords();
}
