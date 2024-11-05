#conda activate beautifulsoup4

import requests
from bs4 import BeautifulSoup

def parse_mean_values(url):
    # URL에 요청을 보냅니다.
    response = requests.get(url)
    response.raise_for_status()  # 요청이 성공했는지 확인합니다.

    # HTML 내용을 파싱합니다.
    soup = BeautifulSoup(response.text, 'html.parser')

    # 페이지의 두 번째 테이블을 찾습니다.
    mean_values = []
    tables = soup.find_all("table")  # 모든 테이블을 찾음
    if len(tables) >= 2:  # 테이블이 두 개 이상 있는지 확인
        table = tables[1]  # 두 번째 테이블 선택
        rows = table.find_all("tr")

        # 행을 반복하여 "mean" 행을 찾고 값을 추출합니다.
        for row in rows:
            if 'mean' in row.text.lower():
                # 평균 행의 모든 데이터 셀을 가져옵니다.
                cells = row.find_all("td")
                mean_values = [cell.get_text(strip=True) for cell in cells[10:15]] 
                break
    return mean_values

def process_urls_from_file(file_path, output_file):
    # 파일에서 URL 목록을 읽습니다.
    with open(file_path, 'r') as file:
        urls = [line.strip() for line in file.readlines() if line.strip()]

    # 출력 파일에 결과를 저장합니다.
    with open(output_file, 'w') as out_file:
        for url in urls:
            mean_values = parse_mean_values(url)
            if mean_values:
                # 평균 값을 탭으로 구분하여 출력 파일에 추가합니다.
                out_file.write("\t".join(mean_values) + "\n")

    print(f"Output saved to {output_file}")

# 파일 경로 설정 (예: "urls.txt" 파일에 여러 URL이 포함되어 있다고 가정)
file_path   = "1d_2d_ko_co-down_shoot_iaa_urls.txt"
output_file = "1d_2d_ko_co-down_shoot_iaa_means.txt"
process_urls_from_file(file_path, output_file)

