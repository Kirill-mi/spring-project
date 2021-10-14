package by.kirill.news.dao;

import by.kirill.news.entity.News;

import java.util.List;

public interface NewsDAO {
    void create(News news);

    void deleteNews(int id);

    void update(News news);

    News readNews(int id);

    List<News> readLastNews(int page);

    int getNoOfRecords();
}
