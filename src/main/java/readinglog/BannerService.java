package readinglog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import readinglog.BannerDAO;
import readinglog.BannerDTO;

import java.util.List;

@Service
public class BannerService {

    private final BannerDAO bannerDAO;

    @Autowired
    public BannerService(BannerDAO bannerDAO) {
        this.bannerDAO = bannerDAO;
    }

    public List<BannerDTO> getBanners() {
        return bannerDAO.getBanners();
    }
}
