-- 회원 테이블
CREATE TABLE memberDB (    
    id 			        VARCHAR2(50) PRIMARY KEY -- 아이디
    , password          VARCHAR2(20)   NOT NULL -- 패스워드
    , nickname          VARCHAR2(20)   NOT NULL -- 닉네임
    , cert				VARCHAR2(1)    DEFAULT 'N' NOT NULL -- 이메일 인증 여부
    , payment     		VARCHAR2(1)   DEFAULT 'N' NOT NULL -- 결제 여부
    , authCode          VARCHAR2(200)
    , authstatus        NUMBER default 0 
    
    , CONSTRAINT Member_Cert_CK CHECK (cert IN('Y', 'N'))
    , CONSTRAINT Member_Payment_CK CHECK (payment IN('Y', 'N'))
);

-- 웹 주소
CREATE TABLE webLocationDB (
	siteId				NUMBER PRIMARY KEY -- 사이트 식별 ID
	, id 				VARCHAR2(50) NOT NULL -- 회원 ID
	
	, CONSTRAINT Location_FK FOREIGN KEY(id)
    REFERENCES memberDB(id) ON DELETE CASCADE
);

-- 코드, 페이지번호
CREATE TABLE webCodeDB (
	CodeNum 			NUMBER PRIMARY KEY -- 코드 식별번호
	, siteId			NUMBER NOT NULL -- 사이트 식별 ID
	, pageNum 			NUMBER NOT NULL -- 페이지 번호
	, Code				CLOB NOT NULL -- 코드
	
	, CONSTRAINT Code_FK FOREIGN KEY(siteId)
    REFERENCES webLocationDB(siteId) ON DELETE CASCADE				
);

-- 코드식별을 위한 Sequence
CREATE SEQUENCE webCode_Sequence;

-- 생성 웹 사이트의 회원가입을 위한 DB
CREATE TABLE webSiteMemberDB (
	id					VARCHAR2(50) NOT NULL -- id
	, siteId			NUMBER NOT NULL -- site
	, password			VARCHAR2(20) NOT NULL -- 비밀번호
	, authority			VARCHAR2(10) NOT NULL -- 권한
	, sex				VARCHAR2(1) DEFAULT 'M' -- 성별
	, nickname			VARCHAR2(20)  -- 닉네임
	, email				VARCHAR2(50)  -- 이메일
	, tel				VARCHAR2(15) -- 전화번호
	, address			VARCHAR2(50) -- 주소
	, grade				NUMBER -- 등급
	, likes				NUMBER -- 추천수
	, hits				NUMBER -- 조회수
	, registration_date	DATE DEFAULT SYSDATE -- 등록일
	, login_date		DATE DEFAULT SYSDATE -- 최근 로그인
	, point				NUMBER DEFAULT 0 NOT NULL -- 포인트
	
	, CONSTRAINT siteMember_FK FOREIGN KEY(siteId) -- 외래키
    REFERENCES webLocationDB(siteId) ON DELETE CASCADE
    , CONSTRAINT siteMember_PK PRIMARY KEY(id, siteId) -- 복합키 설정
);

-- 생성 웹 사이트의 게시판을 위한 DB
CREATE TABLE webSiteBoardDB (
	boardNum			NUMBER PRIMARY KEY -- 보드넘
	, id				VARCHAR2(20) NOT NULL -- 아이디
    , siteId            NUMBER NOT NULL
	, title				VARCHAR(200) NOT NULL -- 타이틀
	, contents			VARCHAR(2000) NOT NULL -- 내용
	, inputdate			DATE DEFAULT SYSDATE -- 등록일
	
	, CONSTRAINT siteBoard_FK FOREIGN KEY(id, siteId) -- 외래키, 복합키를 외래키로 받고 있음.
    REFERENCES webSiteMemberDB(id, siteID) ON DELETE CASCADE 
);

-- 생성 웹사이트의 BoardNUM을 위한 Sequence
CREATE SEQUENCE webSiteBoard_Sequence;

-- 템플릿을 위한 DB
CREATE TABLE Template (
	-- 템플릿 번호
	-- 템플릿 이름
	-- 템플릿 css
	-- 템플릿 js
	-- 템플릿 html
)