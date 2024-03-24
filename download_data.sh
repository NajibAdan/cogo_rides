
URL_PREFIX="https://cogo-sys-data.s3.amazonaws.com"
for YEAR in {2018..2024} ; do
    for MONTH in {1..12}; do
        FMONTH=`printf "%02d" ${MONTH}`

        URL="${URL_PREFIX}/${YEAR}${FMONTH}-cogo-tripdata.zip"

        LOCAL_PREFIX="data/raw/${YEAR}/${FMONTH}"
        LOCAL_FILE="${YEAR}${FMONTH}-cogo-tripdata.zip"
        LOCAL_CSV_FILE="${YEAR}${FMONTH}-cogo-tripdata.csv"
        LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"

        echo "downloading ${URL} to ${LOCAL_PATH}"
        mkdir -p ${LOCAL_PREFIX}
        wget ${URL} -O ${LOCAL_PATH}
        unzip ${LOCAL_PATH} ${LOCAL_CSV_FILE} -d ${LOCAL_PREFIX}
    done
done