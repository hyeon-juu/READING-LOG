package readinglog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import readinglog.BannerDTO;
import readinglog.BannerService;

import java.util.List;

@RestController
public class BannerController {

    private final BannerService bannerService;

    @Autowired
    public BannerController(BannerService bannerService) {
        this.bannerService = bannerService;
    }

    @GetMapping("/banners")
    public List<BannerDTO> getBanners() {
        return bannerService.getBanners();
    }
}
