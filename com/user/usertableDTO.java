package user;

public class usertableDTO {
    // 蹂��닔 媛앹�?
    private String userId; // �궗�슜�옄ID
    private String userPw; // �궗�슜�옄?��꾨�踰덊?��
    private String userName; // �궗�슜�옄�씠?���?
    private String userTel; // �궗�슜�옄�뿰�씫泥�
    private String userAuth; // �궗�슜�옄沅뚰�?
    private String farmId; // �냼�냽�뼇�떇�옣ID
    private String regDate; // �젙蹂�?벑濡?��?��
    private String regId; // �젙蹂�?벑濡?��?��
    private String lastUptdate; // 理쒖쥌�?���젙�씪
    private String lastUptId; // 理쒖쥌�?���젙�옄
    private String remark; // ?��꾧�??

    // getter/setter
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public String getUserAuth() {
        return userAuth;
    }

    public void setUserAuth(String userAuth) {
        this.userAuth = userAuth;
    }

    public String getFarmId() {
        return farmId;
    }

    public void setFarmId(String farmId) {
        this.farmId = farmId;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getRegId() {
        return regId;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }

    public String getLastUptdate() {
        return lastUptdate;
    }

    public void setLastUptdate(String lastUptdate) {
        this.lastUptdate = lastUptdate;
    }

    public String getLastUptId() {
        return lastUptId;
    }

    public void setLastUptId(String lastUptId) {
        this.lastUptId = lastUptId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
