package config.search;


public class SearchDTO {
    private String hotel_img_url;
    private String hotel_name;

    public String getHotel_img_url() {
        return hotel_img_url;
    }

    public void setHotel_img_url(String hotel_img_url) {
        this.hotel_img_url = hotel_img_url;
    }

    public String getHotel_name() {
        return hotel_name;
    }

    public void setHotel_name(String hotel_name) {
        this.hotel_name = hotel_name;
    }


    public SearchDTO(String hotel_img_url, String hotel_name){
        this.hotel_img_url = hotel_img_url;
        this.hotel_name = hotel_name;


    }

    public SearchDTO(){}
}
