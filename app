
import streamlit as st
import os
import re
import time
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import altair as alt
import datetime


# # 1) 범용 출력
# st.write("Hello, **Streamlit**!")     # Markdown, 문자열, 데이터프레임 등 자동 판단

# # 2) 제목 계층
# st.title("앱 타이틀 / 제목")               # 가장 큰 제목
# st.header("섹션 헤더")             # 중간 크기
# st.subheader("소제목")             # 작은 크기

# # 3) 일반 텍스트 (고정폭)
# st.text("이것은 고정폭 일반 텍스트입니다.")

# # 4) HTML 태그 
# st.markdown("# 마크다운 제목")
# st.markdown("- 리스트1")
# st.markdown("- 리스트2")
# st.markdown("**이건 굵은 글씨 입니다.**")
# st.markdown("_기울임 텍스트_")
# st.markdown("""
#             - 리스트1
#             - 리스트2
#             - 리스트3            
#                     """)





# st.title("데이터 대시보드")

# st.markdown("## 오늘의 할일")
# st.markdown("- 데이터 로드")
# st.markdown("- 모델 학습")
# st.markdown("- 결과 시각화")



# input_name = st.text_input("영어로 입력하세요")


# # 2. 유효성 검사 로직
# if input_name:
#     # 정규표현식: 영문 대소문자와 공백만 허용
#     if not re.match(r'^[a-zA-Z\s]+$', input_name):
#         st.error("🚨 영문(A-Z, a-z)만 입력 가능합니다. 한글이나 특수문자는 제외해 주세요.")
#         st.stop()  # 조건이 맞지 않으면 아래 코드를 실행하지 않고 멈춤

#     # 3. 통과 시 결과 출력
#     st.markdown(f"## {input_name}'s todolist")
#     st.markdown("- 데이터 로드")
#     st.markdown("- 모델 학습")
#     st.markdown("- 결과 시각화")
# else:
#     st.info("이름을 입력하면 To-do list가 생성됩니다.")
    
    
    
    
    
#     # 1) Spinner: 작업 중 메시지 표시
# with st.spinner("데이터 로딩 중…"):
#     time.sleep(2)  # 실제 작업 대신 대기
# st.success("로딩 완료!")  # 작업 완료 시 알림

# # 2) Progress bar: 퍼센트 단위 진행 표시
# progress = st.progress(0)
# for percent_complete in range(100):
#     time.sleep(0.01)
#     progress.progress(percent_complete + 1)

# # 3) Balloons: 축하·완료 시 시각 효과
# st.balloons()




# # 1) 데이터 캐싱: @st.cache_data
# @st.cache_data(ttl=600)  # Time-to-live: 10초
# def load_data():
#     # 네트워크 요청이나 연산을 가정해 지연 추가
#     time.sleep(5)
#     return 42


# data = load_data()
# st.write(data)



# # 2) 리소스 캐싱: @st.cache_resource
# @st.cache_resource # instance, db connection 등 무거운 리소스 캐싱
# def init_model():
#     # 머신러닝 모델 로드(무거운 작업)
#     time.sleep(5)
#     from sklearn.ensemble import RandomForestClassifier
#     return RandomForestClassifier()



# model = init_model()
# st.write("모델 준비 완료")


# # 예제 DataFrame 생성
# data = {
#     "이름": ["홍길동", "이영희", "김철수"],
#     "나이": [25, 30, 22],
#     "성별": ["남", "여", "남"],
# }
# df = pd.DataFrame(data)

# # 1) st.dataframe: 인터랙티브한 스크롤•정렬 가능 테이블
# st.dataframe(df, use_container_width=True)

# # 2) st.table: 고정된 표(정적) 형태
# st.table(df)

# # 3) st.json: JSON 형식 데이터 시각화
# record = {"이름": "박민수", "나이": 28, "취미": ["독서", "등산"]}
# st.json(record)


# df = pd.DataFrame({
#     "제품": ["사과", "바나나", "체리"],
#     "가격": [1200, 800, 1500],
#     "재고": [30, 50, 20]
# })

# st.dataframe(df, width=300,height=150, hide_index=True) 
# # st.dataframe(df) 


# st.table(df)

# person = {
#     "name": "홍길동",
#     "age": 29,
#     "skills": {"python": "advanced", "streamlit": "intermediate"}
# }
# st.json(person)


# # 1) 기본 Metric: label + value
# st.metric(label="현재 온도", value="22°C")

# # 2) 증가·감소량(delta) 표시
# st.metric(label="월간 매출", value="₩50,000,000", delta="+5%")

# # 3) 음수 delta
# st.metric(label="고객 이탈률", value="8.2%", delta="-0.4%")

# # 4) 도움말(hover) 텍스트
# st.metric(label="신규 가입자", value="1,250명", delta="+150명", help="전월 대비 신규 가입자 수")


# data = {
#     "월": ["2025-01", "2025-02", "2025-03", "2025-04", "2025-05"],
#     "매출": [45000000, 50000000, 48000000, 52000000, 55000000],
# }

# df = pd.DataFrame(data)

# # 2. 4월과 5월 데이터 추출 (비교 대상 필터링)
# april_sales = df[df["월"] == "2025-04"]["매출"].values[0]
# may_sales = df[df["월"] == "2025-05"]["매출"].values[0]

# # 3. MoM 계산 (차이 및 퍼센트)
# diff = may_sales - april_sales
# percent_change = (diff / april_sales) * 100

# # 4. 스트림릿 화면 구성
# st.title("💰 월간 매출 성장 분석 (MoM)")

# # 데이터 프레임 띄우기 (4, 5월만)
# st.subheader("4월-5월 데이터 현황")
# comparison_df = df[df["월"].isin(["2025-04", "2025-05"])]
# st.dataframe(comparison_df, use_container_width=True)

# # 메트릭으로 표시
# st.subheader("최신 달(5월) 성과 지표")

# # f-string을 활용한 포맷팅 (가독성을 위해 천 단위 콤마 추가)
# col1, col2 = st.columns(2)

# with col1:
#     st.metric(
#         label="2025-05 매출", 
#         value=f"{may_sales:,}원", 
#         delta=f"{diff:,}원 ({percent_change:.2f}%)"
#     )

# with col2:
#     # 성장을 한눈에 보여주는 추가 메시지
#     if diff > 0:
#         st.success(f"🚀 전월 대비 {percent_change:.1f}% 성장했습니다!")
#     else:
#         st.warning("📉 매출 관리가 필요한 시점입니다.")


# # 1) 예제: 랜덤 위치 데이터 생성
# df = pd.DataFrame({
#     "lat": [37.5665, 37.5651, 37.5700, 37.5610],
#     "lon": [126.9780, 126.9895, 126.9820, 126.9750],
#     "장소": ["광화문", "종로3가", "시청", "을지로입구"]
# })

# # 2) st.map: 간단히 점만 표시
# st.map(df)

# # 3) st.pydeck_chart: 스타일·레이어 지정
# import pydeck as pdk

# layer = pdk.Layer(
#     "ScatterplotLayer",
#     data=df,
#     get_position=["lon", "lat"],
#     get_color=[255, 0, 0],
#     get_radius=200,
# )

# view_state = pdk.ViewState(
#     latitude=37.5665,
#     longitude=126.9780,
#     zoom=13,
#     pitch=50,
# )

# r = pdk.Deck(
#     layers=[layer],
#     initial_view_state=view_state,
#     tooltip={"text": "{장소}\n위도: {lat}\n경도: {lon}"}
# )

# st.pydeck_chart(r)

# # 예제 시계열 데이터
# dates = pd.date_range("2025-01-01", periods=12, freq="M")
# data = pd.DataFrame({
#     "매출": np.random.randint(40_000_000, 60_000_000, size=12),
#     "방문자": np.random.randint(1_000, 3_000, size=12), 
# }, index=dates)

# # 1) 내장 라인 차트
# st.line_chart(data["매출"], use_container_width=True)

# # 2) 내장 바 차트
# st.bar_chart(data["방문자"], use_container_width=True)

# # 3) 내장 영역 차트
# st.area_chart(data, use_container_width=True)

# # 4) Matplotlib 연동: 히스토그램
# fig1, ax1 = plt.subplots()
# ax1.hist(data["방문자"], bins=10)
# ax1.set_title("월별 방문자 분포")
# ax1.set_xlabel("방문자 수")
# ax1.set_ylabel("빈도")
# st.pyplot(fig1)

# # 5) Matplotlib 연동: 매출과 방문자 선 그래프
# fig2, ax2 = plt.subplots()
# ax2.plot(data.index, data["매출"], label="매출")
# ax2.plot(data.index, data["방문자"], label="방문자")
# ax2.set_title("월별 매출 및 방문자 추이")
# ax2.set_xlabel("월")
# ax2.set_ylabel("값")
# ax2.legend()
# st.pyplot(fig2)


# # 1) 슬라이더: 단일 값 / 범위 선택
# age = st.slider("나이 선택", min_value=0, max_value=100, value=25)
# range_values = st.slider("범위 선택", 0.0, 1.0, (0.2, 0.8))

# # 2) 체크박스 / 라디오 버튼
# show_chart = st.checkbox("차트 표시하기", value=True)
# option = st.radio("옵션 선택", ("옵션 A", "옵션 B", "옵션 C"))

# # 3) 셀렉트박스 / 멀티셀렉트박스
# city = st.selectbox("도시 선택", ["서울", "부산", "대구"])
# languages = st.multiselect("사용 가능 언어", ["Python", "Java", "C++", "Go"], default=["Python"])

# # 4) 텍스트 입력 / 텍스트 영역
# name = st.text_input("이름을 입력하세요", placeholder="홍길동")
# comments = st.text_area("코멘트를 남겨주세요", height=100)

# # 5) 숫자 입력 / 날짜·시간 선택
# price = st.number_input("가격 입력", min_value=0, max_value=1_000_000, value=10000, step=1000)
# date = st.date_input("날짜 선택")
# time_val = st.time_input("시간 선택")

# # 결과 출력
# st.write(f"나이: {age}")
# st.write(f"범위: {range_values}")
# st.write(f"차트 표시: {show_chart}")
# st.write(f"선택된 옵션: {option}")
# st.write(f"도시: {city}, 언어: {languages}")
# st.write(f"이름: {name}")
# st.write(f"가격: {price:,}원")
# st.write(f"날짜·시간: {date} {time_val}")
















# ---------------------------------------------------------
# 1. 데이터 로드 및 전처리
# ---------------------------------------------------------
# @st.cache_data
# def load_data():
#     file_path = "netflix_users.csv"
    
#     if not os.path.exists(file_path):
#         st.error(f"🚨 '{file_path}' 파일을 찾을 수 없습니다.")
#         st.stop()
        
#     df = pd.read_csv(file_path)
    
#     # 날짜 변환
#     if "Last_Login" in df.columns:
#         df["Last_Login"] = pd.to_datetime(df["Last_Login"])
        
#     # [Genius Feature] 연령대(Age Group) 파생 변수 생성
#     bins = [0, 19, 29, 49, 64, 100]
#     labels = ['10s (Teens)', '20s (Young Adult)', '30-40s (Adult)', '50-64 (Middle)', '65+ (Senior)']
#     df['Age_Group'] = pd.cut(df['Age'], bins=bins, labels=labels, right=True)
    
#     return df

# # ---------------------------------------------------------
# # 2. "ALL" 기능이 포함된 스마트 사이드바 로직
# # ---------------------------------------------------------
# def render_sidebar(df):
#     st.sidebar.header("🔍 Smart Filter System")
    
#     # --- Helper Function for "ALL" Selection ---
#     def multi_select_with_all(label, options, default_all=True):
#         """'ALL' 옵션을 포함한 멀티 셀렉트 위젯을 생성합니다."""
#         options_with_all = ["ALL"] + sorted(options)
        
#         # 기본값 설정 (ALL 선택)
#         default_val = ["ALL"] if default_all else []
        
#         selected = st.sidebar.multiselect(label, options_with_all, default=default_val)
        
#         # 'ALL'이 선택되어 있으면 전체 옵션을 반환, 아니면 선택된 것만 반환
#         if "ALL" in selected:
#             return options # 전체 리스트 반환
#         else:
#             return selected

#     # 1. Country Filter
#     selected_countries = multi_select_with_all("🌍 국가 선택", df['Country'].unique())
    
#     # 2. Subscription Filter
#     selected_subs = multi_select_with_all("💳 구독 유형", df['Subscription_Type'].unique())
    
#     # 3. Genre Filter
#     selected_genres = multi_select_with_all("🎭 선호 장르", df['Favorite_Genre'].unique())
    
#     # 4. Age Range Slider (전체 데이터 기준 범위 설정)
#     min_val, max_val = int(df['Age'].min()), int(df['Age'].max())
#     age_range = st.sidebar.slider("🎂 연령 범위", min_val, max_val, (min_val, max_val))
    
#     # 필터링 적용
#     filtered_df = df[
#         (df['Country'].isin(selected_countries)) &
#         (df['Subscription_Type'].isin(selected_subs)) &
#         (df['Favorite_Genre'].isin(selected_genres)) &
#         (df['Age'] >= age_range[0]) & 
#         (df['Age'] <= age_range[1])
#     ]
    
#     st.sidebar.markdown("---")
#     st.sidebar.info(f"Filtered: {len(filtered_df)} / {len(df)} users")
    
#     return filtered_df

# # ---------------------------------------------------------
# # 3. 메인 대시보드 UI
# # ---------------------------------------------------------
# st.set_page_config(layout="wide", page_title="Netflix Analytics Pro")

# # 데이터 로드
# raw_df = load_data()

# # [중요] 차트 축 고정을 위한 전역 변수 설정 (에러 해결 포인트)
# # 필터링과 상관없이 전체 데이터의 최소/최대 나이를 기억합니다.
# GLOBAL_MIN_AGE = int(raw_df['Age'].min())
# GLOBAL_MAX_AGE = int(raw_df['Age'].max())

# # 사이드바 렌더링 및 필터링
# df = render_sidebar(raw_df)

# st.title("🎬 Netflix Analytics Pro")
# st.markdown("Global Filter ('ALL') 기능과 안정적인 차트 렌더링이 적용된 버전입니다.")

# if df.empty:
#     st.warning("⚠️ 선택된 조건에 맞는 데이터가 없습니다. 필터를 넓게 잡아주세요.")
#     st.stop()

# st.divider()

# # === KPI Section ===
# c1, c2, c3, c4 = st.columns(4)
# c1.metric("Selected Users", f"{len(df)}명")
# c2.metric("Avg. Watch Time", f"{df['Watch_Time_Hours'].mean():.1f} hrs")
# c3.metric("Top Genre", df['Favorite_Genre'].mode()[0] if not df.empty else "-")
# c4.metric("Age Range", f"{df['Age'].min()} - {df['Age'].max()}세")

# st.divider()

# # === Advanced Analysis Tabs ===
# tab1, tab2, tab3 = st.tabs([
#     "🧩 세대별 취향 (Age & Genre)", 
#     "🗺️ 지리적 분포 (Geography)", 
#     "⚡ 활동성 분석 (Engagement)"
# ])

# # --- Tab 1: 세대별 취향 ---
# with tab1:
#     st.subheader("Generation DNA")
#     col_a, col_b = st.columns([1.5, 1])
    
#     with col_a:
#         st.markdown("**1. 연령대별 선호 장르 히트맵**")
#         heatmap = alt.Chart(df).mark_rect().encode(
#             x=alt.X('Favorite_Genre:N', title='Genre'),
#             y=alt.Y('Age_Group:O', title='Age Group'),
#             color=alt.Color('count()', title='Users', scale=alt.Scale(scheme='orangered')),
#             tooltip=['Age_Group', 'Favorite_Genre', 'count()']
#         ).properties(height=350)
#         st.altair_chart(heatmap, use_container_width=True)

#     with col_b:
#         st.markdown("**2. 연령대별 평균 시청 시간**")
#         bar_chart = alt.Chart(df).mark_bar(color='#E50914').encode(
#             x=alt.X('Age_Group:O', title='Age Group', axis=alt.Axis(labelAngle=0)),
#             y=alt.Y('mean(Watch_Time_Hours):Q', title='Avg Watch Time'),
#             tooltip=['Age_Group', 'mean(Watch_Time_Hours)']
#         ).properties(height=350)
#         st.altair_chart(bar_chart, use_container_width=True)

# # --- Tab 2: 지리적 분포 ---
# with tab2:
#     st.subheader("Global Market")
#     col_c, col_d = st.columns(2)
    
#     with col_c:
#         st.markdown("**3. 국가별 구독 유형 (Stacked Bar)**")
#         stacked = alt.Chart(df).mark_bar().encode(
#             x=alt.X('count()', title='Count'),
#             y=alt.Y('Country:N', sort='-x'),
#             color=alt.Color('Subscription_Type:N', scale=alt.Scale(scheme='spectral')),
#             tooltip=['Country', 'Subscription_Type', 'count()']
#         ).properties(height=300)
#         st.altair_chart(stacked, use_container_width=True)

#     with col_d:
#         st.markdown("**4. 국가별 시청 시간 분포 (Box Plot)**")
#         box = alt.Chart(df).mark_boxplot().encode(
#             x=alt.X('Watch_Time_Hours:Q', title='Hours'),
#             y=alt.Y('Country:N', title=None),
#             color=alt.Color('Country:N', legend=None)
#         ).properties(height=300)
#         st.altair_chart(box, use_container_width=True)

# # --- Tab 3: 활동성 분석 (에러 수정 완료) ---
# with tab3:
#     st.subheader("Deep Dive Engagement")
#     st.markdown("**5. 구독 유형에 따른 시청 시간 vs 나이 (Fixed Axis)**")
    
#     # [수정됨] 여기서 지역 변수 min_age가 아닌, 전역 변수 GLOBAL_MIN_AGE를 사용합니다.
#     scatter = alt.Chart(df).mark_circle().encode(
#         x=alt.X('Age:Q', 
#                 title='Age', 
#                 # 도메인을 전체 데이터 기준으로 고정하여 필터링 시 차트 흔들림 방지
#                 scale=alt.Scale(domain=[GLOBAL_MIN_AGE - 5, GLOBAL_MAX_AGE + 5])),
#         y=alt.Y('Watch_Time_Hours:Q', title='Watch Hours'),
#         size=alt.Size('Watch_Time_Hours:Q', scale=alt.Scale(range=[50, 500]), legend=None),
#         color=alt.Color('Subscription_Type:N', title='Subscription'),
#         tooltip=['Name', 'Country', 'Age', 'Watch_Time_Hours']
#     ).interactive().properties(height=400)
    
#     st.altair_chart(scatter, use_container_width=True)


# 1) 사이드바: 앱 전역 네비게이션
st.sidebar.title("메뉴")
page = st.sidebar.selectbox("페이지 선택", ["홈", "분석", "리포트"])
if page == "홈":
    st.write("🏠 홈 페이지")
elif page == "분석":
    st.write("📊 분석 페이지")
else:
    st.write("⚙️ 리포트 페이지")

# 2) 컬럼: 가로 분할 레이아웃
col1, col2, col3, col4 = st.columns(4)

# 1. 컬럼과 버튼 이름을 매핑하여 생성
with col1:
    bt1 = st.button("버튼1")
with col2:
    bt2 = st.button("버튼2")
with col3:
    bt3 = st.button("버튼3")
with col4:
    bt4 = st.button("버튼4")

# 2. 버튼 상태와 이름을 리스트로 묶음 (이름, 상태)
buttons = [
    ("버튼1", bt1),
    ("버튼2", bt2),
    ("버튼3", bt3),
    ("버튼4", bt4)
]

# 3. 반복문 실행
for name, is_clicked in buttons:
    if is_clicked:
        st.success(f"🚀 {name}가 켜져있습니다!")
    
    
# 버튼 4개를 나열하는 대신, 선택형 알약 버튼 사용
selected = st.pills("메뉴를 선택하세요", ["버튼1", "버튼2", "버튼3", "버튼4"])

if selected:
    st.write(f"✅ {selected}가 선택된 상태입니다.")
    
    
###################################


# 3) 탭: 탭별 콘텐츠 분리
tab1, tab2 = st.tabs(["차트 보기", "테이블 보기"])
with tab1:
    st.line_chart([10, 20, 15, 30, 25])
with tab2:
    st.table({"A": [1,2,3], "B": [4,5,6]})

# 4) 익스팬더: 숨김/접기 가능한 섹션
with st.expander("추가 설명 보기"):
    st.write("여기에 상세 설명 또는 도움말을 넣을 수 있습니다.")

# 5) 컨테이너: 위젯 그룹화
with st.container():
    st.write("이 컨테이너 안의 요소들은 함께 렌더링됩니다.")
    st.button("컨테이너 버튼")
