#https://github.com/ropensci/taxize
#https://docs.ropensci.org/taxize/
#분류학적 이름 확인: 생물학에서 흔히 하는 작업으로, 종 이름 목록을 가지고 있을 때 가장 최신의 이름인지, 이름이 올바르게 철자되었는지, 그리고 공통 이름에 대한 과학적 이름이 무엇인지 알고 싶을 때 사용합니다.
#상위 분류학적 이름 검색: 생물학자들이 종 목록에 대한 상위 분류학적 이름을 얻는 것은 흔한 작업입니다. 상위 분류를 알고 있으면 종 목록의 관계를 이해하는 데 도움이 됩니다. 
install.packages("taxize")
library('taxize') #v0.9.100
# 필요한 패키지를 설치하고 불러옵니다.
if (!require(vegan)) {
  install.packages("vegan")
  library(vegan)
}

# 표 S6에서 데이터를 불러옵니다.
# 이 부분은 실제 파일 경로와 파일 형식에 따라 변경해야 합니다.
data <- read.csv("table_S6.csv")

# Species accumulation curves를 계산합니다.
sac <- specaccum(data)

# 그래프를 그립니다.
plot(sac)
# data analysis process in R ----------------------------------------------
# Load your data
data <- read.csv("your_data.csv")
# Obtain taxonomic lineage
data$lineage <- classification(data$taxon, db = "ncbi")
# Correct for tag leakage
total_reads <- sum(data$read_number)
data$corrected_reads <- data$read_number - (0.001 * total_reads)


