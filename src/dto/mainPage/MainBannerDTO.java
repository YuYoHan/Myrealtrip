package dto.mainPage;

public class MainBannerDTO {
    private int bannerId;
    private String  bannerURL;
    private String bannerImage;

    public int getBannerId() {
        return bannerId;
    }
    public void setBannerId(int bannerId) {
        this.bannerId = bannerId;
    }
    public String getBannerURL() {
        return bannerURL;
    }
    public void setBannerURL(String bannerURL) {
        this.bannerURL = bannerURL;
    }
    public String getBannerImage() {
        return bannerImage;
    }
    public void setBannerImage(String bannerImage) {
        this.bannerImage = bannerImage;
    }

    @Override
    public String toString() {
        return "MainBannerDTO{" +
                "bannerId=" + bannerId +
                ", bannerURL='" + bannerURL + '\'' +
                ", bannerImage='" + bannerImage + '\'' +
                '}';
    }
}
