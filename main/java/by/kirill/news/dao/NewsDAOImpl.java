package by.kirill.news.dao;

import by.kirill.news.entity.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDAOImpl implements NewsDAO {
    @Autowired
    private SessionFactory sessionFactory;
    public static final String QUERY_LIST_NEWS = "from News order by id";
    public static final String QUERY_COUNT_NEWS = "select count(*) from News";
    private final static String SQL_READ_LAST_NEWS = "SELECT SQL_CALC_FOUND_ROWS * FROM news limit ?,?";


    @Override
    public void create(News news) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(news);
    }

    @Override
    public void deleteNews(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("delete from News where id=:newsId").setParameter("newsId", id);
        query.executeUpdate();
    }

    @Override

    public void update(News news) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("update News set title = :titleParam, brief = :briefParam," +
                " text = :textParam where id = :newsId");

        query.setParameter("newsId", news.getId());
        query.setParameter("titleParam", news.getTitle());
        query.setParameter("briefParam", news.getBrief());
        query.setParameter("textParam", news.getText());
        query.executeUpdate();
    }

    @Override

    public News readNews(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(News.class, id);
    }

    @Override

    public List<News> readLastNews(int page) {
        Session currentSession = sessionFactory.getCurrentSession();
        List<News> news = currentSession.createQuery(QUERY_LIST_NEWS)
                .setFirstResult(5 * (page - 1)).setMaxResults(5)
                .list();
        return news;
    }

    @Override

    public int getNoOfRecords() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery(QUERY_COUNT_NEWS, Number.class).getSingleResult().intValue();
    }
}
