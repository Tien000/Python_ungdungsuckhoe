CREATE PROCEDURE [dbo].[InsertCovidData]
AS
BEGIN
    -- Chèn dữ liệu từ bảng covid_data vào bảng CovidRates (tên mới của bảng)
    INSERT INTO CovidRates (base_currency, target_currency, exchange_rate, updated_time)
    SELECT 
        'COVID-19' AS base_currency, 
        'cases' AS target_currency, 
        CAST(cases AS FLOAT) AS exchange_rate, 
        CONVERT(DATETIME, date) AS updated_time
    FROM 
        covid_data;

    INSERT INTO CovidRates (base_currency, target_currency, exchange_rate, updated_time)
    SELECT 
        'COVID-19' AS base_currency, 
        'deaths' AS target_currency, 
        CAST(deaths AS FLOAT) AS exchange_rate, 
        CONVERT(DATETIME, date) AS updated_time
    FROM 
        covid_data;
END;

);

INSERT INTO covid_data (date, cases, deaths)
VALUES
    ('2023-02-08', 102760211, 1113429),
    ('2023-02-09', 102842061, 1114385),
    ('2023-02-10', 102855101, 1114492),
    ('2023-02-11', 102859510, 1114529),
    ('2023-02-12', 102862879, 1114537),
    ('2023-02-13', 102886005, 1114709),
    ('2023-02-14', 102934224, 1115160),
    ('2023-02-15', 103023231, 1115741),
    ('2023-02-16', 103083910, 1116851),
    ('2023-02-17', 103131898, 1117572),
    ('2023-02-18', 103134605, 1117589),
    ('2023-02-19', 103136077, 1117590),
    ('2023-02-20', 103138119, 1117663),
    ('2023-02-21', 103198669, 1118025),
    ('2023-02-22', 103308832, 1118886),
    ('2023-02-23', 103365511, 1119521),
    ('2023-02-24', 103378408, 1119573),
    ('2023-02-25', 103381157, 1119587),
    ('2023-02-26', 103382763, 1119588),
    ('2023-02-27', 103399827, 1119582),
    ('2023-02-28', 103443455, 1119917),
    ('2023-03-01', 103533872, 1120897),
    ('2023-03-02', 103589757, 1121658),
    ('2023-03-03', 103648690, 1122165),
    ('2023-03-04', 103650837, 1122172),
    ('2023-03-05', 103646975, 1122134),
    ('2023-03-06', 103655539, 1122181),
    ('2023-03-07', 103690910, 1122516),
    ('2023-03-08', 103755771, 1123246),
    ('2023-03-09', 103802702, 1123836);
