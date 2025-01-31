local function from_env()
	local host = "localhost"
	local username = os.getenv("POSTGRES_USER") or ""
	local password = (os.getenv("POSTGRES_PASSWORD") or ""):gsub("@", "%%40")
	local database = os.getenv("POSTGRES_DB") or ""
	local port = os.getenv("POSTGRES_PORT") or "5432"
	return string.format("postgresql://%s:%s@%s:%s/%s", username, password, host, port, database)
end

local function usegal()
	local host = "localhost"
	local username = "galaxy"
	local password = (os.getenv("VAULT_POSTGRES_PASSWORD") or ""):gsub("@", "%%40")
	local database = "galaxy"
	local port = "5434"
	return string.format("postgresql://%s:%s@%s:%s/%s", username, password, host, port, database)
end

vim.g.dbs = {
	{ name = "sis-dev", url = from_env() },
	{ name = "sis-staging", url = from_env() },
	{ name = "sis-prod", url = from_env() },
	{ name = "usegal-prod", url = usegal() },
}
