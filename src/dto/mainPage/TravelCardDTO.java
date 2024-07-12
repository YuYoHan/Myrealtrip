package dto.mainPage;

public class TravelCardDTO {
    private int id;
    private String title;
    private String contents;
    private String travelImage;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
                "id=" + id +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", travelImage='" + travelImage + '\'' +
                '}';
    }
}
