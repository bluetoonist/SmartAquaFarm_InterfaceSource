package growInfo;

public class growInfoDTO {
	// 蹂��닔 媛앹껜
	private int fishId;			// �젙蹂댁떇蹂� ID
	private int farmId;			// �뼇�떇�옣 ID
	private String fishName;	// �뼇�떇�젙蹂� �씠由�
	private	String State;		// �긽�깭(�젙�긽�씠�븯 �쐞�뿕(RM), �젙�긽�씠�긽 �쐞�뿕(YM), �젙�긽(G), �젙�긽�씠�긽 寃쎄퀬(Y), �젙�긽�씠�긽 �쐞�뿕(R))
	private double DOMax;		// �빐�떦 �긽�깭 �슜議댁궛�냼 理쒕�移�
	private double DOMin;		// �빐�떦 �긽�깭 �슜議댁궛�냼 理쒖냼移�
	private double WTMax;		// �빐�떦 �긽�깭 �닔�삩 理쒕�移�
	private double WTMin;		// �빐�떦 �긽�깭 �닔�삩 理쒖냼移�
	private double psuMax;		// �빐�떦 �긽�깭 �뿼�룄 理쒕�移�
	private double psuMin;		// �빐�떦 �긽�깭 �뿼�룄 理쒖냼移�
	private double pHMax;		// �빐�떦 �긽�깭 �궛�룄 理쒕�移�
	private double pHMin;		// �빐�떦 �긽�깭 �궛�룄 理쒖냼移�
	private double NH4Max;		// �빐�떦 �긽�깭 �븫紐⑤땲�븘 理쒕�移�
	private double NH4Min;		// �빐�떦 �긽�깭 �븫紐⑤땲�븘 理쒖냼移�
	private double NO2Max;		// �빐�떦 �긽�깭�븘吏덉궛 理쒕�移�
	private double NO2Min;		// �빐�떦 �긽�깭�븘吏덉궛 理쒖냼移�
	private String regDate;		// �젙蹂대벑濡앹씪
	private String regId;		// �젙蹂대벑濡앹옄
	private String lastUptdate;	// 理쒖쥌�닔�젙�씪
	private String lastUptId;	// 理쒖쥌�닔�젙�옄
	private String remark;		// 鍮꾧퀬
	private int groupCode;		// �젙蹂� 洹몃９ 肄붾뱶
	
	// getter/setter
	public int getFishId() {
		return fishId;
	}
	public void setFishId(int fishId) {
		this.fishId = fishId;
	}
	public int getFarmId() {
		return farmId;
	}
	public void setFarmId(int farmId) {
		this.farmId = farmId;
	}
	public String getFishName() {
		return fishName;
	}
	public void setFishName(String fishName) {
		this.fishName = fishName;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public double getDOMax() {
		return DOMax;
	}
	public void setDOMax(double dOMax) {
		DOMax = dOMax;
	}
	public double getDOMin() {
		return DOMin;
	}
	public void setDOMin(double dOMin) {
		DOMin = dOMin;
	}
	public double getWTMax() {
		return WTMax;
	}
	public void setWTMax(double wTMax) {
		WTMax = wTMax;
	}
	public double getWTMin() {
		return WTMin;
	}
	public void setWTMin(double wTMin) {
		WTMin = wTMin;
	}
	public double getPsuMax() {
		return psuMax;
	}
	public void setPsuMax(double psuMax) {
		this.psuMax = psuMax;
	}
	public double getPsuMin() {
		return psuMin;
	}
	public void setPsuMin(double psuMin) {
		this.psuMin = psuMin;
	}
	public double getpHMax() {
		return pHMax;
	}
	public void setpHMax(double pHMax) {
		this.pHMax = pHMax;
	}
	public double getpHMin() {
		return pHMin;
	}
	public void setpHMin(double pHMin) {
		this.pHMin = pHMin;
	}
	public double getNH4Max() {
		return NH4Max;
	}
	public void setNH4Max(double nH4Max) {
		NH4Max = nH4Max;
	}
	public double getNH4Min() {
		return NH4Min;
	}
	public void setNH4Min(double nH4Min) {
		NH4Min = nH4Min;
	}
	public double getNO2Max() {
		return NO2Max;
	}
	public void setNO2Max(double nO2Max) {
		NO2Max = nO2Max;
	}
	public double getNO2Min() {
		return NO2Min;
	}
	public void setNO2Min(double nO2Min) {
		NO2Min = nO2Min;
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
	public int getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(int groupCode) {
		this.groupCode = groupCode;
	}
}
