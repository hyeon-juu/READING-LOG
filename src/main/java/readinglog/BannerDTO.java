package readinglog;

public class BannerDTO {
    private String bannerTitle;
    private String bannerImg;

    public BannerDTO(String bannerTitle, String bannerImg) {
        this.bannerTitle = bannerTitle;
        this.bannerImg = bannerImg;
    }

    public String getBannerTitle() {
        return bannerTitle;
    }

    public void setBannerTitle(String bannerTitle) {
        this.bannerTitle = bannerTitle;
    }

    public String getBannerImg() {
        return bannerImg;
    }

    public void setBannerImg(String bannerImg) {
        this.bannerImg = bannerImg;
    }
}
