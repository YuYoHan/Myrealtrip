package dto.mainPage;

public class TravelCardDTO {
    private String title;
    private String contents;
    private String travelImage;

    public TravelCardDTO() {
    }

    public TravelCardDTO(String title, String contents, String travelImage) {
        this.title = title;
        this.contents = contents;
        this.travelImage = travelImage;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getTravelImage() {
        return travelImage;
    }

    public void setTravelImage(String travelImage) {
        this.travelImage = travelImage;
    }

    @Override
    public String toString() {
        return "TravelCardDTO{" +
                "title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", travelImage='" + travelImage + '\'' +
                '}';
    }
}
