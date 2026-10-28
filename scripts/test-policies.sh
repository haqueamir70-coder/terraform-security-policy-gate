#!/usr/bin/env bash
set -euo pipefail

POLICY_DIR="policy"
GOOD_FIXTURE="policy-tests/compliant.json"
BAD_FIXTURE="policy-tests/noncompliant.json"

echo "==> Testing compliant fixture (must pass)"
conftest test "$GOOD_FIXTURE" --policy "$POLICY_DIR"

echo "==> Testing non-compliant fixture (must be rejected)"
if conftest test "$BAD_FIXTURE" --policy "$POLICY_DIR"; then
  echo "ERROR: non-compliant fixture unexpectedly passed policy evaluation." >&2
  exit 1
else
  echo "PASS: non-compliant fixture was correctly rejected."
fi
