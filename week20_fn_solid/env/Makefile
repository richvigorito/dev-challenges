# Run solutions for each language

PYTHON_FILE = solidify_these_files/srp_printer.py
GO_FILE     = solidify_these_files/ocp_pricing.go
CS_FILE     = solidify_these_files/lsp_vehicle.cs
JAVA_FILE   = solidify_these_files/isp_robot.java
TS_FILE     = solidify_these_files/dip_vending.ts

run-python:
	python3 $(PYTHON_FILE)

run-go:
	go run $(GO_FILE)

run-java:
	javac $(JAVA_FILE)
	java -cp solidify_these_files isp_robot

run-csharp:
	dotnet new console -o tmp_cs --force
	cp $(CS_FILE) tmp_cs/Program.cs
	cd tmp_cs && dotnet run
	rm -rf tmp_cs

run-ts:
	ts-node --compiler-options '{"module":"commonjs"}' $(TS_FILE)

# -------------------------------
# Test target: runs all scripts to ensure no errors
test: run-python run-go run-java run-csharp run-ts
	@echo "All scripts ran successfully ✅"
