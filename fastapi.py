from fastapi import FastAPI
import requests
import asyncio

app = FastAPI()

async def get_covid_data():
    url = "https://disease.sh/v3/covid-19/historical/USA?lastdays=30"

    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        return data
    except requests.exceptions.HTTPError as errh:
        return {"error": f"HTTP Error: {errh}"}
    except requests.exceptions.ConnectionError as errc:
        return {"error": f"Error Connecting: {errc}"}
    except requests.exceptions.Timeout as errt:
        return {"error": f"Timeout Error: {errt}"}
    except requests.exceptions.RequestException as err:
        return {"error": f"OOps: Something Else: {err}"}

@app.get("/covid-data")
async def read_covid_data():
    return await get_covid_data()

async def call_covid_data_periodically():
    while True:
        await asyncio.sleep(3600)  # Chờ 1 giờ (3600 giây)
        print("Fetching COVID data...")
        data = await get_covid_data()
        print(data)  # In dữ liệu lấy được

if __name__ == '__main__':
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8001)

    # Bắt đầu gọi liên tục hàm get_covid_data()
    asyncio.run(call_covid_data_periodically())
