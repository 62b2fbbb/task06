# --- General Config ---
location      = "North Europe"       # Найближчий і найдешевший для нас регіон
student_email = "zakhar@example.com" # Для тегів

# --- Naming Prefixes (щоб імена були унікальні) ---
# У завданні сказано використовувати locals для генерації, 
# тому тут ми задаємо базові префікси або повні імена, якщо логіка дозволяє.
# Але я пропишу прямі значення, щоб ти бачив, як це має виглядати в фіналі.

rg_name = "cmaz-5mhifrjl-mod6-rg"

# --- Existing Key Vault (Те, що типу вже існує) ---
# Увага: Оскільки це "існуючий" ресурс, Terraform буде намагатися його знайти.
# Якщо ти просто тестиш код без доступу до Azure, ці поля поки не важливі,
# але код впаде на етапі 'plan', якщо не знайде цей KV.
kv_rg_name = "cmaz-5mhifrjl-mod6-kv-rg"
kv_name    = "cmaz-5mhifrjl-mod6-kv"

# --- Key Vault Secret Names (Як ми назвемо секрети всередині) ---
sql_admin_secret_name     = "sql-admin-login"
sql_admin_secret_password = "sql-admin-password"

# --- SQL Database Config ---
sql_server_name = "cmaz-5mhifrjl-mod6-sql" # Має бути глобально унікальним!
sql_db_name     = "cmaz-5mhifrjl-mod6-sql-db"
sql_sku         = "S2" # Найдешевший варіант для лаб (або S0)
sql_fwr_name    = "allow-verification-ip"

# --- Web App Config ---
asp_name           = "cmaz-5mhifrjl-mod6-asp"
asp_sku            = "P0v3"                   # F1 = Free Tier (або B1, якщо треба стабільніше)
app_name           = "cmaz-5mhifrjl-mod6-app" # Має бути глобально унікальним!
app_dotnet_version = "8.0"                    # Або v8.0, залежить від вимог .NET стеку Error: expected site_config.0.application_stack.0.dotnet_version to be one of ["3.1" "5.0" "6.0" "7.0" "8.0"], got v6.0

# --- Network / Security ---
# Тут встав свою реальну IP адресу, щоб мати доступ з дому
# Дізнатись можна тут: https://ifconfig.me/
allowed_ip_address = "18.153.146.156"