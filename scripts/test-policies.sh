#!/usr/bin/env bash
set -euo pipefail

POLICY_DIR="policy"
GOOD_FIXTURE="policy-tests/compliant.json"
BAD_FIXTURE="policy-tests/noncompliant.json"

echo "==> Positive test: compliant storage account must PASS"
conftest test "$GOOD_FIXTURE" --policy "$POLICY_DIR"
echo "PASS: compliant fixture was accepted."

echo "==> Negative test: insecure storage account must FAIL policy evaluation"
if conftest test "$BAD_FIXTURE" --policy "$POLICY_DIR"; then
  echo "FAIL: insecure fixture unexpectedly passed. The security gate is not enforcing policy." >&2
  exit 1
else
  echo "PASS: insecure fixture was rejected as expected. The security gate is enforcing policy."
fi

echo "PASS: positive and negative policy tests completed."
