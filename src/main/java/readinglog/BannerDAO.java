package readinglog;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import readinglog.BannerDTO;

import java.util.List;

@Repository
public class BannerDAO {

    private final JdbcTemplate jdbcTemplate;

    public BannerDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<BannerDTO> getBanners() {
        String sql = "SELECT banner_title, banner_img FROM banner";
        return jdbcTemplate.query(sql, (rs, rowNum) -> 
            new BannerDTO(rs.getString("banner_title"), rs.getString("banner_img"))
        );
    }
}
