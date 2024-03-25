#https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot
#https://docs.github.com/en/copilot/configuring-github-copilot/configuring-github-copilot-in-your-environment?tool=vscode
function calculateDaysBetweenDates(startDate, endDate) {
  // The number of milliseconds in one day
  const ONE_DAY = 1000 * 60 * 60 * 24

  // Convert both dates to milliseconds
  const date1 = new Date(startDate).getTime()
  const date2 = new Date(endDate).getTime()

  // Calculate the difference in milliseconds
  const difference = Math.abs(date1 - date2)

  // Convert back to days and return
  return Math.ceil(difference / ONE_DAY)
}

#JavaScript 파일에 다음 주석을 입력합니다. GitHub Copilot은 함수의 구현을 제안합니다.
#Write unit tests for this function
// find all images without alternate text
// and give them a red border
function processImagesWithoutAltText() {
  const images = document.querySelectorAll('img')
  images.forEach(image => {
    if (!image.alt) {
      image.style.border = '1px solid red'
    }
  })
}

// Path: github_copilot.py
#https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot
#https://docs.github.com/en/copilot/configuring-github-copilot/configuring-github-copilot-in-your-environment?tool=vscode
def calculate_days_between_dates(start_date, end_date):
    # The number of milliseconds in one day
    ONE_DAY = 1000 * 60 * 60 * 24

    # Convert both dates to milliseconds
    date1 = start_date.timestamp()
    date2 = end_date.timestamp()

    # Calculate the difference in milliseconds
    difference = abs(date1 - date2)

    # Convert back to days and return
    return round(difference / ONE_DAY)

#Python 파일에 다음 주석을 입력합니다. GitHub Copilot은 함수의 구현을 제안합니다.
# find all images without alternate text
# and give them a red border
def process_images_without_alt_text():
    images = document.querySelectorAll('img')
    for image in images:
        if not image.alt:
            image.style.border = '1px solid red'
```

## 5. GitHub Copilot 사용 팁
```bash
# Path: github_copilot.js
#https://docs.github.com/en/copilot/using-github-copilot/getting-started-with-github-copilot
#https://docs.github.com/en/copilot/configuring-github-copilot/configuring-github-copilot-in-your-environment?tool=vscode
function getAverage(numbers) {
  // Calculate the sum of all numbers
  const sum = numbers.reduce((acc, num) => acc + num, 0)

  // Calculate the average
  return sum / numbers.length
}

function getMedian(numbers) {
  // Sort the numbers in ascending order
  const sortedNumbers = numbers.sort((a, b) => a - b)

  // Calculate the middle index
  const middleIndex = Math.floor(sortedNumbers.length / 2)

  // Check if the length is even or odd
  if (sortedNumbers.length % 2 === 0) {