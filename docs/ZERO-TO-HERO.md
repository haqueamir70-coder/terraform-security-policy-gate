# Zero-to-Hero Project Guide — Terraform policy-as-code gate

## 1. Business scenario
Manual review misses insecure IaC patterns. The pipeline needs repeatable policy tests before infrastructure can be approved.

## 2. Architecture and end-to-end flow
Terraform source → fmt/validate → Checkov source checks → plan JSON → OPA/Conftest Rego policies → positive/negative fixtures → PR decision.

## 3. Tool-by-tool inventory
Terraform, Checkov, OPA, Rego, Conftest, plan JSON, GitHub Actions, test fixtures.

## 4. What you must understand before implementation
Understand the business requirement and success criteria first. Then learn the relevant network/security primitives, identity model, service limits, configuration files, deployment lifecycle, observability signals and recovery strategy. For every tool, be able to explain: what problem it solves, why it was selected, what alternative exists, how it is configured, how it fails and how you verify it.

## 5. Implementation / operations sequence
1. Read the repository README, source files, Terraform modules, manifests and workflow YAML.
2. Map every resource and tool to the architecture diagram.
3. Run local formatting, validation, unit tests and static scans.
4. Review the plan/build artifact before any deployment.
5. Deploy only to an authorized sandbox with least-privilege identity.
6. Verify actual service behavior, network paths, security boundaries and monitoring.
7. Record evidence, cleanup steps, cost and rollback procedure.

## 6. Scenario-based interview questions and answers
**Q: Checkov vs OPA?** A: Checkov has built-in IaC checks; OPA lets teams define custom decisions over structured inputs such as plan JSON.

**Q: How test policy?** A: Provide compliant and violating fixtures; assert allow and deny paths and test edge cases.

**Q: Fail-open or fail-closed?** A: Critical controls should fail closed when evaluation fails; provide explicit exception workflow.

**Q: Static scan passed—secure?** A: No. Runtime identity, network, configuration drift and live service behavior still need verification.

## 7. Troubleshooting method
Start with the user-visible symptom; establish scope and recent changes; inspect logs/events/metrics; verify identity and permissions; verify DNS/network path; inspect resource limits and service health; isolate one layer at a time; mitigate safely; then document root cause and prevention.

## 8. Security, reliability and cost
Use least privilege, secret management, encrypted transport/storage, explicit network boundaries, patching/scanning, backups, actionable alerts, capacity planning and owner accountability. Estimate cost drivers before scaling or enabling verbose diagnostics.

## 9. Zero-to-Hero study plan
**Foundation:** Linux, Git, networking, YAML/JSON and cloud fundamentals.  
**Project tools:** learn each tool in the inventory and reproduce the repository workflow.  
**Hands-on:** deploy a disposable environment, break one component deliberately, diagnose it and restore service.  
**Interview:** explain the business scenario, diagram, tool choices, data/request flow, security controls, failure modes, cost trade-offs and evidence without reading notes.

## 10. Evidence and scope honesty
This guide is a learning and interview companion. The repository's code, workflow runs and deployment evidence determine what is implemented. Explicitly label each capability as implemented, CI-validated, cloud-deployed or planned. Never claim a tool is used in the live project merely because it appears in a conceptual architecture.
