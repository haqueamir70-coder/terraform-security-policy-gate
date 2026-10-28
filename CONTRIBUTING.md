# Contributing

Thanks for helping improve Terraform Security Policy Gate.

Before opening a pull request:
1. Explain the threat model or operational problem addressed.
2. Add a passing fixture and, where appropriate, a failing fixture.
3. Run Terraform formatting and validation for infrastructure changes.
4. Run `bash scripts/test-policies.sh` for policy changes.
5. Document exceptions with scope, rationale, owner, and expiry.

Do not commit credentials, state files, generated plans, or real secrets. Keep policy exceptions narrow and reviewable.
